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
