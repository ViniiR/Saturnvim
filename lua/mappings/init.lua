local border_settings = require("settings.border")

local lib = require("mappings.lib")
local keys = lib.keys
local modes = lib.modes
local desc = lib.desc

local surround_lib = require("mappings.lib.surround")

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

            print("Moved into: |" .. current_buf .. "| from: |" .. last_buf .. "|")
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
                title = string.format(" %s Crate-Info ", require("plugins._crates-nvim.icons").crate),
                title_pos = "left",
                border = border_settings.kind,
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
        keys.func[10],
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
    -- end of the Primeagen's mappings
    -- Surround mappings
    {
        modes.visual,
        keys.leader("si"),
        function()
            local block_start, block_end, finder_command = surround_lib.from_filetype("if_statement")

            surround_lib.create({ block_start, block_end }, finder_command)
        end,
        desc.noremap_silent("Surround selection with an if statement"),
    },
    {
        modes.visual,
        keys.leader("sfu"),
        function()
            local block_start, block_end, finder_command = surround_lib.from_filetype("function_statement")

            surround_lib.create({ block_start, block_end }, finder_command)
        end,
        desc.noremap_silent("Surround selection with a function statement"),
    },
    {
        modes.visual,
        keys.leader("sfo"),
        function()
            local block_start, block_end, finder_command = surround_lib.from_filetype("for_statement")

            surround_lib.create({ block_start, block_end }, finder_command)
        end,
        desc.noremap_silent("Surround selection with a for statement"),
    },

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

function mappings:setup()
    lib.setup(self)
end

return mappings
