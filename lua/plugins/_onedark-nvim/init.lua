--- @type LazySpec | LazyCustom
return {
    -- INFO: Must be the first plugin loaded
    "navarasu/onedark.nvim",
    branch = "master",
    version = "*",

    -- Loading
    lazy = false,
    priority = 1000, -- Recommended

    opts = require("plugins._onedark-nvim.config"),
    config = function(_, opts)
        require("onedark").setup(opts)
        require("onedark").load()
        -- no mappings
    end,
}
