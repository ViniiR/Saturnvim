return {
    keys = {
        escape = "<Esc>",
        enter = "<Enter>",
        carriage_return = "<CR>",
        space = "<Space>",
        delete = "<Del>",
        arrow_left = "<Left>",
        arrow_down = "<Down>",
        arrow_up = "<Up>",
        arrow_right = "<Right>",
        no_operation = "<Nop>",
        backspace = "<BS>",
        home = "<Home>",
        -- end_key = "<end>",
        local_leader = "<LocalLeader>",
        control_backspace = "<C-H>",
        tab = "<Tab>",
        shift_tab = "<S-tab>",
        func = {
            ["1"] = "<F1>",
            ["2"] = "<F2>",
            ["3"] = "<F3>",
            ["4"] = "<F4>",
            ["5"] = "<F5>",
            ["6"] = "<F6>",
            ["7"] = "<F7>",
            ["8"] = "<F8>",
            ["9"] = "<F9>",
            ["10"] = "<F10>",
            ["11"] = "<F11>",
            ["12"] = "<F12>",
        },
        ---@param keys string
        ---@return string
        ---returns <leader>{keys}
        ---```lua
        ---leader("ff") == "<leader>ff"
        ---```
        leader = function(keys) return "<leader>" .. keys end,
        ---@param key string
        ---@param compound_keys? string
        ---@return string
        ---returns <C-{key}> or <C-{key}>{compound_keys}
        ---```lua
        ---control("c") == "<C-c>"
        ---control("c", "w") == "<C-c>w"
        ---```
        control = function(key, compound_keys)
            if string.sub(key, 1, 1) == "<" then key = string.sub(key, 2, -2) end
            local keymap = "<C-" .. key .. ">"
            if compound_keys then return keymap .. compound_keys end
            return keymap
        end,
        ---@param key string
        ---@param compound_keys? string
        ---@return string
        ---returns <M-{key}> or <M-{key}>{compound_keys}
        ---```lua
        ---alt("c") == "<M-c>"
        ---alt("c", "w") == "<M-c>w"
        ---```
        alt = function(key, compound_keys)
            if string.sub(key, 1, 1) == "<" then key = string.sub(key, 2, -2) end
            local keymap = "<M-" .. key .. ">"
            if compound_keys then return keymap .. compound_keys end
            return keymap
        end,
        ---@param key string
        ---@param compound_keys? string
        ---@return string
        ---returns <C-S-{key}> or <C-S-{key}>{compound_keys}
        ---```lua
        ---control_shift("c") == "<C-S-c>"
        ---control_shift("c", "w") == "<C-S-c>w"
        ---```
        control_shift = function(key, compound_keys)
            if string.sub(key, 1, 1) == "<" then key = string.sub(key, 2, -2) end
            local keymap = "<C-S-" .. key .. ">"
            if compound_keys then return keymap .. compound_keys end
            return keymap
        end,
        ---@param key string
        ---@param compound_keys? string
        ---@return string
        ---returns <C-M-{key}> or <C-M-{key}>{compound_keys}
        ---```lua
        ---control_shift("c") == "<C-M-c>"
        ---control_shift("c", "w") == "<C-M-c>w"
        ---```
        control_alt = function(key, compound_keys)
            if string.sub(key, 1, 1) == "<" then key = string.sub(key, 2, -2) end
            local keymap = "<C-M-" .. key .. ">"
            if compound_keys then return keymap .. compound_keys end
            return keymap
        end,
        ---@param key string
        ---@param compound_keys? string
        ---@return string
        ---returns <C-S-M-{key}> or <C-S-M-{key}>{compound_keys}
        ---```lua
        ---control_shift("c") == "<C-S-M-c>"
        ---control_shift("c", "w") == "<C-S-M-c>w"
        ---```
        control_shift_alt = function(key, compound_keys)
            if string.sub(key, 1, 1) == "<" then key = string.sub(key, 2, -2) end
            local keymap = "<C-S-M-" .. key .. ">"
            if compound_keys then return keymap .. compound_keys end
            return keymap
        end,
    },

    desc = {
        ---@param desc string
        ---@return table { desc string }
        desc = function(desc)
            return {
                desc = desc,
            }
        end,
        ---@param desc string
        ---@return table { desc string, noremap boolean }
        noremap = function(desc)
            return {
                desc = desc,
                noremap = true,
            }
        end,
        ---@param desc string
        ---@return table { desc string, silent boolean }
        silent = function(desc)
            return {
                desc = desc,
                noremap = true,
            }
        end,
        ---@param desc string
        ---@return table { desc string, noremap boolean, silent boolean }
        noremap_silent = function(desc)
            return {
                desc = desc,
                noremap = true,
                silent = true,
            }
        end,
    },

    modes = {
        normal = "n",
        insert = "i",
        visual = "v",
        command = "c",
        terminal = "t",
    },
}
