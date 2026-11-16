--- @type LazySpec | LazyCustom
return {
    "RRethy/vim-illuminate",
    branch = "master",
    version = false, -- does not offer tags

    -- Loading
    event = "VeryLazy",
    lazy = true,

    opts = require("plugins._vim-illuminate.config"),
    config = function(_, opts)
        require("illuminate").configure(opts)
    end,
}
