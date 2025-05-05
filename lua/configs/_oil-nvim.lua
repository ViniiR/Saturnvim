require("oil").setup({
    view_options = {
        show_hidden = true,
    },
    default_file_explorer = true,
    -- uncomment to disable (unused) keymaps
    -- use_default_keymaps = false,
})

require("mappings.setup._oil")()
