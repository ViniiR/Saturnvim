--- @type LazySpec | LazyCustom
return {
    "lukas-reineke/indent-blankline.nvim",
    branch = "master",
    version = "*",

    -- Loading
    event = "VeryLazy",
    lazy = true,

    main = "ibl", -- main module to use for require
    opts = require("plugins._indent-blankline-nvim.config"),
    config = function(_, opts)
        require("ibl").setup(opts)
        require("plugins._indent-blankline-nvim.mappings"):setup()
    end,
}
