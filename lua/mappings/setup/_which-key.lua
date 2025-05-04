local lib = require("mappings.lib")
local keys = lib.keys
local modes = lib.modes
local desc = lib.desc

local mappings = {
    {
        modes.normal,
        keys.leader("wK"),
        function() vim.cmd("WhichKey") end,
        desc.noremap_silent("Which key show all mappings"),
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
