local lspconfig = require("configs.lspconfig")

vim.g.rustaceanvim = {
    server = {
        on_attach = lspconfig.on_attach,
        default_settings = {
            ["rust-analyzer"] = {
                capabilities = lspconfig.capabilities,
                cargo = {
                    allFeatures = true,
                },
                -- checkOnSave = true,
                -- check = {
                -- 	enable = true,
                -- 	command = "check",
                -- },
            },
        },
    },
}
