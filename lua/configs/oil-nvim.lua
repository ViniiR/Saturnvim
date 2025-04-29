require("oil").setup({
    view_options = {
        show_hidden = true,
    },
})

require("mappings.setup").oil()

-- vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
