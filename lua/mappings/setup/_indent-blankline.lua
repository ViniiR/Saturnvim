local lib = require("mappings.lib")
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

return function(bufnr)
    for _, mapping in ipairs(mappings) do
        local mode = mapping[1]
        local lhs = mapping[2]
        local rhs = mapping[3]
        local opts = mapping[4]
        opts.buffer = bufnr
        vim.keymap.set(mode, lhs, rhs, opts)
    end
end
