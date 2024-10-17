local cmd = vim.api.nvim_create_user_command
--TODO can be improved by making the same terminal reappear

vim.o.splitright = true

vim.keymap.set("n", "<leader>h", function()
    if vim.g.is_horizontal_terminal_open then
        vim.cmd("wincmd j | close")
        vim.g.is_horizontal_terminal_open = false
    else
        vim.cmd("Term")
        vim.g.is_horizontal_terminal_open = true
    end
end, { desc = "Terminal" })

vim.keymap.set("n", "<leader>v", function()
    if vim.g.is_vertical_terminal_open then
        vim.cmd("wincmd l | close")
        vim.g.is_vertical_terminal_open = false
    else
        vim.cmd("Vterm")
        vim.g.is_vertical_terminal_open = true
    end
end, { desc = "Vertical Terminal" })

cmd("Term", function()
    vim.cmd("sp")
    vim.cmd("wincmd J")
    vim.cmd("terminal")
end, {})

cmd("Vterm", function() vim.cmd("vsplit | terminal") end, {})
