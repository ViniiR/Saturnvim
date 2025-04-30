local telescope_actions = require("telescope.actions")

local lib = require("mappings.lib")
local keys = lib.keys
local modes = lib.modes
local desc = lib.desc

return {
    n = {
        ["q"] = telescope_actions.close,
    },
    i = {
        [keys.control_backspace] = function() vim.api.nvim_input("<C-W>") end,
        [keys.control(keys.delete)] = function() vim.api.nvim_input("<C-o>dw") end,
        [keys.tab] = function() vim.api.nvim_input("<C-n>") end,
        [keys.shift_tab] = function() vim.api.nvim_input("<C-p>") end,
        [keys.escape] = telescope_actions.close,
    },
}
