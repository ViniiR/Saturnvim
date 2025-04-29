local telescope_builtin = require("telescope.builtin")
local harpoon = require("harpoon")
local dap = require("dap")
local conform = require("conform")

local lib = require("mappings.lib")
local keys = lib.keys
local modes = lib.modes
local desc = lib.desc

local mappings = {
    undotree = {
        {
            modes.normal,
            keys.leader("tt"),
            function() vim.cmd("UndotreeToggle") end,
            desc.desc("Toggle undotree"),
        },
    },
    oil = {
        {
            modes.normal,
            "-",
            function() vim.cmd("Oil") end,
            desc.desc("Open parent directory"),
        },
    },
    conform = {
        {
            modes.normal,
            keys.leader("fm"),
            function()
                conform.format({ lsp_fallback = true })
                print("Conform Formatted")
            end,
            desc.desc("General Format file"),
        },
        {
            modes.normal,
            keys.leader("mm"),
            function()
                conform.format({ lsp_fallback = true })
                print("Conform Formatted")
            end,
            desc.desc("General Format file"),
        },
    },
    dap = {
        {
            modes.normal,
            keys.leader("db"),
            dap.toggle_breakpoint,
            desc.noremap_silent("Debugger toggle breakpoint"),
        },
        {
            modes.normal,
            keys.leader("dc"),
            dap.continue,
            desc.noremap_silent("Debugger continue"),
        },
        {
            modes.normal,
            keys.leader("dx"),
            dap.clear_breakpoints,
            desc.noremap_silent("Debugger clear breakpoints"),
        },
    },
    telescope = {
        {
            modes.normal,
            keys.leader("ff"),
            telescope_builtin.find_files,
            desc.desc("Telescope find files"),
        },
        {
            modes.normal,
            keys.leader("fw"),
            telescope_builtin.live_grep,
            desc.desc("Telescope live grep"),
        },
        {
            modes.normal,
            keys.leader("fb"),
            telescope_builtin.buffers,
            desc.desc("Telescope find open buffers"),
        },
        {
            -- clone of builtin.buffers for convenience
            modes.normal,
            keys.leader("bb"),
            telescope_builtin.buffers,
            desc.desc("Telescope find open buffers"),
        },
        {
            modes.normal,
            keys.leader("ft"),
            telescope_builtin.help_tags,
            desc.desc("Telescope help tags"),
        },
        {
            modes.normal,
            keys.leader("fh"),
            function() vim.cmd("Telescope highlights") end,
            desc.desc("Telescope find highlights"),
        },
        {
            modes.normal,
            keys.leader("fa"),
            function() vim.cmd("Telescope find_files follow=true no_ignore=true hidden=true") end,
            desc.desc("Telescope find all files"),
        },
    },
    harpoon = {
        {
            -- map("n", "<M-e>", function() toggle_telescope(harpoon:list()) end, { desc = "Open harpoon window" })
            -- map("i", "<M-e>", function() toggle_telescope(harpoon:close_menu()) end, { desc = "Open harpoon window" })
            modes.normal,
            keys.alt("e"),
            function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
            desc.desc("Open harpoon window"),
        },
        {
            modes.normal,
            keys.leader("a"),
            function() harpoon:list():add() end,
            desc.desc("Mark file on harpoon"),
        },
        {
            modes.normal,
            keys.leader("x"),
            function() harpoon:list():remove() end,
            desc.desc("Unmark file on harpoon"),
        },
        { modes.normal, keys.alt("h"), function() harpoon:list():select(1) end },
        { modes.normal, keys.alt("j"), function() harpoon:list():select(2) end },
        { modes.normal, keys.alt("k"), function() harpoon:list():select(3) end },
        { modes.normal, keys.alt("l"), function() harpoon:list():select(4) end },
        { modes.normal, keys.alt("ç"), function() harpoon:list():select(5) end },
        { modes.normal, keys.alt(";"), function() harpoon:list():select(5) end },
        { modes.normal, keys.alt("u"), function() harpoon:list():select(6) end },
        { modes.normal, keys.alt("i"), function() harpoon:list():select(7) end },
        { modes.normal, keys.alt("o"), function() harpoon:list():select(8) end },
        { modes.normal, keys.alt("p"), function() harpoon:list():select(9) end },
    },
    editor = {
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
            function() vim.cmd("noh") end,
            desc.noremap("General Clear highlights"),
        },
        {
            modes.normal,
            keys.control("h"),
            keys.control("W", "h"),
            desc.desc("Switch window left"),
        },
        {
            modes.normal,
            keys.control("j"),
            keys.control("W", "j"),
            desc.desc("Switch window bottom"),
        },
        {
            modes.normal,
            keys.control("k"),
            keys.control("W", "k"),
            desc.desc("Switch window top"),
        },
        {
            modes.normal,
            keys.control("l"),
            keys.control("W", "l"),
            desc.desc("Switch window right"),
        },
        -- The Primeagen's bindings
        {
            modes.normal,
            "Y",
            "yg$",
            desc.noremap("Copy cursor positon to end of line without newline"),
        },
        {
            modes.normal,
            "YY",
            "mzyyg$`z",
            desc.noremap("Copy current line without newline"),
        },
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
        -- end of The Primeagen's bindings
        {
            modes.normal,
            keys.leader("n"),
            function() vim.cmd("bnext") end,
            desc.noremap_silent("Jump to next buffer"),
        },
        {
            modes.normal,
            keys.leader("p"),
            function() vim.cmd("bprevious") end,
            desc.noremap_silent("Jump to previous buffer"),
        },
        {
            modes.normal,
            keys.tab,
            function()
                local prev_buf = vim.fn.bufnr("#")
                if prev_buf < 1 and not vim.api.nvim_buf_is_valid(prev_buf) then
                    print("No previous buffer attached")
                    return
                end
                local buf = vim.fn.bufname("%")
                local last_buf = vim.fs.basename(buf)

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
        {
            -- FIXME: broken
            modes.normal,
            keys.leader("rr"),
            function()
                vim.cmd(" so ~/.config/nvim/init.lua")
                print("Reloaded Neovim config")
            end,
            desc.noremap_silent("Reload Neovim config"),
        },
        {
            modes.normal,
            keys.leader("gd"),
            function() vim.cmd("Gitsigns toggle_current_line_blame") end,
            desc.noremap_silent("Gitsigns toggle blame"),
        },

        -- Insert mode
        {
            { modes.insert, modes.command },
            keys.control_backspace,
            keys.control("W"),
            desc.noremap("Ctrl + backspace delete word backwards"),
        },
        {
            -- FIXME: doesnt work in command mode
            { modes.insert, modes.command },
            keys.control(keys.delete),
            keys.control("o", "dw"),
            desc.noremap("Ctrl + delete delete word"),
        },
        -- These two mappings end a small suffering i had, they are in conjunction with ./configs/cmp.lua mapping.Tab && S-Tab
        -- to revert it, delete these lines and uncomment cmp mapping.Tab and S-Tab
        -- map("i", "<C-k>", function()
        --     if luasnip.jumpable(-1) then luasnip.jump(-1) end
        -- end)
        -- map("i", "<C-m>", function()
        --     if luasnip.expand_or_jumpable() then luasnip.expand_or_jump() end
        -- end)

        -- Visual mode
        -- the Primeagen's bindings
        {
            -- FIXME: broken
            modes.visual,
            keys.control("j"),
            function()
                -- map("v", "<C-j>", ":m '>+1<CR>gv=gv", { noremap = true })
                vim.cmd("m '>+1<CR>gv=gv")
            end,
            desc.noremap("Moves current line down"),
        },
        {
            -- FIXME: broken
            modes.visual,
            keys.control("k"),
            function()
                -- map("v", "<C-k>", ":m '<-2<CR>gv=gv", { noremap = true })
                vim.cmd("m '<-2<CR>gv=gv")
            end,
            desc.noremap("Moves current line up"),
        },
        {
            modes.visual,
            keys.leader("lr"),
            function() vim.lsp.buf.rename() end,
            desc.noremap_silent("LSP rename"),
        },
        -- end of the Primeagen's bindings

        -- Command mode
        {
            modes.command,
            keys.control("c"),
            keys.control("c"),
            desc.noremap("TODO: im not exactly sure why it exists but works"),
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

        -- Terminal mode
        -- TODO: possibly deprecated due to now using toggleterm
        -- {
        --     --vim.keymap.set("t", "<C-\\><C-\\>", "<C-\\><C-N>", { noremap = true })
        --     modes.command,
        --     keys.control("\\", keys.control("\\")),
        --     keys.control("\\", keys.control("N")),
        --     desc.noremap("TODO:"),
        -- },
    },
    lspconfig = {
        --local function opts(desc) return { buffer = bufnr, desc = "LSP " .. desc } end
        {
            modes.normal,
            "gD",
            vim.lsp.buf.declaration,
            desc.desc("LSP Go to declaration"),
        },
        {
            modes.normal,
            "gd",
            vim.lsp.buf.definition,
            desc.desc("LSP Go to definition"),
        },
        {
            modes.normal,
            "gi",
            vim.lsp.buf.implementation,
            desc.desc("LSP Go to implementation"),
        },
        {
            modes.normal,
            keys.leader("sh"),
            vim.lsp.buf.signature_help,
            desc.desc("LSP Show signature help"),
        },
        {
            modes.normal,
            keys.leader("wa"),
            vim.lsp.buf.add_workspace_folder,
            desc.desc("LSP Add workspace folder"),
        },
        {
            modes.normal,
            keys.leader("wr"),
            vim.lsp.buf.remove_workspace_folder,
            desc.desc("LSP Remove workspace folder"),
        },
        {
            modes.normal,
            keys.leader("wl"),
            function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
            desc.desc("LSP List workspace folder"),
        },
        {
            modes.normal,
            keys.leader("D"),
            vim.lsp.buf.type_definition,
            desc.desc("LSP Go to type definition"),
        },
        {
            { modes.normal, modes.visual },
            keys.leader("la"),
            vim.lsp.buf.code_action,
            desc.desc("LSP Code action"),
        },
        {
            modes.normal,
            "gr",
            vim.lsp.buf.references,
            desc.desc("LSP Show references"),
        },
        {
            modes.normal,
            "[d",
            function()
                vim.diagnostic.goto_prev()
                vim.diagnostic.open_float()
            end,
            desc.desc("LSP Go to previous diagnostic"),
        },
        {
            modes.normal,
            "]d",
            function()
                vim.diagnostic.goto_next()
                vim.diagnostic.open_float()
            end,
            desc.desc("LSP Go to next diagnostic"),
        },
        {
            modes.normal,
            keys.control("W", "d"),
            function() vim.diagnostic.open_float() end,
            desc.desc("LSP Open current line diagnostics"),
        },
    },
}

return mappings
