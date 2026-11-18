-- INFO: Semantic tokens load much slower than standard tokens
local m = {
    allowed_lsps = {
        ["rust-analyzer"] = true,
        ["zls"] = false, -- breaks all highlighting
    },
    enabled_tokens = {
        ["@lsp.type.variable.rust"] = true, -- shows "{var}" highlight in rust string
        ["@lsp.type.formatSpecifier.rust"] = true, -- shows "{var:?}" highlight in rust string
        ["@lsp.type.struct.rust"] = true, -- shows Struct(value) as type color instead of function
        ["@lsp.typemod.operator.controlFlow.rust"] = true, -- shows ? operator, NOTE: might match some future unstable rust features
    },
}

-- NOTE: Notably, this function is called by config/init.lua, despite being in /lsp
--- Disables semantic tokens individually
function m:sanitize()
    for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
        if not self.enabled_tokens[group] then
            vim.api.nvim_set_hl(0, group, {})
        end
    end
end

return m
