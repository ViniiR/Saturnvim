local lspconfig = require("configs.nvim-lspconfig")

vim.g.rustaceanvim = {
    server = {
        on_attach = lspconfig.on_attach,
        -- capabilities = lspconfig.capabilities,
        -- on_init = lspconfig.on_init,
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
