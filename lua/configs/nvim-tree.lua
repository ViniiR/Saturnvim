require("nvim-tree").setup()
vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle Nvim Tree" })
vim.keymap.set("n", "<leader>tr", ":NvimTreeRefresh<CR>", { noremap = true, desc = "Nvim Tree Refresh" })
