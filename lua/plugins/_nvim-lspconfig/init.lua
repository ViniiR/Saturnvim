--- @type LazySpec | LazyCustom
return {
    -- INFO: Now only used by vim.lsp api to define default configs
    "neovim/nvim-lspconfig",
    branch = "master",
    version = "*",

    -- Loading
    event = "VeryLazy",
    lazy = true,

    -- using lspconfig to load vim.lsp config
    config = function()
        require("lsp")
    end,
}
