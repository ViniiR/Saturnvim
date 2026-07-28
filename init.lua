require("globals")
require("options")
require("configs")
require("mappings.setup._editor")()
require("commands")
require("autocmds")
require("highlights")
require("macros")

-- NOTE: Semantic tokens load much slower than standard tokens
local enable_specific_semantic_tokens = {
    ["@lsp.type.variable.rust"] = true, -- shows "{var}" highlight in rust string
    ["@lsp.type.formatSpecifier.rust"] = true, -- shows "{var:?}" highlight in rust string
    ["@lsp.type.struct.rust"] = true, -- shows Struct(value) as type color instead of function
    ["@lsp.typemod.operator.controlFlow.rust"] = true, -- shows ? operator, NOTE: might match some future unstable rust features
}

-- Disables semantic tokens individually (works)
-- NOTE: ./lua/lsp/autocmds.lua disables semantic tokens for all non rust LSPs
for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
    if not enable_specific_semantic_tokens[group] then
        vim.api.nvim_set_hl(0, group, {})
    end
end
