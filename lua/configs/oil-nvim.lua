require("oil").setup({
    view_options = {
        show_hidden = true,
    },
})

local maps = require("mappings2")
maps:setup_oil()

-- vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
