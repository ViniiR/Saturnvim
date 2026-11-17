local lib = require("lib.mappings")
local keys = lib.keys
local modes = lib.modes
local desc = lib.desc

local mappings = {
    {
        modes.normal,
        keys.leader("gd"),
        function()
            vim.cmd("Gitsigns toggle_current_line_blame")
        end,
        desc.noremap_silent("Gitsigns toggle blame"),
    },
}

function mappings:setup()
    lib.setup(self)
end

return mappings
