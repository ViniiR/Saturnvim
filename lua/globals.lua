-- Globals

BORDER_KIND = "rounded"

ROUNDED_BORDER_CHARS = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }

INDENT_BLANK_LINE_PIPE = "│"
INDENT_BLANK_LINE_SCOPE_PIPE = INDENT_BLANK_LINE_PIPE

VIRT_COLUMN_PIPE = INDENT_BLANK_LINE_PIPE

HARPOON_ICON = "󰛢"

TERMINAL_ICON = ""
-- LOADING_ICON = ""
CRATE_ICON = ""
-- LIB_ICON = ""
-- DOCS_ICON = ""

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

-- WARNING:
-- for simplicity all icons must be PascalCase
CMP_ICONS = {
    Html = "",
    Version = "󰏖",
    Feature = "󰐱",
    Text = "󰉿",
    Function = "󰊕",
    Method = "󰊕",
    Constructor = "",
    Field = "󰜢",
    Variable = "󰀫",
    Class = "󰠱",
    Interface = "",
    Module = "",
    Property = "󰜢",
    Value = "󰎠",
    Enum = "",
    Keyword = "󰌋", --
    Snippet = "",
    Color = "󰏘",
    Constant = "󰏿",
    Struct = "󰙅",
    String = "󰉿",
    Operator = "󰆕",
    Table = "",
    Object = "󰅩",
    Tag = "",
    Array = "[]",
    Boolean = "", --
    Number = "", --
    Null = "󰟢", --
    File = "󰈚",
    Folder = "󰉋", -- Directory
    Namespace = "󰌗",
    TypeParameter = "󰊄",
    Package = "",
    EnumMember = "",

    --

    Unit = "󰑭",
    Reference = "󰈇",
    Event = "",
    Supermaven = "",
    Calendar = "",
    Watch = "󰥔",
    Copilot = "",
    Codeium = "",
    TabNine = "",
    BladeNav = "",
}
