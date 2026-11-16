--- @type LazySpec | LazyCustom
return {
    "stevearc/conform.nvim",
    branch = "master",
    version = "*",

    -- Loading
    event = "VeryLazy",
    lazy = true,

    opts = require("plugins._conform-nvim.config"),
    config = function(_, opts)
        require("conform").setup(opts)
        require("plugins._conform-nvim.mappings")
    end,
}
