local lspconfig = require("lspconfig")

local enable_native_virtual_text = true
local x = vim.diagnostic.severity

--- INFO: updated in autocmds.lua
vim.g.current_attached_lsp = "No LSP"

local config = {}

--- INFO: useful information
-- disable semantic tokens completely
-- vim.highlight.priorities.semantic_tokens = 0

-- WARNING: rust_analyzer is managed externally by rustaceanvim do not include it
local lsp_list = {
    "lua_ls",
    "ts_ls",
    "eslint",
    "emmet_language_server",
    "html",
    "cssls",
    "tailwindcss",
    "prismals",
    "jsonls",
    "yamlls",
    "bashls",
    "clangd",
    "neocmake",
    "nil_ls",
    "nixd",
    -- "cssmodules_ls", -- not found
    -- "css-variables-lsp", -- not found
    -- "somesass_ls", -- never used, not found
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
    -- INFO
    -- prevents nixd from showing hover diagnostics in favor of nil_ls's better hover
    -- ensure nil_ls enabled
    if client.name == "nixd" then
        client.server_capabilities.hoverProvider = false
    end
    mappings_setup(bufnr)

    vim.lsp.inlay_hint.enable(true)
    vim.diagnostic.config({ virtual_text = enable_native_virtual_text and true or false })
end

config.on_init = function(client, _)
    if client.supports_method("textDocument/semanticTokens") then
        client.server_capabilities.semanticTokensProvider = nil
    end
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
    tagSupport = {
        valueSet = {
            1,
        },
    },
    resolveSupport = {
        properties = {
            "documentation",
            "detail",
            "additionalTextEdits",
        },
    },
}

for _, lsp_name in pairs(lsp_list) do
    local lspconf = {
        on_init = config.on_init,
        on_attach = config.on_attach,
        capabilities = config.capabilities,
    }
    if lsp_name == "lua_ls" then
        lspconf.settings = {
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
        }
    elseif lsp_name == "nixd" then
        lspconf.cmd = { "nixd" }
        lspconf.settings = {
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
        }
    end
    lspconfig[lsp_name].setup(lspconf)
end

return config

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
