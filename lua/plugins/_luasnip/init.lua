--- @type LazySpec | LazyCustom
return {
    "ViniiR/NixSnip",
    branch = "master",
    version = "*",

    -- dir = "~/Documents/projects/NixSnip",
    dev = false,

    -- Loading
    event = "InsertEnter",
    lazy = true,

    -- build = "make install_jsregexp", -- optional
    -- Cannot use opts, must do require operations
    opts = function()
        return require("plugins._luasnip.config")
    end,
    config = function(_, opts)
        require("luasnip").setup(opts)
    end,

    dependencies = {
        { "rafamadriz/friendly-snippets" },
    },
}
