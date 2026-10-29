local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

autocmd("BufEnter", {
    callback = function()
        -- Overrides gdscript.vim's use of Tabs instead of Spaces
        if vim.bo.filetype == "gdscript" then
            vim.defer_fn(function()
                vim.opt.expandtab = true
            end, 10)
        end
    end,
})

-- Copied from "https://github.com/ThorstenRhau/neovim/blob/main/lua/config/autocmds.lua"
-- Close certain filetypes with q
-- Note: 'man' is excluded because Neovim has built-in q handling for man pages
autocmd("FileType", {
    group = augroup("close_with_q", { clear = true }),
    pattern = {
        "checkhealth",
        "git",
        "gitsigns-blame",
        "help",
        "lspinfo",
        "notify",
        "qf",
        "startuptime",
    },
    callback = function(event)
        vim.bo[event.buf].buflisted = false
        vim.keymap.set("n", "q", function()
            local ok = pcall(vim.cmd.bdelete, { bang = true })
            if not ok then
                vim.cmd.quit()
            end
        end, { buffer = event.buf, silent = true, desc = "Close buffer" })
    end,
})

-- TODO: possibly doesn't work in rust
-- seems to use too much cpu
-- autocmd("LspAttach", {
--     pattern = "*",
--     callback = function(_)
--         vim.keymap.set("n", "<leader>lo", function()
--             local filetype = vim.bo.filetype
--             local is_ecma = filetype == "typescript"
--                 or filetype == "typescriptreact"
--                 or filetype == "javascript"
--                 or filetype == "javascriptreact"
--             local is_rust = filetype == "rust"
--
--             if is_ecma then
--                 vim.lsp.buf.execute_command({
--                     command = "_typescript.organizeImports",
--                     arguments = { vim.api.nvim_buf_get_name(0) },
--                 })
--             elseif is_rust then
--                 vim.lsp.buf.code_action({
--                     context = { diagnostics = {}, only = { "source.organizeImports" } },
--                     apply = true,
--                 })
--             end
--         end, { desc = "LSP Organize imports", silent = true, noremap = true })
--     end,
-- })


-- Fully AI written function, works perfectly but is probably way slower than should be
-- although it highlights it instantaneously (even faster than semantic tokens)
local ns = vim.api.nvim_create_namespace("ZigFormatHighlights")
autocmd({ "BufEnter", "BufWritePost", "TextChanged", "TextChangedI" }, {
    pattern = "*.zig",
    callback = function(args)
        local bufnr = args.buf or 0
        -- Clear previous extmarks for this namespace to avoid duplication on change
        vim.api.nvim_buf_clear_namespace(bufnr, ns, 0, -1)

        local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)

        for row, line in ipairs(lines) do
            local line_idx = row - 1

            -- 1. Find all double-quoted strings on the line using Lua position captures `()`
            for s_quote, e_quote in line:gmatch('()"[^"]*"()') do
                local quoted_str = line:sub(s_quote, e_quote - 1)

                -- 2. Within each string, scan and skip any `{...}` blocks that contain nested or double braces (`{{` or `}}`)
                local idx = 1
                while idx <= #quoted_str do
                    local s = quoted_str:find("{", idx)
                    if not s then
                        break
                    end

                    -- Check if it's a double/escaped brace `{{`
                    if quoted_str:sub(s + 1, s + 1) == "{" then
                        local depth = 0
                        local e = nil
                        local j = s
                        while j <= #quoted_str do
                            if quoted_str:sub(j, j + 1) == "{{" then
                                depth = depth + 1
                                j = j + 2
                            elseif quoted_str:sub(j, j + 1) == "}}" then
                                depth = depth - 1
                                if depth == 0 then
                                    e = j + 1
                                    break
                                end
                                j = j + 2
                            else
                                j = j + 1
                            end
                        end
                        idx = e and (e + 1) or (s + 2)
                    else
                        -- Single `{`, check for nesting or double closing `}}`
                        local depth = 0
                        local e = nil
                        local invalid = false

                        for j = s, #quoted_str do
                            local char = quoted_str:sub(j, j)
                            local next_char = quoted_str:sub(j + 1, j + 1)

                            if char == "{" then
                                if next_char == "{" then
                                    invalid = true
                                end
                                depth = depth + 1
                                if depth > 1 then
                                    invalid = true
                                end
                            elseif char == "}" then
                                if next_char == "}" then
                                    invalid = true
                                end
                                depth = depth - 1
                                if depth == 0 then
                                    e = j
                                    break
                                end
                            end
                        end

                        if e and not invalid then
                            local full_brace = quoted_str:sub(s, e)
                            local brace_start_rel = s
                            local brace_end_rel = e + 1

                            -- Absolute column start/end on the line for the full braces (Special)
                            local abs_brace_start = s_quote + brace_start_rel - 2
                            local abs_brace_end = s_quote + brace_end_rel - 2

                            -- Highlight the opening `{` with "Special"
                            vim.api.nvim_buf_set_extmark(bufnr, ns, line_idx, abs_brace_start, {
                                end_col = abs_brace_start + 1,
                                hl_group = "Special",
                                priority = 110,
                            })

                            -- Highlight the closing `}` with "Special"
                            vim.api.nvim_buf_set_extmark(bufnr, ns, line_idx, abs_brace_end - 1, {
                                end_col = abs_brace_end,
                                hl_group = "Special",
                                priority = 110,
                            })

                            -- Extract the inner content part (everything strictly inside the braces)
                            local inner_text = full_brace:match("^{%s*(.-)%s*}$")
                            if inner_text and inner_text ~= "" then
                                local inner_sub = quoted_str:sub(brace_start_rel + 1, brace_end_rel - 2)
                                local inner_col_start = s_quote + brace_start_rel - 1

                                local current_start = nil
                                local current_type = nil
                                local has_seen_colon = false

                                for i = 1, #inner_sub + 1 do
                                    local char = i <= #inner_sub and inner_sub:sub(i, i) or ""
                                    local is_special = (char == "?" or char == "!")
                                    local is_colon = (char == ":")

                                    if is_special or is_colon or char == "" then
                                        if current_start then
                                            local v_start = inner_col_start + (current_start - 1)
                                            local v_end = inner_col_start + (i - 1)
                                            if v_end > v_start then
                                                vim.api.nvim_buf_set_extmark(bufnr, ns, line_idx, v_start, {
                                                    end_col = v_end,
                                                    hl_group = current_type,
                                                    priority = 115,
                                                })
                                            end
                                            current_start = nil
                                            current_type = nil
                                        end

                                        if is_special or is_colon then
                                            if is_colon then
                                                has_seen_colon = true
                                            end
                                            local s_char_col = inner_col_start + (i - 1)
                                            vim.api.nvim_buf_set_extmark(bufnr, ns, line_idx, s_char_col, {
                                                end_col = s_char_col + 1,
                                                hl_group = "Special",
                                                priority = 115,
                                            })
                                        end
                                    else
                                        local target_type = has_seen_colon and "Number" or "CustomVVariable"
                                        if not current_start then
                                            current_start = i
                                            current_type = target_type
                                        elseif current_type ~= target_type then
                                            local v_start = inner_col_start + (current_start - 1)
                                            local v_end = inner_col_start + (i - 1)
                                            if v_end > v_start then
                                                vim.api.nvim_buf_set_extmark(bufnr, ns, line_idx, v_start, {
                                                    end_col = v_end,
                                                    hl_group = current_type,
                                                    priority = 115,
                                                })
                                            end
                                            current_start = i
                                            current_type = target_type
                                        end
                                    end
                                end
                            end

                            idx = e + 1
                        else
                            idx = s + 1
                        end
                    end
                end
            end
        end
    end,
})
