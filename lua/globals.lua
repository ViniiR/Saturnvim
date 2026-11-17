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
    lsp_server_fail = "",
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
