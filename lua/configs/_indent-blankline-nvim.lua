local ibl = require("ibl")
-- local hooks = require("ibl.hooks")

-- local highlight = {
--     "RainbowRed",
--     "RainbowYellow",
--     "RainbowBlue",
--     "RainbowOrange",
--     "RainbowGreen",
--     "RainbowViolet",
--     "RainbowCyan",
-- }

local opts = {
    -- used for all indents
    indent = { char = INDENT_BLANK_LINE_PIPE },
    scope = {
        -- used for scopes e.g if statement
        -- overrides normal indent
        char = INDENT_BLANK_LINE_SCOPE_PIPE,
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

require("mappings.setup._indent-blankline")()

ibl.setup(opts)

-- hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
