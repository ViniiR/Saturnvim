local lib = require("lib.mappings")
local keys = lib.keys
local modes = lib.modes
local desc = lib.desc
local ibl_scope = require("ibl.scope")

local mappings = {
    {
        modes.normal,
        keys.leader("jc"),
        function()
            local config = {
                scope = {
                    exclude = {
                        language = {},
                        node_type = {},
                    },
                    include = {
                        node_type = {},
                    },
                },
            }
            local node = ibl_scope.get(vim.api.nvim_get_current_buf(), config)
            if node then
                local start_row, _, end_row, _ = node:range()
                if start_row ~= end_row then
                    vim.api.nvim_win_set_cursor(vim.api.nvim_get_current_win(), { start_row + 1, 0 })
                    vim.api.nvim_feedkeys("_zz", "n", true)
                end
            end
        end,
        desc.desc("Indent blankline jump to start of scope"),
    },
}

function mappings:setup()
    lib.setup(self)
end

return mappings
