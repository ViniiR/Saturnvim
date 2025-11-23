local lib = require("mappings.lib")

local keys = lib.keys

return {
    -- NOTE: still uses <CR> for "actions.select" since the default mappings are true
    [keys.control("l")] = "actions.select",
}
