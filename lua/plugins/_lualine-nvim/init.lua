--- @type LazySpec | LazyCustom
return {
    "nvim-lualine/lualine.nvim",
    branch = "master",
    version = false, -- does not offer tags

    -- Loading
    event = "VeryLazy",
    lazy = true,

    -- Cannot use opts, must do require operations
    opts = function()
        return require("plugins._lualine-nvim.config")
    end,
    config = function(_, opts)
        require("lualine").setup(opts)
        -- no mappings
    end,
}
