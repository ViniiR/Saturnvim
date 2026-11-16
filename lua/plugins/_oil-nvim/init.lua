--- @type LazySpec | LazyCustom
return {
    "stevearc/oil.nvim",
    branch = "master",
    version = false, -- tags are years behind updates

    -- Loading
    lazy = false, -- Load immediately to avoid Netrw

    opts = require("plugins._oil-nvim.config"),
    config = function(_, opts)
        require("oil").setup(opts)
        require("mappings.setup._oil")()
    end,
}
