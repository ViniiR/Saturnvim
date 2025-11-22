local lib = require("mappings.lib")
local keys = lib.keys
local modes = lib.modes
local desc = lib.desc

---@param block string[] { block_start, block_end }
---@param block_finder_keypresses string
---before running "block_finder_keypresses" it sets the cursor on the line below the statement start
local function surround_block(block, block_finder_keypresses)
    local positions = {
        start_pos = {
            line = vim.fn.line("v"),
            -- column = vim.fn.col("v"),
        },
        end_pos = {
            line = vim.fn.line("."),
            -- column = vim.fn.col("."),
        },
    }
    if positions.start_pos.line > positions.end_pos.line then
        positions.start_pos.line, positions.end_pos.line = positions.end_pos.line, positions.start_pos.line
    end

    -- get the current block's indentation characters
    local start_line = vim.api.nvim_buf_get_lines(0, positions.start_pos.line - 1, positions.start_pos.line, false)[1]
        or ""
    local indent = start_line:match("^[ \t]*") or ""

    -- apply one indent level to the selected lines
    vim.cmd(string.format("%s,%s>", positions.start_pos.line, positions.end_pos.line))

    -- create statement around selection
    vim.fn.append(positions.start_pos.line - 1, indent .. block[1])
    vim.fn.append(positions.end_pos.line + 1, indent .. block[2])

    -- deselects text
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", false)

    -- set cursor at start of selection to standardize block_finder_keypresses start position
    vim.api.nvim_win_set_cursor(0, { positions.start_pos.line + 1, 0 })

    -- puts cursor on desired position
    vim.api.nvim_feedkeys(block_finder_keypresses, "n", false)
end

---@param surround table
---@return string, string, string
local function unpack_surround(surround)
    return surround.block_start, surround.block_end, surround.finder_command
end

local surround_blocks = {
    ecmascript = {
        if_statement = {
            block_start = "if (  ) {",
            block_end = "}",
            finder_command = "k_f(la",
        },
        function_statement = {
            block_start = "function () {",
            block_end = "}",
            finder_command = "k_f a",
        },
        for_statement = {
            block_start = "for (  ) {",
            block_end = "}",
            finder_command = "k_f lla",
        },
    },
    lua = {
        if_statement = {
            block_start = "if  then",
            block_end = "end",
            finder_command = "k_f a",
        },
        function_statement = {
            block_start = "local function ()",
            block_end = "end",
            finder_command = "k_2f a",
        },
        for_statement = {
            block_start = "for  in ipairs() do",
            block_end = "end",
            finder_command = "k_f a",
        },
    },
    rust = {
        if_statement = {
            block_start = "if  {",
            block_end = "}",
            finder_command = "k_f a",
        },
        function_statement = {
            block_start = "fn () {",
            block_end = "}",
            finder_command = "k_f a",
        },
        for_statement = {
            block_start = "for  in  {",
            block_end = "}",
            finder_command = "k_f a",
        },
    },
    gdscript = {
        if_statement = {
            block_start = "if  :",
            block_end = "",
            finder_command = "k_f a",
        },
        function_statement = {
            block_start = "func ():",
            block_end = "a",
            finder_command = "k_f a",
        },
        for_statement = {
            block_start = "for  :",
            block_end = "",
            finder_command = "k_f a",
        },
    },
    python = {
        if_statement = {
            block_start = "if  :",
            block_end = "",
            finder_command = "k_f a",
        },
        function_statement = {
            block_start = "def ():",
            block_end = "",
            finder_command = "k_f a",
        },
        for_statement = {
            block_start = "for  :",
            block_end = "",
            finder_command = "k_f a",
        },
    },
}

local mappings = {
    -- Normal mode
    {
        { modes.normal, modes.visual },
        ";",
        ":",
        desc.noremap("Bind semicolon to colon"),
    },
    {
        { modes.normal, modes.insert, modes.visual },
        keys.control("c"),
        keys.escape,
        desc.noremap("Bind Ctrl-c to escape"),
    },
    {
        modes.normal,
        keys.escape,
        function()
            vim.cmd("nohlsearch")
        end,
        desc.noremap("Normal mode Escape key"),
    },
    {
        modes.normal,
        keys.control("h"),
        keys.control("w", "h"),
        desc.desc("Switch window left"),
    },
    {
        modes.normal,
        keys.control("j"),
        keys.control("w", "j"),
        desc.desc("Switch window bottom"),
    },
    {
        modes.normal,
        keys.control("k"),
        keys.control("w", "k"),
        desc.desc("Switch window top"),
    },
    {
        modes.normal,
        keys.control("l"),
        keys.control("w", "l"),
        desc.desc("Switch window right"),
    },
    -- The Primeagen's mappings
    {
        modes.normal,
        "Y",
        "yg$",
        desc.noremap("Copy cursor positon to end of line without newline"),
    },
    -- {
    --     modes.normal,
    --     "yY",
    --     "mz0yyg$`z",
    --     desc.noremap("Copy current line without newline"),
    -- },
    {
        modes.normal,
        "J",
        "mzJ`z",
        desc.desc("Joins line below without moving cursor"),
    },
    -- map("n", "<C-d>", "<C-d>zz", { noremap = true })
    -- map("n", "<C-u>", "<C-u>zz", { noremap = true })
    {
        modes.normal,
        "n",
        "nzzzv",
        desc.desc("Center screen around next match"),
    },
    {
        modes.normal,
        "N",
        "Nzzzv",
        desc.desc("Center screen around previous match"),
    },
    -- end of The Primeagen's mappings
    {
        modes.normal,
        keys.leader("n"),
        function()
            vim.cmd("bnext")
        end,
        desc.noremap_silent("Jump to next buffer"),
    },
    {
        modes.normal,
        keys.leader("p"),
        function()
            vim.cmd("bprevious")
        end,
        desc.noremap_silent("Jump to previous buffer"),
    },
    {
        modes.normal,
        keys.tab,
        function()
            local prev_buf = vim.fn.bufnr("#")
            if prev_buf < 1 and not vim.api.nvim_buf_is_valid(prev_buf) then
                vim.notify("No previous buffer attached", vim.log.levels.WARN)
                return
            end

            local buf = vim.fn.bufname("%")
            local last_buf = vim.fs.basename(buf)

            if not vim.api.nvim_buf_is_loaded(prev_buf) then
                vim.notify("Previous buffer is unloaded", vim.log.levels.WARN)
                return
            end

            vim.cmd("b#")

            buf = vim.fn.bufname("%")
            local current_buf = vim.fs.basename(buf)

            print("Moved from: |" .. last_buf .. "| into: |" .. current_buf .. "|")
        end,
        desc.noremap_silent("Jump to last active buffer"),
    },
    {
        modes.normal,
        keys.control("z"),
        keys.no_operation,
        desc.noremap_silent("Disable Ctrl + Z"),
    },
    {
        modes.normal,
        keys.control("m"),
        keys.no_operation,
        desc.noremap_silent("Disable Ctrl + M"),
    },
    -- {
    --     -- FIXME: broken
    --     modes.normal,
    --     keys.leader("rr"),
    --     function()
    --         vim.cmd(" so ~/.config/nvim/init.lua")
    --         print("Reloaded Neovim config")
    --     end,
    --     desc.noremap_silent("Reload Neovim config"),
    -- },
    {
        modes.normal,
        keys.leader("rc"),
        function()
            local query = vim.fn.input("Rust crate info: ")
            if query == "" then
                return
            end

            local res = vim.system({ "cargo-info", "info", query }, { text = true }):wait()

            if res.code ~= 0 then
                vim.notify("Rust cargo-info " .. res.stderr, vim.log.levels.ERROR)
                return
            end
            local lines = vim.split(res.stdout, "\n", { trimempty = true })
            for i, line in ipairs(lines) do
                lines[i] = " " .. line .. " "
            end

            table.insert(lines, 1, "   ")
            table.insert(lines, "   ")

            local buf = vim.api.nvim_create_buf(false, true)
            vim.bo[buf].filetype = "toml"

            local height = #lines
            local width = 0
            for _, line in ipairs(lines) do
                local len = vim.fn.strdisplaywidth(line)
                if len > width then
                    width = len
                end
            end
            local ui = vim.api.nvim_list_uis()[1]
            local row = math.floor((ui.height - height) / 2)
            local col = math.floor((ui.width - width) / 2)

            local win = vim.api.nvim_open_win(buf, true, {
                relative = "editor",
                title = string.format(" %s Crate-Info ", CRATE_ICON),
                title_pos = "left",
                border = BORDER_KIND,
                style = "minimal",
                height = height,
                width = width,
                row = row,
                col = col,
            })

            vim.keymap.set("n", "q", function()
                vim.api.nvim_win_close(win, true)
            end, { buffer = buf, nowait = true, silent = true })
            vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
        end,
        desc.noremap("Rust crate info"),
    },
    {
        -- TODO: possibly useless
        modes.normal,
        keys.func["10"],
        function()
            if vim.fn.filereadable("./Run.sh") == 0 then
                vim.notify('File "./Run.sh" does not exist.', vim.log.levels.WARN)
                return
            end

            vim.system({ "./Run.sh" }, { text = true }, function(out)
                if out.code ~= 0 then
                    local err_string = string.format('Failed to execute "./Run.sh", Error code: %d.', out.code)

                    -- You may use "echo ... >&2 to display an error"
                    if #out.stderr > 0 then
                        err_string = string.format(
                            'Failed to execute "./Run.sh", Error code: %d, "%s".',
                            out.code,
                            out.stderr:gsub("\n", "")
                        )
                    end

                    vim.schedule(function()
                        vim.notify(err_string, vim.log.levels.WARN)
                    end)

                    return
                end

                vim.print('Executed "./Run.sh" with success.')
            end)
        end,
        desc.noremap_silent("Execute ./Run.sh"),
    },
    {
        modes.normal,
        keys.control(keys.delete),
        keys.no_operation,
        desc.noremap("Disable normal mode Ctrl + Del"),
    },

    -- Insert mode
    {
        { modes.insert, modes.command },
        keys.control_backspace,
        keys.control("w"),
        desc.noremap("Ctrl + backspace delete word backwards"),
    },
    {
        -- FIXME: doesnt work in command mode
        modes.insert,
        keys.control(keys.delete),
        keys.control("o", "dw"),
        desc.noremap("Ctrl + delete delete word"),
    },
    -- These two mappings end a small suffering i had, they are in conjunction with ./configs/cmp.lua mapping.Tab && S-Tab
    -- to revert it, delete these lines and uncomment cmp mapping.Tab and S-Tab
    -- it prevents tab from jumping to snippets $1 instead of outputting a <Tab>
    -- map("i", "<C-k>", function()
    --     if luasnip.jumpable(-1) then luasnip.jump(-1) end
    -- end)
    -- map("i", "<C-m>", function()
    --     if luasnip.expand_or_jumpable() then luasnip.expand_or_jump() end
    -- end)

    -- Visual mode
    -- the Primeagen's mappings
    {
        modes.visual,
        keys.control("j"),
        ":m '>+1<CR>gv=gv",
        desc.noremap("Moves current line down"),
    },
    {
        modes.visual,
        keys.control("k"),
        ":m '<-2<CR>gv=gv",
        desc.noremap("Moves current line up"),
    },
    {
        modes.visual,
        keys.leader("lr"),
        function()
            vim.lsp.buf.rename()
        end,
        desc.noremap_silent("LSP rename"),
    },
    -- end of the Primeagen's mappings
    -- Surround mappings
    {
        modes.visual,
        keys.leader("si"),
        function()
            -- defaults to ecmascript if statements
            local block_start, block_end, finder_command = unpack_surround(surround_blocks.ecmascript.if_statement)

            if vim.bo.filetype == "lua" then
                block_start, block_end, finder_command = unpack_surround(surround_blocks.lua.if_statement)
            elseif vim.bo.filetype == "rust" then
                block_start, block_end, finder_command = unpack_surround(surround_blocks.rust.if_statement)
            elseif vim.bo.filetype == "gdscript" then
                block_start, block_end, finder_command = unpack_surround(surround_blocks.gdscript.if_statement)
            elseif vim.bo.filetype == "python" then
                block_start, block_end, finder_command = unpack_surround(surround_blocks.python.if_statement)
            end

            surround_block({ block_start, block_end }, finder_command)
        end,
        desc.noremap_silent("Surround selection with an if statement"),
    },
    {
        modes.visual,
        keys.leader("sfu"),
        function()
            -- defaults to ecmascript function statements
            local block_start, block_end, finder_command = unpack_surround(surround_blocks.ecmascript.function_statement)

            if vim.bo.filetype == "lua" then
                block_start, block_end, finder_command = unpack_surround(surround_blocks.lua.function_statement)
            elseif vim.bo.filetype == "rust" then
                block_start, block_end, finder_command = unpack_surround(surround_blocks.rust.function_statement)
            elseif vim.bo.filetype == "gdscript" then
                block_start, block_end, finder_command = unpack_surround(surround_blocks.gdscript.function_statement)
            elseif vim.bo.filetype == "python" then
                block_start, block_end, finder_command = unpack_surround(surround_blocks.python.function_statement)
            end

            surround_block({ block_start, block_end }, finder_command)
        end,
        desc.noremap_silent("Surround selection with a function statement"),
    },
    {
        modes.visual,
        keys.leader("sfo"),
        function()
            -- defaults to ecmascript for statements
            local block_start, block_end, finder_command = unpack_surround(surround_blocks.ecmascript.for_statement)

            if vim.bo.filetype == "lua" then
                block_start, block_end, finder_command = unpack_surround(surround_blocks.lua.for_statement)
            elseif vim.bo.filetype == "rust" then
                block_start, block_end, finder_command = unpack_surround(surround_blocks.rust.for_statement)
            elseif vim.bo.filetype == "gdscript" then
                block_start, block_end, finder_command = unpack_surround(surround_blocks.gdscript.for_statement)
            elseif vim.bo.filetype == "python" then
                block_start, block_end, finder_command = unpack_surround(surround_blocks.python.for_statement)
            end

            surround_block({ block_start, block_end }, finder_command)
        end,
        desc.noremap_silent("Surround selection with a for statement"),
    },
    -- -- INFO: disabled since rustup doc doesn't work on nixos
    -- -- rusty-man doesn't work without rustup either
    -- {
    --     modes.visual,
    --     keys.leader("rd"),
    --     function()
    --         vim.cmd('normal!"zy')
    --         local text = vim.fn.getreg("z")
    --         local input = vim.fn.input("Search for: ", text)
    --         vim.system({ "rustup", "doc", input }, { text = true }, function(out)
    --             vim.schedule(function()
    --                 if out.code ~= 0 then
    --                     vim.notify("Rustup doc " .. out.stderr, vim.log.levels.ERROR)
    --                     return
    --                 end
    --                 print("Opening documentation with firefox...")
    --             end)
    --         end)
    --     end,
    --     desc.noremap("Rust stdlib documentation"),
    -- },

    -- Command mode
    {
        modes.command,
        keys.control("c"),
        keys.control("c"),
        desc.noremap("TODO: is this really necessary?"),
    },
    {
        modes.command,
        keys.control("j"),
        keys.control(keys.arrow_down),
        desc.noremap("History search next"),
    },
    {
        modes.command,
        keys.control("k"),
        keys.control(keys.arrow_up),
        desc.noremap("History search previous"),
    },
    -- noop ; to prevent ;w file also prevents ; from ever being typed
    -- map("c", ";", "<Nop>", { noremap = true, silent = true })
}

return function()
    for _, mapping in ipairs(mappings) do
        local mode = mapping[1]
        local lhs = mapping[2]
        local rhs = mapping[3]
        local opts = mapping[4]
        vim.keymap.set(mode, lhs, rhs, opts)
    end
end
