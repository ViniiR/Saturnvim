-- NOTE: file loaded by ./init.lua

local autocmd = vim.api.nvim_create_autocmd

autocmd("LspAttach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client == nil then
            return
        end

        -- Used by lualine
        vim.g.current_attached_lsp = client.name or "No LSP"

        -- map LSP specific bindings
        require("mappings.setup._lspconfig")(args.buf)

        -- Only enable inlay hints on LSPs that support it
        if client:supports_method("textDocument/inlayHint") then
            vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
        end

        -- Disable semantic tokens
        if client ~= "rust-analyzer" and client:supports_method("textDocument/semanticTokens") then
            client.server_capabilities.semanticTokensProvider = nil
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

-- autocmd("BufEnter", {
--     callback = function(args)
--         local clients = vim.lsp.get_clients()
--         if #clients == 0 then
--             return
--         end
--         vim.g.current_attached_lsp = clients[1].name or "No LSP"
--     end,
-- })
