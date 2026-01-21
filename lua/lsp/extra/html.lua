--- @type vim.lsp.Config
return {
    filetypes = { "html", "templ", "markdown" },
    settings = {
        html = {
            hover = {
                documentation = true,
                references = true,
            },
        },
    },
}
