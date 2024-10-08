-- grey= "#5c6370",
-- 		light_grey = "#848b98",
--black = "#181a1f"
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
        TelescopeBorder = { fg = "#FFFFFF" },
        TelescopePromptBorder = { fg = "#636363" },
        TelescopePreviewBorder = { fg = "#636363" },
        TelescopeResultsBorder = { fg = "#636363" },
        TelescopePromptPrefix = { fg = "#636363" },
        TelescopeMatching = { fg = "#5acc37" },
        TelescopeSelectionCaret = { fg = "#5acc37" },

        -- LSP diagnostics
        DiagnosticVirtualTextHint = { fg = "#b151cf", bg = "none" },
        DiagnosticVirtualTextWarn = { fg = "#e3c72b", bg = "none" },
        DiagnosticVirtualTextError = { fg = "#fa2525", bg = "none" },
    },

    -- Plugins Config --
    diagnostics = {
        darker = true, -- darker colors for diagnostic
        undercurl = true, -- use undercurl instead of underline for diagnostics
        background = true, -- use background color for virtual text
    },
})

require("onedark").load()
