--- @type LazySpec | LazyCustom
return {
    "folke/which-key.nvim",
    branch = "main",
    version = false, -- tags are years behind updates

    -- Loading
    event = "VeryLazy",
    keys = require("mappings.plugins._which-key"),
    cmd = "WhichKey",
    lazy = true,

    opts = require("plugins._which-key-nvim.config"),
    config = function(_, opts)
        require("which-key").setup(opts)
        require("mappings.setup._which-key")()
    end,
}
