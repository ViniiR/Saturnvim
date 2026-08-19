-- INFO: neovim automatically loads ~/.config/nvim/lsp/<server>.lua or .../after/lsp/...

-- NOTE: this file is part of the new Neovim LSP API
-- it should be loaded by nvim-lspconfig
-- nvim-lspconfig now only defines the default LSP configs and this api applies them

local config = require("lsp.config")

vim.g.current_attached_lsp = "No LSP"

--- @type string[]
local servers = {
    "ts_ls",
    "bashls",
    "clangd",
    "cssls",
    -- TODO: random tags arent working
    "emmet_language_server",
    "eslint",
    "gdscript",
    "html",
    "jsonls",
    "lua_ls",
    "neocmake",
    "nil_ls", -- for modules and builtins
    "nixd", -- for pkgs
    "ocamllsp",
    "prismals",
    "svelte",
    "tailwindcss",
    "ts_query_ls",
    "vue_ls",
    "yamlls",
    "lemminx",
    "zls",

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

-- sets lsp diagnostic configs
vim.diagnostic.config(config.diagnostic_config)

-- NOTE: configure the servers before enabling
-- Enable all LSPs
vim.lsp.enable(servers)

require("lsp.autocmds")
