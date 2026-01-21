local lsp_config = require("lsp.config")

vim.g.rustaceanvim = {
    tools = {
        float_win_config = lsp_config.hover_window_config,
    },
    server = {
        -- on_init = lsp_config.on_init,
        -- on_attach = lsp_config.on_attach,
        -- capabilities = lspconfig.capabilities,
        default_settings = {
            ["rust-analyzer"] = {
                capabilities = lsp_config.capabilities,
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

-- TODO: check these out in the future
-- ["<Leader>l"] = {
--a = { "<Cmd>RustLsp codeAction<CR>", "Code Actions" },
--c = { "<Cmd>RustLsp openCargo<CR>", "Open Cargo.toml" },
--p = { "<Cmd>RustLsp parentModule<CR>", "Parent Module" },
--R = { "<Cmd>RustLsp runnables<CR>", "Runnables" },
--D = { "<Cmd>RustLsp debuggables<CR>", "Debuggables" },
--j = { "<Cmd>RustLsp joinLines<CR>", "Join Lines" },
--l = { "<Cmd>RustLsp renderDiagnostic<CR>", "Line Info" },
--i = {
--    name = "Inlay Hints",
--    e = { function() vim.lsp.inlay_hint.enable(bufnr, true) end, "Enable" },
--    d = { function() vim.lsp.inlay_hint.enable(bufnr, false) end, "Disable" },
--},
--},
--["<A-k>"] = { "<Cmd>RustLsp moveItem up<CR>", "Move item up" },
--["<A-j>"] = { "<Cmd>RustLsp moveItem down<CR>", "Move item down" },
--K = { "<Cmd>RustLsp hover actions<CR>", "Documentation" },
