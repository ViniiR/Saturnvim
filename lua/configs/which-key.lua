require("which-key").setup({
    win = {
        no_overlap = true,
        border = BORDER_KIND or "single",
        width = vim.o.columns,
        title_pos = "left",
    },
})
