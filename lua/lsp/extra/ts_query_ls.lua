--- @type vim.lsp.Config
return {
    cmd = { "ts_query_ls" },
    filetypes = { "query" },
    settings = {
        parser_install_directories = {
            -- If using nvim-treesitter with lazy.nvim
            vim.fs.joinpath(vim.fn.stdpath("data"), "/lazy/nvim-treesitter/parser/"),
        },
    },
}
