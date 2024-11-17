local M = {}
local map = vim.keymap.set

local lspconfig = require("lspconfig")

vim.g.current_attached_lsp = "No LSP"

-- disable semantic tokens completely
-- vim.highlight.priorities.semantic_tokens = 0

local x = vim.diagnostic.severity

LSP_SYMBOLS = {
    -- ERROR = "",
    -- WARN = "",
    -- INFO = "",
    -- HINT = "",
    ERROR = "",
    WARN = "",
    INFO = "",
    HINT = "",
}

-- signs = { text = { [x.ERROR] = "", [x.WARN] = "", [x.INFO] = "", [x.HINT] = "" } },
vim.diagnostic.config({
    virtual_text = {
        prefix = "",
        virt_text_hide = false,
    },
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
        header = "false",
        border = "rounded",
        focusable = true,
    },
})

local servers = {
    "emmet_language_server",
    "ts_ls",
    "html",
    "cssls",
    "tailwindcss",
    "eslint",
    "jsonls",
    "cssls",
    -- "cssmodules_ls",
    "bashls",
    "prismals",
    "nixd",
    -- "rust_analyzer", handled by rustaceanvim
    "clangd",
    "neocmake",
    "nixd",
}

vim.fn.sign_define("DiagnosticSignError", { text = LSP_SYMBOLS.ERROR, texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = LSP_SYMBOLS.WARN, texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = LSP_SYMBOLS.INFO, texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = LSP_SYMBOLS.HINT, texthl = "DiagnosticSignHint" })

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "single",
    max_width = nil,
    max_height = nil,
    title = " Info ",
})

M.on_attach = function(_, bufnr)
    local function opts(desc) return { buffer = bufnr, desc = "LSP " .. desc } end

    map("n", "gD", vim.lsp.buf.declaration, opts("Go to declaration"))
    map("n", "gd", vim.lsp.buf.definition, opts("Go to definition"))
    map("n", "gi", vim.lsp.buf.implementation, opts("Go to implementation"))
    map("n", "<leader>sh", vim.lsp.buf.signature_help, opts("Show signature help"))
    map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts("Add workspace folder"))
    map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts("Remove workspace folder"))

    map(
        "n",
        "<leader>wl",
        function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
        opts("List workspace folders")
    )

    map("n", "<leader>D", vim.lsp.buf.type_definition, opts("Go to type definition"))

    map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts("Code action"))
    map("n", "gr", vim.lsp.buf.references, opts("Show references"))

    vim.keymap.set("n", "[d", function()
        vim.diagnostic.goto_prev()
        vim.diagnostic.open_float()
    end)
    vim.keymap.set("n", "]d", function()
        vim.diagnostic.goto_next()
        vim.diagnostic.open_float()
    end)
    vim.keymap.set("n", "<C-w>d", function() vim.diagnostic.open_float() end)
    vim.lsp.inlay_hint.enable(true)
    vim.diagnostic.config({ virtual_text = true })
end

M.on_init = function(client, _)
    if client.supports_method("textDocument/semanticTokens") then
        client.server_capabilities.semanticTokensProvider = nil
    end

    vim.g.current_attached_lsp = vim.lsp.get_clients({
        bufnr = 0,
    })[1].name
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem = {
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

M.defaults = function()
    require("lspconfig").lua_ls.setup({
        on_attach = M.on_attach,
        capabilities = M.capabilities,
        on_init = M.on_init,

        settings = {
            Lua = {
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

M.defaults()

for _, lsp in ipairs(servers) do
    if lsp ~= "nixd" then
        lspconfig[lsp].setup({
            on_init = M.on_init,
            on_attach = M.on_attach,
            capabilities = M.capabilities,
        })
    elseif lsp == "nixd" then
        lspconfig[lsp].setup({
            on_init = M.on_init,
            on_attach = M.on_attach,
            capabilities = M.capabilities,
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
                            expr = '(bultins.getFlake) "/etc/nixos/").nixosConfigurations.nixos.options',
                        },
                        -- home_manager = {
                        --     expr = '(bultins.getFlake) "/etc/nixos/").nixosConfigurations.nixos.options',
                        -- },
                    },
                },
            },
        })
    end
end

return M
