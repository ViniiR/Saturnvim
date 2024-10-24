local opt = vim.opt
local o = vim.o

opt.list = true

-- idk but required
vim.opt.showmode = false

-- idk

opt.ignorecase = true
opt.wrap = true
-- o.ruler = true learn
-- opt.fillchars = { eob = "" } learn

-- lsp
vim.opt.signcolumn = "yes"

-- disable splash screen
opt.shortmess:append("sI")

-- spelling

opt.spelllang = { "en_us" }
opt.spell = true

-- terminal

opt.termguicolors = true

-- clipboard

opt.clipboard = "unnamedplus"
opt.cursorline = true
opt.cursorlineopt = "number"
o.numberwidth = 2

-- left line count

o.number = true
o.relativenumber = true

-- indenting

opt.smartindent = true
o.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4
o.softtabstop = 4

-- command mode

opt.smartcase = true

-- undo tree save

o.undofile = true
o.updatetime = 250

-- windowing

o.splitbelow = true
o.splitright = true
