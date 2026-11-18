-- Globals

BORDER_KIND = "rounded"

ROUNDED_BORDER_CHARS = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }

INDENT_BLANK_LINE_PIPE = "│"
INDENT_BLANK_LINE_SCOPE_PIPE = INDENT_BLANK_LINE_PIPE

FILLCHARS = {
    EOB = "b",
    FOLD = " ",
    FOLDOPEN = "",
    FOLDCLOSE = "",
    FOLDSEP = "│",
}

LISTCHARS = {
    SPACE = "space:⋅", -- U+22C5, -- 
    EOL = "eol:↴", -- U+21B4, -- 
    TAB = "tab:󰌒 ",
    -- NBSP = "nbsp:+",
    TRAIL = "trail:-",
}
