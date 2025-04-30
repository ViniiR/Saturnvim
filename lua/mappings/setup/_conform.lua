local lib = require("mappings.lib")
local keys = lib.keys
local modes = lib.modes
local desc = lib.desc
local conform = require("conform")

local mappings = {
    {
        modes.normal,
        keys.leader("fm"),
        function()
            conform.format({ lsp_fallback = true })
            print("Conform Formatted")
        end,
        desc.desc("General Format file"),
    },
    {
        modes.normal,
        keys.leader("mm"),
        function()
            conform.format({ lsp_fallback = true })
            print("Conform Formatted")
        end,
        desc.desc("General Format file"),
    },
}

return function()
    for _, mapping in ipairs(mappings) do
        local mode = mapping[1]
        local lhs = mapping[2]
        local rhs = mapping[3]
        local opts = mapping[4]
        vim.keymap.set(mode, lhs, rhs, opts)
    end
end
