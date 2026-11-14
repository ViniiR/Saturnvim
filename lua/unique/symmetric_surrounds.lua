local map = vim.keymap.set
local cmd = vim.cmd

-- WARNING: AI written code, i guess this directory is just gonna be all of this stuff now?
--- NOTE: only works on single lines, not multi-line like (), [], and {}
---@param char string
---@param alias string
local function create_symmetric_surround(char, alias)
    for _, mode in ipairs({ "x", "o" }) do
        -- Base character text objects (e.g., di|, da|)
        map(mode, "i" .. char, function()
            cmd("normal! T" .. char .. "vt" .. char)
        end, { silent = true })

        map(mode, "a" .. char, function()
            cmd("normal! F" .. char .. "vf" .. char)
        end, { silent = true })

        -- Optional shorthand alias (e.g., dip, dap for pipes)
        if alias then
            map(mode, "i" .. alias, function()
                cmd("normal! T" .. char .. "vt" .. char)
            end, { silent = true, desc = "Inner " .. char })

            map(mode, "a" .. alias, function()
                cmd("normal! F" .. char .. "vf" .. char)
            end, { silent = true, desc = "Around " .. char })
        end
    end
end

-- Allows for motions like di|, ci|, dip, and cip
create_symmetric_surround("|", "p")
