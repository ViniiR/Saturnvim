--- @type LazySpec | LazyCustom
return {
    "kylechui/nvim-surround",
    branch = "main",
    version = "*",

    -- Loading
    event = "VeryLazy",
    lazy = true,

    opts = function()
        return require("plugins._nvim-surround.config")
    end,
    config = function(_, opts)
        require("nvim-surround").setup(opts)
        -- no mappings
    end,
}
