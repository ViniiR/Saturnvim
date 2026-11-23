--- @type LazySpec | LazyCustom
return {
    -- INFO: Must be loaded right after theme
    "nvim-tree/nvim-web-devicons",
    branch = "master",
    version = false, -- tags are years behind updates

    -- Loading
    lazy = false,

    opts = function()
        return require("plugins._nvim-web-devicons.config")
    end,
}
