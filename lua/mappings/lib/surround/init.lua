local surround_config = require("mappings.lib.surround.config")

local m = {}

---@param block string[] { block_start, block_end }
---@param block_finder_keypresses string
---before running "block_finder_keypresses" it sets the cursor on the line below the statement start
function m.create(block, block_finder_keypresses)
    local positions = {
        start_pos = {
            line = vim.fn.line("v"),
            -- column = vim.fn.col("v"),
        },
        end_pos = {
            line = vim.fn.line("."),
            -- column = vim.fn.col("."),
        },
    }
    if positions.start_pos.line > positions.end_pos.line then
        positions.start_pos.line, positions.end_pos.line = positions.end_pos.line, positions.start_pos.line
    end

    -- get the current block's indentation characters
    local start_line = vim.api.nvim_buf_get_lines(0, positions.start_pos.line - 1, positions.start_pos.line, false)[1]
        or ""
    local indent = start_line:match("^[ \t]*") or ""

    -- apply one indent level to the selected lines
    vim.cmd(string.format("%s,%s>", positions.start_pos.line, positions.end_pos.line))

    -- create statement around selection
    vim.fn.append(positions.start_pos.line - 1, indent .. block[1])
    vim.fn.append(positions.end_pos.line + 1, indent .. block[2])

    -- deselects text
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", false)

    -- set cursor at start of selection to standardize block_finder_keypresses start position
    vim.api.nvim_win_set_cursor(0, { positions.start_pos.line + 1, 0 })

    -- puts cursor on desired position
    vim.api.nvim_feedkeys(block_finder_keypresses, "n", false)
end

---@param surround table
---@return string, string, string
function m.unpack(surround)
    return surround.block_start, surround.block_end, surround.finder_command
end

---@param kind string
---@return string, string, string
function m.from_filetype(kind)
    if surround_config[vim.bo.filetype] == nil then
        return m.unpack(surround_config.ecmascript[kind])
    end
    return m.unpack(surround_config[vim.bo.filetype][kind])
end

return m
