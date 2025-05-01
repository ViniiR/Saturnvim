local lib = require("mappings.lib")
local keys = lib.keys
local modes = lib.modes
local desc = lib.desc

local mappings = {
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
    -- {
    --     -- FIXME: broken
    --     modes.visual,
    --     keys.control("j"),
    --     function()
    --         -- map("v", "<C-j>", ":m '>+1<CR>gv=gv", { noremap = true })
    --         vim.cmd("m '>+1<CR>gv=gv")
    --     end,
    --     desc.noremap("Moves current line down"),
    -- },
    -- {
    --     -- FIXME: broken
    --     modes.visual,
    --     keys.control("k"),
    --     function()
    --         -- map("v", "<C-k>", ":m '<-2<CR>gv=gv", { noremap = true })
    --         vim.cmd("m '<-2<CR>gv=gv")
    --     end,
    --     desc.noremap("Moves current line up"),
    -- },
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
