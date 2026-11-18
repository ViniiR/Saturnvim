-- Globals

BORDER_KIND = "rounded"

ROUNDED_BORDER_CHARS = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }

INDENT_BLANK_LINE_PIPE = "│"
INDENT_BLANK_LINE_SCOPE_PIPE = INDENT_BLANK_LINE_PIPE

VIRT_COLUMN_PIPE = INDENT_BLANK_LINE_PIPE

HARPOON_ICON = "󰛢"

FILLCHARS = {
    EOB = "b",
    FOLD = " ",
    FOLDOPEN = "",
    FOLDCLOSE = "",
    FOLDSEP = INDENT_BLANK_LINE_PIPE, -- "│" same characters but linked for simplicity
}

LISTCHARS = {
    SPACE = "space:⋅", -- U+22C5, -- 
    EOL = "eol:↴", -- U+21B4, -- 
    TAB = "tab:󰌒 ",
    -- NBSP = "nbsp:+",
    TRAIL = "trail:-",
}
