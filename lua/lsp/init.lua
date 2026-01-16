-- INFO: neovim automatically loads ~/.config/nvim/lsp/<server>.lua or .../after/lsp/...

-- NOTE: this file is part of the new Neovim LSP API
-- it should be loaded by nvim-lspconfig
-- nvim-lspconfig now only defines the default LSP configs and this api applies them

local config = require("lsp.config")

vim.g.current_attached_lsp = "No LSP"

--- @type string[]
local servers = { -- TODO: test all servers (+ filetypes in general)
    "ts_ls", -- working
    "bashls", -- working
    "clangd", -- working
    "cssls",
    "emmet_language_server", -- working
    "eslint",
    "gdscript",
    "html", -- working
    "jsonls", -- working
    "lua_ls", -- working
    "neocmake", -- working
    "nixd", -- working
    "ocamllsp", -- working
    "prismals", -- won't test
    "svelte", -- working
    "tailwindcss",
    "ts_query_ls", -- working
    "vue_ls",
    "yamlls",
    -- WARNING: do not include "rust_analyzer"
    -- -- "rust_analyzer" -- working
}

-- Config for all LSPs
-- NOTE: does not get overridden by vim.lsp.config(name, config)
vim.lsp.config("*", {
    -- on_init = config_capabilities.on_init, -- moved to LspAttach autocmd
    -- on_attach = config_capabilities.on_attach, -- moved to LspAttach autocmd
    capabilities = config.capabilities,
    -- capabilities = require("cmp_nvim_lsp").default_capabilities(),
})

-- Loads extra configs defined in ./extra/<lsp>.lua
for _, file in ipairs(vim.api.nvim_get_runtime_file("lua/lsp/extra/*.lua", true)) do
    local name = vim.fn.fnamemodify(tostring(file), ":t:r")
    local conf = require("lsp.extra." .. name)

    vim.lsp.config(name, conf)
end

-- Enable inlay hints
vim.lsp.inlay_hint.enable(true)

-- sets lsp diagnostic configs
vim.diagnostic.config(config.diagnostic_config)

-- NOTE: configure the servers before enabling
-- Enable all LSPs
vim.lsp.enable(servers)

require("lsp.autocmds")
