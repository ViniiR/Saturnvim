vim.g.mapleader = " ";
local map = vim.keymap.set;

-- Personal
map("n", "<leader>e" ,vim.cmd.Ex);
map("n", ";", ":", {noremap = true});
vim.opt["tabstop"] = 4
vim.opt["shiftwidth"] = 4
vim.opt.spelllang = { "en_us" }
vim.opt.spell = true
vim.opt.number = true
vim.opt.relativenumber = true

vim.api.nvim_set_keymap("i", "<C-H>", "<C-W>", { noremap = true })
vim.api.nvim_set_keymap("c", "<C-H>", "<C-W>", { noremap = true })
vim.api.nvim_set_keymap("i", "<C-Del>", "<C-o>dw", { noremap = true })
vim.api.nvim_set_keymap("c", "<C-Del>", "<C-W>", { noremap = true })
