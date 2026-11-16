--- @type LazySpec | LazyCustom
return {
    "akinsho/toggleterm.nvim",
    branch = "main",
    version = false, -- tags are years behind updates

    -- Loading
    event = "VeryLazy",
    lazy = true,

    opts = require("plugins._toggleterm-nvim.config"),
}
