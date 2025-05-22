-- Globals

BORDER_KIND = "rounded"

ROUNDED_BORDER_CHARS = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }

VIRTUAL_TEXT_PREFIX = "" --■
VIRTUAL_COLOR_ICON = "■"

INDENT_BLANK_LINE_PIPE = "│"
INDENT_BLANK_LINE_SCOPE_PIPE = INDENT_BLANK_LINE_PIPE

VIRT_COLUMN_PIPE = INDENT_BLANK_LINE_PIPE

HARPOON_ICON = "󰛢"
INFO_ICON = "󱁯"
DIAGNOSTICS_ICON = "󰺄"

TERMINAL_ICON=""
-- LOADING_ICON = ""
-- CRATE_ICON = ""
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
    SPACE = "space:⋅",
    EOL = "eol:↴",
    TAB = "tab:󰌒 ",
    -- NBSP = "nbsp:+",
    TRAIL = "trail:-"
}

TELESCOPE_ICONS = {
    prompt = "",
    selection_caret = " ", -- "→"
}

NEOVIM_ICONS = {
    styled = "",
    filled = "",
}

SATURNVIM = "[Saturvim]"

V_ICON = ""

GIT_ICONS = {
    branch = "󰘬",
    added = "󰐖",
    modified = "󰦓",
    removed = "󰍵",
}

GIT_SIGNS = {
    add = "┃",
    change = "┃",
    delete = GIT_ICONS.removed, -- "󰍵"
    topdelete = "‾",
    changedelete = "󱕖",
    untracked = "┆",
}
GIT_SIGNS_STAGED = {
    add = GIT_SIGNS.add, -- "┃"
    change = GIT_SIGNS.change, -- "┃"
    delete = "_",
    topdelete = GIT_SIGNS.topdelete, -- "‾"
    changedelete = "~",
    untracked = GIT_SIGNS.untracked, -- "┆"
}

LUALINE_ICONS = {
    file_modified = "[󱗜]~",
    file_immutable = "[󰐀]-",
    lsp_server = "󰒋",
    directory = "󰉖",
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

DAP_SYMBOLS = {
    DAP_BREAKPOINT = "", -- "B"
    DAP_BREAKPOINT_CONDITION = "", -- "C"
    DAP_LOG_POINT = "", -- "L"
    DAP_STOPPED = "→", -- "󰓛"
    DAP_BREAKPOINT_REJECTED = "", -- "R"
}

LSP_SYMBOLS = {
    ERROR = "", -- "",
    WARN = "", -- "",
    INFO = "", -- "",
    HINT = "", -- "",
}

VIM_MODE_MAP = {
    ["n"] = " NORMAL",
    ["no"] = " O-PENDING",
    ["nov"] = " O-PENDING",
    ["noV"] = " O-PENDING",
    ["no"] = " O-PENDING",
    ["niI"] = " NORMAL",
    ["niR"] = " NORMAL",
    ["niV"] = " NORMAL",
    ["nt"] = " NORMAL",
    ["v"] = " VISUAL",
    ["vs"] = " VISUAL",
    ["V"] = " V-LINE",
    ["Vs"] = " V-LINE",
    [""] = " V-BLOCK",
    ["s"] = " SELECT",
    ["S"] = " S-LINE",
    [""] = " S-BLOCK",
    ["i"] = " INSERT",
    ["ic"] = " INSERT",
    ["ix"] = " INSERT",
    ["R"] = " REPLACE",
    ["Rc"] = " REPLACE",
    ["Rx"] = " REPLACE",
    ["Rv"] = " V-REPLACE",
    ["Rvc"] = " V-REPLACE",
    ["Rvx"] = " V-REPLACE",
    ["c"] = " COMMAND",
    ["cv"] = " EX",
    ["ce"] = " EX",
    ["r"] = " REPLACE",
    ["rm"] = " MORE",
    ["r?"] = " CONFIRM",
    ["!"] = " SHELL",
    ["t"] = " TERMINAL",
}

THEME = {
    base00 = "#1e222a",
    base01 = "#353b45",
    base02 = "#3e4451",
    base03 = "#545862",
    base04 = "#565c64",
    base05 = "#abb2bf",
    base06 = "#b6bdca",
    base07 = "#c8ccd4",
    base08 = "#e06c75",
    base09 = "#d19a66",
    base0A = "#e5c07b",
    base0B = "#98c379",
    base0C = "#56b6c2",
    base0D = "#61afef",
    base0E = "#c678dd",
    base0F = "#be5046",
}

COLORS = {
    info_diagnostic_fg = "#388c96",
    cmp_selected_text_fg = "#363a43",
    illuminate_bg = "#31353f",
    matching_bg = "#61afee",
    title_fg = "#65b6c2",
    ts_fg = "#2d79c7",

    -- brightest
    indent_bar_hl = {
        fg = "#42464e",
        bg = "none",
    },
    -- in between
    indent_whitespace_hl = {
        fg = "#373c45",
        bg = "none",
    },
    -- dimmest one
    whitespace_hl = {
        fg = "#31353d",
        bg = "none",
    },

    white = "#abb2bf",
    darker_black = "#1b1f27",
    black = "#1e222a", --  nvim bg
    black2 = "#252931",
    one_bg = "#282c34", -- real bg of onedark
    one_bg2 = "#353b45",
    one_bg3 = "#373b43",
    grey = "#42464e",
    grey_fg = "#565c64",
    grey_fg2 = "#6f737b",
    light_grey = "#6f737b",
    red = "#e06c75",
    bright_red = "#FF0000",
    baby_pink = "#DE8C92",
    pink = "#ff75a0",
    line = "#31353d", -- for lines like vertsplit
    green = "#98c379",
    vibrant_green = "#7eca9c",
    nord_blue = "#81A1C1",
    blue = "#61afef",
    yellow = "#e7c787",
    sun = "#EBCB8B",
    purple = "#de98fd",
    dark_purple = "#c882e7",
    teal = "#519ABA",
    orange = "#fca2aa",
    cyan = "#a3b8ef",
    statusline_bg = "#22262e",
    lightbg = "#2d3139",
    pmenu_bg = "#61afef",
    folder_bg = "#61afef",
}
