-- grey= "#5c6370",
-- 		light_grey = "#848b98",
--black = "#181a1f"
COLORS = {
    info_diagnostic_fg = "#388c96",
    cmp_selected_text_fg = "#363a43",
    illuminate_bg = "#31353f",
    matching_bg = "#61afee",
    title_fg = "#65b6c2",

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
require("onedark").setup({
    -- Main options --
    style = "dark", -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
    transparent = false, -- Show/hide background
    term_colors = true, -- Change terminal color as per the selected theme style
    ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
    cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

    -- toggle theme style ---
    toggle_style_key = nil, -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
    toggle_style_list = { "dark", "darker", "cool", "deep", "warm", "warmer", "light" }, -- List of styles to toggle between

    -- Change code style ---
    -- Options are italic, bold, underline, none
    -- You can configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
    code_style = {
        comments = "none",
        keywords = "none",
        functions = "none",
        strings = "none",
        variables = "none",
    },

    -- Lualine options --
    lualine = {
        transparent = false, -- lualine center bar transparency
    },

    -- Custom Highlights --
    colors = {}, -- Override default colors

    highlights = {
        -- Telescope
        -- TelescopeBorder = { fg = colors.white },
        -- TelescopePromptBorder = { fg = "#373b43" },
        -- TelescopePreviewBorder = { fg = "#373b43" },
        -- TelescopeResultsBorder = { fg = "#373b43" },
        -- TelescopePromptPrefix = { fg = "#373b43" },
        -- TelescopeMatching = { fg = colors.blue, bg = colors.one_bg },
        -- TelescopeSelectionCaret = { fg = "#5acc37" },

        -- Telescope
        --
        -- borders
        TelescopeBorder = { fg = COLORS.one_bg3 },
        TelescopePromptBorder = { fg = COLORS.one_bg3 },
        TelescopePreviewBorder = { fg = COLORS.one_bg3 },
        TelescopeResultsBorder = { fg = COLORS.one_bg3 },

        TelescopePromptTitle = {
            fg = COLORS.black,
            bg = COLORS.red,
        },

        TelescopeSelection = { bg = COLORS.grey, fg = COLORS.white },
        TelescopeResultsDiffAdd = { fg = COLORS.green },
        TelescopeResultsDiffChange = { fg = COLORS.yellow },
        TelescopeResultsDiffDelete = { fg = COLORS.red },

        TelescopeMatching = { bg = "none", fg = COLORS.matching_bg },
        TelescopeResultsTitle = { fg = COLORS.black, bg = COLORS.green },
        TelescopePreviewTitle = { fg = COLORS.black, bg = COLORS.blue },
        TelescopePromptPrefix = { fg = COLORS.red, bg = "none" },
        TelescopeNormal = { bg = "none" },
        TelescopePromptNormal = { bg = "none" },

        -- LSP diagnostics
        DiagnosticVirtualTextHint = { fg = COLORS.purple, bg = "none" },
        DiagnosticVirtualTextWarn = { fg = COLORS.yellow, bg = "none" },
        DiagnosticVirtualTextError = { fg = COLORS.red, bg = "none" },

        DiagnosticHint = { fg = COLORS.purple },
        DiagnosticError = { fg = COLORS.red },
        DiagnosticWarn = { fg = COLORS.yellow },
        DiagnosticInfo = { fg = COLORS.green },
        LspSignatureActiveParameter = { fg = COLORS.black, bg = COLORS.green },

        -- Indent blank line
        -- IblChar = { fg = COLORS.line },
        -- IblScopeChar = { fg = COLORS.grey },
        -- ["@ibl.scope.underline.1"] = { guifg = "none" },
        -- ["@ibl.scope.underline.2"] = { bg = COLORS.black2 },
        -- ["@ibl.scope.underline.3"] = { bg = COLORS.black2 },
        -- ["@ibl.scope.underline.4"] = { bg = COLORS.black2 },
        -- ["@ibl.scope.underline.5"] = { bg = COLORS.black2 },
        -- ["@ibl.scope.underline.6"] = { bg = COLORS.black2 },
        -- ["@ibl.scope.underline.7"] = { bg = COLORS.black2 },

        -- ["@lsp.type.generic.rust"] = { priority = 0 },
        -- ["@lsp.mod.macro.rust"] = { priority = 0 },
        -- ["@lsp.typemod.generic.macro.rust"] = { priority = 0 },
    },

    -- Plugins Config --
    diagnostics = {
        darker = true, -- darker COLORS for diagnostic
        undercurl = true, -- use undercurl instead of underline for diagnostics
        background = true, -- use background color for virtual text
    },
})

require("onedark").load()
