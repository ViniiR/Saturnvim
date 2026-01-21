local lib = require("mappings.lib")
local keys = lib.keys
local modes = lib.modes
local desc = lib.desc
local conform = require("conform")

local function format()
    ---@type boolean
    local success = conform.format({ lsp_fallback = true })
    if success then
        print("Formatted")
    else
        vim.notify('No formatters specified for filetype "' .. vim.bo.filetype .. '"', vim.log.levels.WARN)
    end
end

local mappings = {
    {
        modes.normal,
        keys.leader("fm"),
        format,
        desc.desc("General Format file"),
    },
    {
        modes.normal,
        keys.leader("mm"),
        format,
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
