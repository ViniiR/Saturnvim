local opt = vim.opt
local o = vim.o

-- char list
opt.fillchars = {
    eob = FILLCHARS.EOB,
    fold = FILLCHARS.FOLD,
    foldopen = FILLCHARS.FOLDOPEN,
    foldclose = FILLCHARS.FOLDCLOSE,
    foldsep = FILLCHARS.FOLDSEP,
}
opt.listchars:append(LISTCHARS.SPACE)
opt.listchars:append(LISTCHARS.EOL)

-- commandline bar
opt.showmode = false
o.ruler = false

-- editor in general

opt.wrap = true
opt.list = true
opt.cursorline = true
opt.cursorlineopt = "number"
o.numberwidth = 2
opt.inccommand = "nosplit"
opt.colorcolumn = "80,120"
opt.virtualedit = "block"
-- centers the cursor whenever possible
-- opt.scrolloff = 999
opt.ignorecase = true

-- sign column for sign_define() icons (includes fold icons)
opt.signcolumn = "yes"

-- disable splash screen
opt.shortmess:append("sI")

-- spelling

opt.spelllang = { "en_us" }
opt.spell = true

-- terminal

opt.termguicolors = true

-- clipboard

opt.clipboard = "unnamedplus"

-- left line count

o.number = true
o.relativenumber = true
opt.foldcolumn = "1"

-- indenting

opt.smartindent = true
o.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4
o.softtabstop = 4
o.autoindent = true

-- command mode

opt.smartcase = true

-- undo tree save

o.undofile = true
o.updatetime = 250

-- windowing

o.splitbelow = true
o.splitright = true
