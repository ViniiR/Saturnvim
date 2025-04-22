vim.g.mapleader = " "
-- local luasnip = require("luasnip")

local map = vim.keymap.set
local demap = vim.keymap.del
local function noop() end

-- Normal mode
map("n", ";", ":", { noremap = true })
-- map("n", "<leader>e", vim.cmd.Ex, { desc = "Toggle netrw" })
map("n", "<C-c>", "<Esc>", { noremap = true })
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "General Clear highlights" })
map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })
-- map("n", "<Tab>", ":bnext <CR>")
-- map("n", "<S-Tab>", ":bprevious <CR>", { noremap = true, silent = true })
-- The primeagen bindings
map("n", "Y", "yg$", { noremap = true }) -- change this
map("n", "J", "mzJ`z", { noremap = true })
-- map("n", "<C-d>", "<C-d>zz", { noremap = true })
-- map("n", "<C-u>", "<C-u>zz", { noremap = true })
map("n", "n", "nzzzv", { noremap = true })
map("n", "N", "Nzzzv", { noremap = true })
map("n", "<leader>n", ":bnext<CR>", { noremap = true, silent = true })
map("n", "<leader>p", ":bprevious<CR>", { noremap = true, silent = true })
map("n", "<Tab>", function()
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
end, { noremap = true, silent = true })
map("n", "<C-z>", noop, { noremap = true, silent = true })
map("n", "<C-m>", noop, { noremap = true, silent = true })
--FIXME
map("n", "<leader>rr", function()
    vim.cmd("so ~/.config/nvim/init.lua")
    print("Resourced Neovim config")
end, { noremap = true, silent = true, desc = "Resources nvim config" })
map(
    "n",
    "<leader>gb",
    "<cmd>Gitsigns toggle_current_line_blame<CR>",
    { noremap = true, silent = true, desc = "Gitsigns toggle blame" }
)
--FIXME

-- Insert mode
map("i", "<C-H>", "<C-W>", { noremap = true })
map("i", "<C-Del>", "<C-o>dw", { noremap = true })
map("i", "<C-c>", "<Esc>", { noremap = true })
-- These two mappings end a small suffering i had, they are in conjunction with ./configs/cmp.lua mapping.Tab && S-Tab
-- to revert it, delete these lines and uncomment cmp mapping.Tab and S-Tab
-- map("i", "<C-k>", function()
--     if luasnip.jumpable(-1) then luasnip.jump(-1) end
-- end)
-- map("i", "<C-m>", function()
--     if luasnip.expand_or_jumpable() then luasnip.expand_or_jump() end
-- end)
--

-- Visual mode
map("v", "<C-c>", "<Esc>", { noremap = true })
map("v", ";", ":", { noremap = true })
-- the primeagen's bindings
map("v", "<C-j>", ":m '>+1<CR>gv=gv", { noremap = true })
map("v", "<C-k>", ":m '<-2<CR>gv=gv", { noremap = true })
map("v", "<leader>lr", function() vim.lsp.buf.rename() end, { noremap = true, silent = true, desc = "LSP rename" })

-- Command mode
map("c", "<C-h>", "<C-w>", { noremap = true })
map("c", "<C-Del>", "<C-W>", { noremap = true })
map("c", "<C-c>", "<C-c>", { noremap = true })
map("c", "<C-j>", "<Down>", { noremap = true })
map("c", "<C-k>", "<Up>", { noremap = true })
-- noop ; to prevent ;w file also prevents ; from ever being typed
-- map("c", ";", "<Nop>", { noremap = true, silent = true })

-- Terminal mode
map("t", "<C-\\><C-\\>", "<C-\\><C-N>", { noremap = true })

-- Delete
-- demap("n", "<Insert>")
-- demap("i", "<Insert>")
-- demap("c", "<Insert>")
-- demap("v", "<Insert>")
-- demap("t", "<Insert>")
