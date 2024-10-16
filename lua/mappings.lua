vim.g.mapleader = " "

local map = vim.keymap.set

map("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "Toggle Debugger Breakpoint" })
map("n", "<leader>du", function()
    local widgets = require("dap.ui.widgets")
    local sidebar = widgets.sidebar(widgets.scopes)
    sidebar.open()
end)

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
map("n", "]d", "]d<C-w>d")
map("n", "<leader>tr", ":NvimTreeRefresh<CR>", { noremap = true, desc = "Nvim Tree Refresh" })

-- Insert mode
map("i", "<C-H>", "<C-W>", { noremap = true })
map("i", "<C-Del>", "<C-o>dw", { noremap = true })
map("i", "<C-c>", "<Esc>", { noremap = true })

-- Visual mode
map("v", "<C-c>", "<Esc>", { noremap = true })

-- Command mode
map("c", "<C-h>", "<C-w>", { noremap = true })
map("c", "<C-Del>", "<C-W>", { noremap = true })
map("c", "<C-c>", "<C-c>", { noremap = true })
