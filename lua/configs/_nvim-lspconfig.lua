local lspconfig = require("lspconfig")

local enable_native_virtual_text = true
local x = vim.diagnostic.severity

--- INFO: updated in autocmds.lua
vim.g.current_attached_lsp = "No LSP"

--- INFO: useful information
-- disable semantic tokens completely
-- vim.highlight.priorities.semantic_tokens = 0

local config = {
    hover_window_config = {
        title = string.format(" %s Info ", INFO_ICON),
        border = BORDER_KIND,
        max_width = nil, -- TODO
        max_height = nil,
    },
    diagnostic_config = {
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
        virtual_lines = false, -- cool feature maybe add later
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
            title = string.format(" %s Diagnostics ", DIAGNOSTICS_ICON),
            border = BORDER_KIND,
            header = " ",
            prefix = function(_, i, _)
                return " " .. i .. ": "
            end,
            suffix = function(diagnostic, i, total)
                local str = " "
                if diagnostic.code ~= nil then
                    str = " [" .. diagnostic.code .. "] "
                end
                if i == total then
                    str = str .. "\n   "
                end
                return str
            end,
            focusable = true,
            severity_sort = true,
        },
        severity_sort = true,
        update_in_insert = false,
    },
    --- WARNING: rust_analyzer is managed externally by rustaceanvim do not include it
    lsp_list = {
        "lua_ls",
        "ts_ls",
        "eslint",
        "emmet_language_server",
        "svelte",
        "vuels",
        "html",
        "cssls",
        "tailwindcss",
        "prismals",
        "jsonls",
        "yamlls",
        "bashls",
        "clangd",
        "neocmake",
        "gdscript",
        "ocamllsp",
        -- "nil_ls",
        "nixd",
        -- not found in nix
        -- "cssmodules_ls", "css-variables-lsp"
        -- not found in nix (but also never used)
        -- "somesass_ls"
    },
}

vim.diagnostic.config(config.diagnostic_config)

local hover = vim.lsp.buf.hover -- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, config.hover_window_config)
---@diagnostic disable-next-line: duplicate-set-field
vim.lsp.buf.hover = function()
    return hover(config.hover_window_config)
end

local mappings_setup = require("mappings.setup._lspconfig")

config["on_attach"] = function(_, bufnr)
    mappings_setup(bufnr)

    vim.lsp.inlay_hint.enable(true)
    vim.diagnostic.config(config.diagnostic_config)
end

config["on_init"] = function(client, _)
    if client.supports_method("textDocument/semanticTokens") then
        client.server_capabilities.semanticTokensProvider = nil
    end
end

config["capabilities"] = vim.lsp.protocol.make_client_capabilities()

config["capabilities"].textDocument.completion.completionItem = {
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

for _, lsp_name in ipairs(config.lsp_list) do
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
                    path = vim.split(package.path, ";"),
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
    elseif lsp_name == "gdscript" then
        local port = os.getenv("GDScript_Port") or "6005"
        local cmd = vim.lsp.rpc.connect("127.0.0.1", tonumber(port))
        lspconf.cmd = cmd
        lspconf.filetypes = { "gd", "gdscript", "gdscript3" }
        lspconf.root_markers = { "project.godot", ".git" }
    end
    lspconfig[lsp_name].setup(lspconf)
end

return config
