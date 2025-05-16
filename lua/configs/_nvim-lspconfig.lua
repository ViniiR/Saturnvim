local lspconfig = require("lspconfig")

local enable_native_virtual_text = true
local x = vim.diagnostic.severity
vim.g.current_attached_lsp = "No LSP"
local config = {}

-- disable semantic tokens completely
-- vim.highlight.priorities.semantic_tokens = 0

local servers = {
    -- ts, js, html, css
    "ts_ls",
    "eslint",
    "emmet_language_server",
    "html",
    "cssls",
    "tailwindcss",
    -- "cssmodules_ls", -- not found
    -- "css-variables-lsp", -- not found
    -- "somesass_ls", -- never used, not found
    -- prisma
    "prismals",
    -- json, yaml
    "jsonls",
    "yamlls",
    -- bash
    "bashls",
    -- c
    "clangd",
    "neocmake",
    -- nix
    "nixd",
    "nil_ls",
    -- "rust_analyzer", --handled by rustaceanvim
}

vim.diagnostic.config({
    virtual_text = enable_native_virtual_text and {
        prefix = VIRTUAL_TEXT_PREFIX,
        virt_text_hide = false,
    } or false,
    signs = {
        text = {
            [x.ERROR] = LSP_SYMBOLS.ERROR,
            [x.WARN] = LSP_SYMBOLS.WARN,
            [x.INFO] = LSP_SYMBOLS.INFO,
            [x.HINT] = LSP_SYMBOLS.HINT,
        },
    },
    underline = true,
    float = {
        header = "",
        title = " 󰺄 Diagnostics ",
        border = BORDER_KIND or "single",
        focusable = true,
    },
})

-- TODO: uncomment if broken
-- local sign = vim.fn.sign_define
--
-- sign("DiagnosticSignError", {
--     text = LSP_SYMBOLS.ERROR,
--     texthl = "DiagnosticSignError",
-- })
-- sign("DiagnosticSignWarn", {
--     text = LSP_SYMBOLS.WARN,
--     texthl = "DiagnosticSignWarn",
-- })
-- sign("DiagnosticSignInfo", {
--     text = LSP_SYMBOLS.INFO,
--     texthl = "DiagnosticSignInfo",
-- })
-- sign("DiagnosticSignHint", {
--     text = LSP_SYMBOLS.HINT,
--     texthl = "DiagnosticSignHint",
-- })

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = BORDER_KIND or "single",
    max_width = nil, -- TODO
    max_height = nil,
    title = " " .. INFO_ICON .. " Info ",
})
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = enable_native_virtual_text and {
        prefix = function(diagnostic)
            local vim_diagnostic = vim.diagnostic.severity
            local severity = diagnostic.severity
            if severity == vim_diagnostic.ERROR then
                return " " .. LSP_SYMBOLS.ERROR
            elseif severity == vim_diagnostic.WARN then
                return " " .. LSP_SYMBOLS.WARN
            elseif severity == vim_diagnostic.INFO then
                return " " .. LSP_SYMBOLS.INFO
            elseif severity == vim_diagnostic.HINT then
                return " " .. LSP_SYMBOLS.HINT
            else
                return VIRTUAL_TEXT_PREFIX
            end
        end,
    } or false,
})

local mappings_setup = require("mappings.setup._lspconfig")

config.on_attach = function(client, bufnr)
    -- prevents nixd from showing hover diagnostics
    -- in favor of nil_ls's better hover
    if client.name == "nixd" then client.server_capabilities.hoverProvider = false end
    mappings_setup(bufnr)

    vim.lsp.inlay_hint.enable(true)
    vim.diagnostic.config({ virtual_text = enable_native_virtual_text and true or false })
end

config.on_init = function(client, _)
    if client.supports_method("textDocument/semanticTokens") then
        client.server_capabilities.semanticTokensProvider = nil
    end

    -- vim.g.current_attached_lsp = vim.lsp.get_clients({
    --     bufnr = 0,
    -- })[1].name
end

config.capabilities = vim.lsp.protocol.make_client_capabilities()
config.capabilities.textDocument.completion.completionItem = {
    documentationFormat = { "markdown", "plaintext" },
    snippetSupport = true,
    preselectSupport = true,
    insertReplaceSupport = true,
    labelDetailsSupport = true,
    deprecatedSupport = true,
    commitCharactersSupport = true,
    tagSupport = { valueSet = { 1 } },
    resolveSupport = {
        properties = {
            "documentation",
            "detail",
            "additionalTextEdits",
        },
    },
}

config.defaults = function()
    require("lspconfig").lua_ls.setup({
        on_attach = config.on_attach,
        capabilities = config.capabilities,
        on_init = config.on_init,

        settings = {
            Lua = {
                runtime = {
                    version = "LuaJIT", -- Current Neovim Lua runtime version
                },
                diagnostics = {
                    globals = { "vim" },
                },
                workspace = {
                    library = {
                        vim.fn.expand("$VIMRUNTIME/lua"),
                        vim.fn.expand("$VIMRUNTIME/lua/vim/lsp"),
                        vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy",
                        "${3rd}/luv/library",
                    },
                    maxPreload = 100000,
                    preloadFileSize = 10000,
                },
            },
        },
    })
end

config.defaults()

for _, lsp in ipairs(servers) do
    if lsp == "nixd" then
        lspconfig[lsp].setup({
            on_init = config.on_init,
            on_attach = config.on_attach,
            capabilities = config.capabilities,
            cmd = { "nixd" },
            settings = {
                nixd = {
                    nixpkgs = {
                        expr = "import <nixpkgs> { }",
                    },
                    formatting = {
                        command = { "alejandra" },
                    },
                    options = {
                        nixos = {
                            expr = '(builtins.getFlake ("git+file://" + toString ./.)).nixosConfigurations.nixos.options',
                        },
                        home_manager = {
                            expr = '(builtins.getFlake ("git+file://" + toString ./.)).homeConfigurations."vinii@nixos".options',
                        },
                    },
                },
            },
        })
    else
        lspconfig[lsp].setup({
            on_init = config.on_init,
            on_attach = config.on_attach,
            capabilities = config.capabilities,
        })
    end
end

return config
