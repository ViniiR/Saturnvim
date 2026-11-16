local lib = require("mappings.lib")
local keys = lib.keys
local modes = lib.modes
local desc = lib.desc

local mappings = {
    {
        modes.normal,
        "-",
        function()
            vim.cmd("Oil")
        end,
        desc.desc("Open parent directory"),
    },
}

function mappings:setup()
    lib.setup(self)
end

return mappings
