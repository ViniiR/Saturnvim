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
        require("plugins._oil-nvim.lib").render_custom_dir_icons()
        require("plugins._oil-nvim.mappings"):setup()
    end,
}
