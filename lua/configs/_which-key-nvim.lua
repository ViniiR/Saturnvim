require("which-key").setup({
    win = {
        no_overlap = true,
        border = BORDER_KIND,
        width = vim.o.columns,
        title_pos = "left",
    },
})
require("mappings.setup._which-key")()
