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
    {
        modes.normal,
        keys.leader("do"),
        dap.step_over,
        desc.noremap_silent("Debugger step over"),
    },
    {
        modes.normal,
        keys.leader("dO"),
        dap.step_out,
        desc.noremap_silent("Debugger step out"),
    },
}

function mappings:setup()
    lib.setup(self)
end

return mappings
