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
        -- TODO: remove
        -- DevIconc = { fg = COLORS.blue },
        -- DevIconcss = { fg = COLORS.blue },
        -- DevIcondeb = { fg = COLORS.cyan },
        -- DevIconDockerfile = { fg = COLORS.cyan },
        -- DevIconhtml = { fg = COLORS.baby_pink },
        -- DevIconjpeg = { fg = COLORS.dark_purple },
        -- DevIconjpg = { fg = COLORS.dark_purple },
        -- DevIconjs = { fg = COLORS.sun },
        -- DevIconkt = { fg = COLORS.orange },
        -- DevIconlock = { fg = COLORS.red },
        -- DevIconlua = { fg = COLORS.blue },
        -- DevIconmp3 = { fg = COLORS.white },
        -- DevIconmp4 = { fg = COLORS.white },
        -- DevIconout = { fg = COLORS.white },
        -- DevIconpng = { fg = COLORS.dark_purple },
        -- DevIconpy = { fg = COLORS.cyan },
        -- DevIcontoml = { fg = COLORS.blue },
        -- DevIconts = { fg = COLORS.teal },
        -- DevIconttf = { fg = COLORS.white },
        -- DevIconrb = { fg = COLORS.pink },
        -- DevIconrpm = { fg = COLORS.orange },
        -- DevIconvue = { fg = COLORS.vibrant_green },
        -- DevIconwoff = { fg = COLORS.white },
        -- DevIconwoff2 = { fg = COLORS.white },
        -- DevIconxz = { fg = COLORS.sun },
        -- DevIconzip = { fg = COLORS.sun },
        -- DevIconZig = { fg = COLORS.orange },
        -- DevIconMd = { fg = COLORS.blue },
        -- DevIconTSX = { fg = COLORS.ts_fg },
        -- DevIconJSX = { fg = COLORS.blue },
        -- DevIconSvelte = { fg = COLORS.red },
        -- DevIconJava = { fg = COLORS.orange },
        -- DevIconDart = { fg = COLORS.cyan },
        --
        -- -- git
        -- diffNewFile = { fg = COLORS.blue },
        -- DiffText = { fg = COLORS.white, bg = COLORS.black2 },
        -- gitcommitOverflow = { fg = THEME.base08 },
        -- gitcommitSummary = { fg = THEME.base0B },
        -- gitcommitComment = { fg = THEME.base03 },
        -- gitcommitUntracked = { fg = THEME.base03 },
        -- gitcommitDiscarded = { fg = THEME.base03 },
        -- gitcommitSelected = { fg = THEME.base03 },
        -- gitcommitHeader = { fg = THEME.base0E },
        -- gitcommitSelectedType = { fg = THEME.base0D },
        -- gitcommitUnmergedType = { fg = THEME.base0D },
        -- gitcommitDiscardedType = { fg = THEME.base0D },
        -- gitcommitBranch = { fg = THEME.base09, bold = true },
        -- gitcommitUntrackedFile = { fg = THEME.base0A },
        -- gitcommitUnmergedFile = { fg = THEME.base08, bold = true },
        -- gitcommitDiscardedFile = { fg = THEME.base08, bold = true },
        -- gitcommitSelectedFile = { fg = THEME.base0B, bold = true },
        -- -- Telescope
        -- -- TelescopeBorder = { fg = colors.white },
        -- -- TelescopePromptBorder = { fg = "#373b43" },
        -- -- TelescopePreviewBorder = { fg = "#373b43" },
        -- -- TelescopeResultsBorder = { fg = "#373b43" },
        -- -- TelescopePromptPrefix = { fg = "#373b43" },
        -- -- TelescopeMatching = { fg = colors.blue, bg = colors.one_bg },
        -- -- TelescopeSelectionCaret = { fg = "#5acc37" },
        --
        -- -- Telescope
        -- --
        -- -- borders
        -- TelescopeBorder = { fg = COLORS.one_bg3 },
        -- TelescopePromptBorder = { fg = COLORS.one_bg3 },
        -- TelescopePreviewBorder = { fg = COLORS.one_bg3 },
        -- TelescopeResultsBorder = { fg = COLORS.one_bg3 },
        --
        -- TelescopePromptTitle = {
        --     fg = COLORS.black,
        --     bg = COLORS.red,
        -- },
        --
        -- TelescopeSelection = { bg = COLORS.grey, fg = COLORS.white },
        -- TelescopeResultsDiffAdd = { fg = COLORS.green },
        -- TelescopeResultsDiffChange = { fg = COLORS.yellow },
        -- TelescopeResultsDiffDelete = { fg = COLORS.red },
        --
        -- TelescopeMatching = { bg = "none", fg = COLORS.matching_bg },
        -- TelescopeResultsTitle = { fg = COLORS.black, bg = COLORS.green },
        -- TelescopePreviewTitle = { fg = COLORS.black, bg = COLORS.blue },
        -- TelescopePromptPrefix = { fg = COLORS.red, bg = "none" },
        -- TelescopeNormal = { bg = "none" },
        -- TelescopePromptNormal = { bg = "none" },
        --
        -- -- LSP diagnostics
        -- DiagnosticVirtualTextHint = { fg = COLORS.purple, bg = "none" },
        -- DiagnosticVirtualTextWarn = { fg = COLORS.yellow, bg = "none" },
        -- DiagnosticVirtualTextError = { fg = COLORS.red, bg = "none" },
        --
        -- DiagnosticHint = { fg = COLORS.purple },
        -- DiagnosticError = { fg = COLORS.red },
        -- DiagnosticWarn = { fg = COLORS.yellow },
        -- DiagnosticInfo = { fg = COLORS.green },
        -- LspSignatureActiveParameter = { fg = COLORS.black, bg = COLORS.green },

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
