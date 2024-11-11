-- local cmd = vim.api.nvim_create_user_command
--TODO can be improved by making the same terminal reappear

-- vim.keymap.set("n", "<leader>h", function()
--     if vim.g.is_horizontal_terminal_open then
--         vim.cmd("wincmd j | close")
--         vim.g.is_horizontal_terminal_open = false
--     else
--         vim.cmd("Term")
--         vim.g.is_horizontal_terminal_open = true
--     end
-- end, { desc = "Terminal" })
--
-- vim.keymap.set("n", "<leader>v", function()
--     if vim.g.is_vertical_terminal_open then
--         vim.cmd("wincmd l | close")
--         vim.g.is_vertical_terminal_open = false
--     else
--         vim.cmd("Vterm")
--         vim.g.is_vertical_terminal_open = true
--     end
-- end, { desc = "Vertical Terminal" })
--
-- cmd("Term", function()
--     vim.cmd("sp | terminal")
--     -- vim.cmd("wincmd J")
--     -- vim.cmd("terminal")
-- end, {})
--
-- cmd("Vterm", function() vim.cmd("vsplit | terminal") end, {})
--
function DBG(text)
    text = text or "No text provided"
    local content = tostring(text)
    local dbg_win_config = {
        height = 30,
        width = math.floor(vim.o.columns * 0.4),
        row = 0,
        col = math.floor(vim.o.columns),
        style = "minimal",
        border = "rounded",
        relative = "editor",
    }

    local formatted_lines = vim.split(content, "\n")

    vim.api.nvim_command("new")
    local buf = vim.api.nvim_get_current_buf()
    vim.api.nvim_buf_set_name(buf, "dbg_window")
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, formatted_lines)
    local win_id = vim.api.nvim_get_current_win()

    vim.api.nvim_buf_set_keymap(buf, "n", "q", "<Cmd>bd!<CR>", { noremap = true, silent = true })
    vim.api.nvim_win_set_config(win_id, dbg_win_config)
end
