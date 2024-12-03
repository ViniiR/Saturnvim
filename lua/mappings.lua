vim.g.mapleader = " "

local map = vim.keymap.set
local demap = vim.keymap.del

map("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "Toggle Debugger Breakpoint" })
-- map("n", "<leader>du", function()
--     local widgets = require("dap.ui.widgets")
--     local sidebar = widgets.sidebar(widgets.scopes)
--     sidebar.open()
-- end)

-- Normal mode
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle Nvim Tree" })
-- map("n", "<leader>e", vim.cmd.Ex, { desc = "Toggle netrw" })
map("n", ";", ":", { noremap = true })
map("n", "<C-c>", "<Esc>", { noremap = true })
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "General Clear highlights" })
map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })
map("n", "<leader>tr", ":NvimTreeRefresh<CR>", { noremap = true, desc = "Nvim Tree Refresh" })
-- map("n", "<Tab>", ":bnext <CR>")
-- map("n", "<S-Tab>", ":bprevious <CR>", { noremap = true, silent = true })
-- The primeagen bindings
map("n", "Y", "yg$", { noremap = true }) -- change this
map("n", "J", "mzJ`z", { noremap = true })
map("n", "<C-d>", "<C-d>zz", { noremap = true })
map("n", "<C-u>", "<C-u>zz", { noremap = true })
map("n", "n", "nzzzv", { noremap = true })
map("n", "N", "Nzzzv", { noremap = true })
map("n", "<C-z>", function() end, { noremap = true, silent = true })

-- Insert mode
map("i", "<C-H>", "<C-W>", { noremap = true })
map("i", "<C-Del>", "<C-o>dw", { noremap = true })
map("i", "<C-c>", "<Esc>", { noremap = true })

-- Visual mode
map("v", "<C-c>", "<Esc>", { noremap = true })
map("v", ";", ":", { noremap = true })
-- the primeagen's bindings
map("v", "<C-j>", ":m '>+1<CR>gv=gv", { noremap = true })
map("v", "<C-k>", ":m '<-2<CR>gv=gv", { noremap = true })

-- Command mode
map("c", "<C-h>", "<C-w>", { noremap = true })
map("c", "<C-Del>", "<C-W>", { noremap = true })
map("c", "<C-c>", "<C-c>", { noremap = true })
map("c", "<C-j>", "<Down>", { noremap = true })
map("c", "<C-k>", "<Up>", { noremap = true })
-- noop ; to prevent ;w file
map("c", ";", "<Nop>", { noremap = true, silent = true })

-- Terminal mode
map("t", "<C-\\><C-\\>", "<C-\\><C-N>", { noremap = true })

-- Delete
-- demap("n", "<Insert>")
-- demap("i", "<Insert>")
-- demap("c", "<Insert>")
-- demap("v", "<Insert>")
-- demap("t", "<Insert>")
