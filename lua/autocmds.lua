local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

autocmd("BufEnter", {
    callback = function()
        -- Overrides gdscript.vim's use of Tabs instead of Spaces
        if vim.bo.filetype == "gdscript" then
            vim.defer_fn(function()
                vim.opt.expandtab = true
            end, 10)
        end
    end,
})

-- Copied from "https://github.com/ThorstenRhau/neovim/blob/main/lua/config/autocmds.lua"
-- Close certain filetypes with q
-- Note: 'man' is excluded because Neovim has built-in q handling for man pages
autocmd("FileType", {
    group = augroup("close_with_q", { clear = true }),
    pattern = {
        "checkhealth",
        "git",
        "gitsigns-blame",
        "help",
        "lspinfo",
        "notify",
        "qf",
        "startuptime",
    },
    callback = function(event)
        vim.bo[event.buf].buflisted = false
        vim.keymap.set("n", "q", function()
            local ok = pcall(vim.cmd.bdelete, { bang = true })
            if not ok then
                vim.cmd.quit()
            end
        end, { buffer = event.buf, silent = true, desc = "Close buffer" })
    end,
})
