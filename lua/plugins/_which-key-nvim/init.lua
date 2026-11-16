--- @type LazySpec | LazyCustom
return {
    "folke/which-key.nvim",
    branch = "main",
    version = false, -- tags are years behind updates

    -- Loading
    event = "VeryLazy",
    keys = require("plugins._which-key-nvim.mappings.internal"),
    cmd = "WhichKey",
    lazy = true,

    opts = require("plugins._which-key-nvim.config"),
    config = function(_, opts)
        require("which-key").setup(opts)
        require("plugins._which-key-nvim.mappings"):setup()
    end,
}
