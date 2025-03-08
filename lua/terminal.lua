-- _DEPRECATED
local win_config = {
    relative = "editor",
    width = vim.o.columns,
    height = 20,
    style = "minimal",
    row = vim.o.lines - 20,
    col = 0,
    border = BORDER_KIND or "single",
}

local terminal_buf = nil
local terminal_win_id = nil

function Toggle_terminal()
    if vim.g.has_horizontal_terminal_been_created then
        if vim.g.is_horizontal_terminal_open then
            -- hide terminal
            vim.cmd("buffer " .. terminal_buf .. " | hide")

            vim.g.is_horizontal_terminal_open = false
        else
            -- show terminal
            vim.api.nvim_command("new")
            vim.cmd("term")
            if terminal_buf then vim.api.nvim_buf_set_name(terminal_buf, "horizontal_term") end
            local win_id = vim.api.nvim_get_current_win()

            vim.api.nvim_win_set_config(win_id, win_config)

            vim.g.is_horizontal_terminal_open = true
        end
    else
        -- create terminal
        vim.api.nvim_command("new")
        vim.cmd("term")
        terminal_buf = vim.api.nvim_get_current_buf()
        vim.api.nvim_buf_set_name(terminal_buf, "horizontal_term")
        local win_id = vim.api.nvim_get_current_win()

        vim.api.nvim_win_set_config(win_id, win_config)
        terminal_win_id = win_id

        vim.g.has_horizontal_terminal_been_created = true
        vim.g.is_horizontal_terminal_open = true
    end
end

-- vim.api.nvim_set_keymap(
--     "n",
--     "<leader>h",
--     ":lua Toggle_terminal()<CR>",
--     { noremap = true, silent = true, desc = "horitontal terminal" }
-- )
--
