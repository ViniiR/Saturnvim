--- @type LazySpec | LazyCustom
return {
    "lukas-reineke/indent-blankline.nvim",
    branch = "master",
    version = "*",

    -- Loading
    event = "VeryLazy",
    lazy = true,

    main = "ibl", -- TODO: check if works without explicit main =
    opts = require("plugins._indent-blankline-nvim.config"),
    config = function(_, opts)
        require("ibl").setup(opts)
        require("mappings.setup._indent-blankline")()
    end,
}
