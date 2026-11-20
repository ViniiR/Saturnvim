local lib = require("mappings.lib")
local keys = lib.keys
local modes = lib.modes
local desc = lib.desc

local mappings = {
    {
        modes.normal,
        keys.leader("tt"),
        function()
            vim.cmd.UndotreeToggle()
        end,
        desc.desc("Toggle undotree"),
    },
}

function mappings:setup()
    lib.setup(self)
end

return mappings
