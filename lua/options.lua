local opt = vim.opt

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
opt.ruler = false

-- editor in general

opt.wrap = true
opt.list = true
opt.cursorline = true
opt.cursorlineopt = "number"
opt.numberwidth = 2
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

opt.number = true
opt.relativenumber = true
opt.foldcolumn = "1"

-- indenting

opt.smartindent = true
opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.autoindent = true

-- command mode

opt.smartcase = true

-- undo tree save

opt.undofile = true
opt.updatetime = 250

-- windowing

opt.splitbelow = true
opt.splitright = true
