local lib = require("mappings.lib")
local keys = lib.keys
local modes = lib.modes
local desc = lib.desc
local harpoon = require("harpoon")

local harpoon_opts = HARPOON_OPTS

local mappings = {
    {
        -- map("n", "<M-e>", function() toggle_telescope(harpoon:list()) end, { desc = "Open harpoon window" })
        -- map("i", "<M-e>", function() toggle_telescope(harpoon:close_menu()) end, { desc = "Open harpoon window" })
        modes.normal,
        keys.alt("e"),
        function()
            harpoon.ui:toggle_quick_menu(harpoon:list(), harpoon_opts)
        end,
        desc.desc("Open harpoon window"),
    },
    {
        modes.normal,
        keys.leader("a"),
        function() harpoon:list():add() end,
        desc.desc("Mark file on harpoon"),
    },
    {
        modes.normal,
        keys.leader("x"),
        function() harpoon:list():remove() end,
        desc.desc("Unmark file on harpoon"),
    },
    { modes.normal, keys.alt("h"), function() harpoon:list():select(1) end },
    { modes.normal, keys.alt("j"), function() harpoon:list():select(2) end },
    { modes.normal, keys.alt("k"), function() harpoon:list():select(3) end },
    { modes.normal, keys.alt("l"), function() harpoon:list():select(4) end },
    { modes.normal, keys.alt("ç"), function() harpoon:list():select(5) end },
    { modes.normal, keys.alt(";"), function() harpoon:list():select(5) end },
    { modes.normal, keys.alt("u"), function() harpoon:list():select(6) end },
    { modes.normal, keys.alt("i"), function() harpoon:list():select(7) end },
    { modes.normal, keys.alt("o"), function() harpoon:list():select(8) end },
    { modes.normal, keys.alt("p"), function() harpoon:list():select(9) end },
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
