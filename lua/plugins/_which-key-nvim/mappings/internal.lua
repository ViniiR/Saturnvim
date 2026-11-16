local lib = require("mappings.lib")

local keys = lib.keys

-- Used for lazy.nvim plugin spec "keys" for lazy loading
return {
    keys.leader(), -- just the leader key
    keys.control("r"),
    keys.control("w"),
    '"',
    "'",
    "`",
    "c",
    "v",
    "g",
    "[",
    "]",
}
