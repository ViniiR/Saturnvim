local lib = require("mappings.lib")
local keys = lib.keys
local modes = lib.modes
local desc = lib.desc

local mappings = {
    {
        modes.normal,
        keys.control(keys.mouse.left),
        function()
            local pos = vim.fn.getmousepos()
            vim.api.nvim_win_set_cursor(pos.winid, { pos.line, math.max(0, pos.column - 1) })
            vim.api.nvim_feedkeys("gx", "m", false)
        end,
        desc.silent("Follow link"),
    },
}

function mappings:setup()
    lib.setup(self)
end

return mappings
