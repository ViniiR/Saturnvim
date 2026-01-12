local lib = require("mappings.lib")
local keys = lib.keys
local modes = lib.modes
local desc = lib.desc

local lsp_config = require("lsp.config")

local mappings = {
    --local function opts(desc) return { buffer = bufnr, desc = "LSP " .. desc } end
    {
        modes.normal,
        "gD",
        vim.lsp.buf.declaration,
        desc.desc("LSP Go to declaration"),
    },
    {
        modes.normal,
        "gd",
        vim.lsp.buf.definition,
        desc.desc("LSP Go to definition"),
    },
    {
        modes.normal,
        "gi",
        vim.lsp.buf.implementation,
        desc.desc("LSP Go to implementation"),
    },
    {
        modes.normal,
        keys.leader("sh"),
        vim.lsp.buf.signature_help,
        desc.desc("LSP Show signature help"),
    },
    {
        modes.normal,
        keys.leader("wa"),
        vim.lsp.buf.add_workspace_folder,
        desc.desc("LSP Add workspace folder"),
    },
    {
        modes.normal,
        keys.leader("wr"),
        vim.lsp.buf.remove_workspace_folder,
        desc.desc("LSP Remove workspace folder"),
    },
    {
        modes.normal,
        keys.leader("wl"),
        function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end,
        desc.desc("LSP List workspace folder"),
    },
    {
        modes.normal,
        keys.leader("D"),
        vim.lsp.buf.type_definition,
        desc.desc("LSP Go to type definition"),
    },
    {
        { modes.normal, modes.visual },
        keys.leader("la"),
        vim.lsp.buf.code_action,
        desc.desc("LSP Code action"),
    },
    {
        modes.normal,
        "gr",
        vim.lsp.buf.references,
        desc.desc("LSP Show references"),
    },
    {
        modes.normal,
        "[d",
        function()
            vim.diagnostic.goto_prev()
            vim.diagnostic.open_float()
        end,
        desc.desc("LSP Go to previous diagnostic"),
    },
    {
        modes.normal,
        "]d",
        function()
            vim.diagnostic.goto_next()
            vim.diagnostic.open_float()
        end,
        desc.desc("LSP Go to next diagnostic"),
    },
    {
        modes.normal,
        keys.control("w", "d"),
        function()
            vim.diagnostic.open_float()
        end,
        desc.desc("LSP Open current line diagnostics"),
    },
    {
        modes.normal,
        "K",
        function()
            vim.lsp.buf.hover(lsp_config.hover_window_config)
        end,
        desc.desc("LSP Open current line diagnostics"),
    },
}

return function(bufnr)
    for _, mapping in ipairs(mappings) do
        local mode = mapping[1]
        local lhs = mapping[2]
        local rhs = mapping[3]
        local opts = mapping[4]
        opts.buffer = bufnr
        vim.keymap.set(mode, lhs, rhs, opts)
    end
end
