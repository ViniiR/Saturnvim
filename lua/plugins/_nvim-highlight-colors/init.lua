--- @type LazySpec | LazyCustom
return {
    "brenoprata10/nvim-highlight-colors",
    branch = "main",
    version = false, -- does not offer tags

    -- Loading
    event = "VeryLazy",
    lazy = true,

    opts = require("plugins._nvim-highlight-colors.config"),
}
