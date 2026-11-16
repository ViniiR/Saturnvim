--- @type LazySpec | LazyCustom
return {
    "lewis6991/gitsigns.nvim",
    branch = "main",
    version = "*",

    -- Loading
    event = "VeryLazy",
    lazy = true,

    opts = require("plugins._gitsigns-nvim.config"),
    config = function(_, opts)
        require("gitsigns").setup(opts)
        require("mappings.setup._gitsigns")()
    end,
}
