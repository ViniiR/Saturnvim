-- NOTE: file loaded by lsp/init.lua

local semantic_tokens = require("lsp.semantic_tokens")
local autocmd = vim.api.nvim_create_autocmd

-- Set display variable for lualine
autocmd("LspAttach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client == nil then
            return
        end

        vim.g.current_attached_lsp = client.name or "No LSP"
    end,
})

-- Ensure rust-analyzer is started within a nix-shell
autocmd("LspAttach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client == nil then
            return
        end

        -- Rust analyzer custom config
        if client.name == "rust-analyzer" then
            local is_in_rust_root = vim.fn.filereadable("./Cargo.toml")
            local is_in_nix_shell = vim.env.IN_NIX_SHELL ~= nil

            if is_in_rust_root and not is_in_nix_shell then
                local msg = "Rust Analyzer requires a Nix Shell to work properly"
                vim.notify(msg, vim.log.levels.ERROR)
            end
        end
    end,
})

-- Set up LSP specific bindings
autocmd("LspAttach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client == nil then
            return
        end

        require("plugins._nvim-lspconfig.mappings"):setup(args.buf)
    end,
})

-- Enable inlay hints
autocmd("LspAttach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client == nil then
            return
        end

        local supports_hints = client:supports_method("textDocument/inlayHint")
        if supports_hints then
            vim.lsp.inlay_hint.enable(true, {
                bufnr = args.buf,
            })
        end
    end,
})

-- Enable document colors
-- document colors are more limited than nvim-highlight-colors but produce better result
-- they do not harm nvim-highlight-colors so both can be enabled
autocmd("LspAttach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client == nil then
            return
        end

        local supports_doc_colors = client:supports_method("textDocument/documentColor")
        if supports_doc_colors then
            vim.lsp.document_color.enable(true, {
                bufnr = args.buf,
            })
        end
    end,
})

-- Filter semantic tokens LSPs
autocmd("LspAttach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client == nil then
            return
        end

        local is_allowed = semantic_tokens.allowed_lsps[client.name]
        local supports_tokens = client:supports_method("textDocument/semanticTokens")
        if not is_allowed and supports_tokens then
            -- Disable capability
            client.server_capabilities.semanticTokensProvider = nil
        end
    end,
})
