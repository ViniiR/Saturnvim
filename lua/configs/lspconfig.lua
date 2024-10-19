local M = {}
local map = vim.keymap.set

local lspconfig = require("lspconfig")

vim.g.current_attached_lsp = "No LSP"
local x = vim.diagnostic.severity

vim.diagnostic.config({
    virtual_text = {
        prefix = "",
        virt_text_hide = false,
    },
    signs = { text = { [x.ERROR] = "", [x.WARN] = "", [x.INFO] = "", [x.HINT] = "" } },
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
    "cssmodules_ls",
    "bashls",
    "prismals",
    "nixd",
    -- "rust_analyzer", handled by rustaceanvim
    "clangd",
    "neocmake",
    "nixd",
}

vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })

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
    lspconfig[lsp].setup({
        on_init = M.on_init,
        on_attach = M.on_attach,
        capabilities = M.capabilities,
    })
end

return M
