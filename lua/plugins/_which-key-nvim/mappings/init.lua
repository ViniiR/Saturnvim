local lib = require("mappings.lib")
local keys = lib.keys
local modes = lib.modes
local desc = lib.desc

local mappings = {
    {
        modes.normal,
        keys.leader("wK"),
        function()
            vim.cmd("WhichKey")
        end,
        desc.noremap_silent("Which key show all mappings"),
    },
}

function mappings:setup()
    lib.setup(self)
end

return mappings
