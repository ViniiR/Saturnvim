local opt = vim.opt

-- INFO: rules
-- prefer shorter name opts before longer ones

vim.filetype.add({
    extension = {
        i3conf = "i3config",
    },
})

-- char list
opt.listchars:append(LISTCHARS.EOL) -- end of line character
opt.listchars:append(LISTCHARS.TAB) -- tab character
opt.listchars:append(LISTCHARS.TRAIL) -- trailing spaces at end of line character
opt.listchars:append(LISTCHARS.SPACE) -- space character

-- shortmess
opt.shortmess:append("I") -- don't give the intro message when starting vim
opt.shortmess:append("s") -- don't give "search hit BOTTOM, continuing at TOP" or shm-s "search hit TOP, continuing at BOTTOM" messages; when using the search count do not show "W" before the count message

local opts = {
    -- character list
    list = true, -- shows invisible characters from vim.opt.listchars
    fillchars = {
        eob = FILLCHARS.EOB, -- end of buffer
        fold = FILLCHARS.FOLD, -- fold (idk what it is)
        foldsep = FILLCHARS.FOLDSEP, -- folded lines
        foldopen = FILLCHARS.FOLDOPEN, -- fold open
        foldclose = FILLCHARS.FOLDCLOSE, -- fold closed
    },

    -- commandline-bar
    ruler = false, -- disable default line and col positions
    showmode = false, -- disable default show vim mode
    inccommand = "nosplit", -- shows the effects of a command incrementally in the buffer

    -- search
    hlsearch = true, -- when there is a previous search pattern, highlight all its matches
    smartcase = true, -- override 'ignorecase' if the search pattern contains upper case characters only used when the search pattern is typed and 'ignorecase' is on
    incsearch = true, -- while typing a search command, show where the pattern, as it was typed so far, matches
    ignorecase = true, -- ignore case in search patterns

    -- number column
    number = true, -- show line numbers
    numberwidth = 2, -- fixed number column width
    relativenumber = true, -- line numbers relative to cursor line

    -- fold column
    foldcolumn = "1", -- fold column width

    -- sign column
    signcolumn = "yes", -- sign_define icons column

    -- cursor
    cursorline = true, -- highlight the text line of the cursor with CursorLine "hl-CursorLine"
    cursorlineopt = "number", -- highlight the line number of the cursor with CursorLineNr "hl-CursorLineNr"
    -- scrolloff = 999, -- centers the cursor whenever possible
    scrolloff = 8, -- minimal number of screen lines to keep above and below the cursor. this will make some context visible around where you are working

    -- text
    wrap = true, -- wraps text to the bottom line when text is too long
    linebreak = true, -- vim will wrap long lines at a character in 'breakat' rather than at the last character that fits on the screen.
    colorcolumn = "80,120", -- editor wrap text columns

    -- indenting
    tabstop = 4, -- number of spaces that a <Tab> in the file counts for
    shiftwidth = 4, -- number of spaces to use for each step of (auto)indent. used for 'cindent', >>, <<, etc.
    softtabstop = 4, -- number of spaces that a <Tab> counts for while performing editing operations, like inserting a <Tab> or using <BS>.
    expandtab = true, -- in insert mode: use the appropriate number of spaces to insert a <Tab>
    autoindent = true, -- copy indent from current line when starting a new line (typing <CR> in insert mode or when using the "o" or "O" command).

    -- buffer
    hidden = true, -- buffer becomes hidden when it is 'abandon'ed
    swapfile = true, -- use a swapfile for the buffer (TODO: maybe disable)
    updatetime = 250, -- save swapfile timeout
    undofile = true, -- save undo tree between sessions
    virtualedit = "block", -- allow virtual editing in visual block mode
    fileencoding = "utf-8", -- file-content encoding for the current buffer

    -- tabline
    showtabline = 0, -- hide tabline

    -- spelling
    spell = true, -- enable spell check
    spelllang = { "en_us" }, -- spell check languages

    -- terminal
    termsync = true, -- buffer all screen updates made during a redraw cycle so that each screen is displayed in the terminal all at once
    termguicolors = true, -- enables 24-bit RGB color in the Terminal UI
    termpastefilter = "BS,HT,ESC,DEL", -- control characters to be removed from the text pasted into the terminal window

    -- clipboard
    clipboard = "unnamedplus", -- sync vim clipboard with system clipboard

    -- windowing
    splitbelow = true, -- splitting a window will put the new window below the current one
    splitright = true, -- splitting a window will put the new window right of the current one
}

for key, option in pairs(opts) do
    opt[key] = option
end
