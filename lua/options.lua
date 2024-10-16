local opt = vim.opt

vim.opt["tabstop"] = 4
vim.opt["shiftwidth"] = 4
opt.spelllang = { "en_us" }
opt.spell = true
vim.o.number = true
vim.o.relativenumber = true
opt.termguicolors = true
vim.opt.wrap = true

opt.cursorline = true
opt.cursorlineopt = "number"

opt.smartindent = true
opt.clipboard = "unnamedplus"
opt.ignorecase = true
opt.smartcase = true
