local lib = require("mappings.lib")
local keys = lib.keys
local modes = lib.modes
local desc = lib.desc
local dap = require("dap")

local mappings = {
    {
        modes.normal,
        keys.leader("db"),
        dap.toggle_breakpoint,
        desc.noremap_silent("Debugger toggle breakpoint"),
    },
    {
        modes.normal,
        keys.leader("dc"),
        dap.continue,
        desc.noremap_silent("Debugger continue"),
    },
    {
        modes.normal,
        keys.leader("dx"),
        dap.clear_breakpoints,
        desc.noremap_silent("Debugger clear breakpoints"),
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
