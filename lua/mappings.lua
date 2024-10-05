vim.g.mapleader = " "
local map = vim.keymap.set

vim.opt["tabstop"] = 4
vim.opt["shiftwidth"] = 4
vim.opt.spelllang = { "en_us" }
vim.opt.spell = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true

-- Normal mode
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle Nvim Tree", silent = true })
map("n", "<leader>e", vim.cmd.Ex)
map("n", ";", ":", { noremap = true, silent = true })
map("n", "<C-c>", "<Esc>", { noremap = true, silent = true })
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "General Clear highlights" })

-- Insert mode
map("i", "<C-H>", "<C-W>", { noremap = true, silent = true })
map("i", "<C-Del>", "<C-o>dw", { noremap = true, silent = true })
map("i", "<C-c>", "<Esc>", { noremap = true, silent = true })

-- Visual mode
map("v", "<C-c>", "<Esc>", { noremap = true, silent = true })

-- Command mode
map("c", "<C-H>", "<C-W>", { noremap = true, silent = true })
map("c", "<C-Del>", "<C-W>", { noremap = true, silent = true })
map("c", "<C-c>", "<C-c>", { noremap = true, silent = true })
