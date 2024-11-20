local ibl = require("ibl")
local hooks = require("ibl.hooks")

local highlight = {
    "RainbowRed",
    "RainbowYellow",
    "RainbowBlue",
    "RainbowOrange",
    "RainbowGreen",
    "RainbowViolet",
    "RainbowCyan",
}

-- brightest
local indent_bar_hl = {
    fg = "#42464e",
    bg = "none",
}
-- in between
local indent_whitespace_hl = {
    fg = "#373c45",
    bg = "none",
}
-- dimmest one
local whitespace_hl = {
    fg = "#31353d",
    bg = "none",
}

--Ibl hl groups
vim.api.nvim_set_hl(0, "IblIndent", indent_bar_hl)
vim.api.nvim_set_hl(0, "IblWhitespace", indent_whitespace_hl)
vim.api.nvim_set_hl(0, "Whitespace", whitespace_hl)
vim.api.nvim_set_hl(0, "IblScope", { fg = "grey", bg = "none" })
-- vim.api.nvim_set_hl(0, "@ibl.scope.underline.1", { fg = "white", bg = "none" })

-- nvim default for \n chars
vim.api.nvim_set_hl(0, "NonText", whitespace_hl)
vim.api.nvim_set_hl(0, "LspInlayHint", { fg = "#5c6370" }) --  by default links to NonText so hard code default color or NonText

local opts = {
    indent = { char = "│" },
    scope = {
        char = "│",
        enabled = true,
        show_start = false,
        show_end = false,
        show_exact_scope = true,
    },
    exclude = {
        filetypes = {
            "help",
            "dashboard",
            "packer",
        },
        buftypes = {
            "terminal",
            "nofile",
        },
    },
    whitespace = {
        remove_blankline_trail = true,
    },
}

-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
-- hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
--     vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
--     vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
--     vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
--     vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
--     vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
--     vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
--     vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
-- end)

-- hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)

-- vim.g.rainbow_delimiters = { highlight = highlight }

ibl.setup(opts)

-- hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
