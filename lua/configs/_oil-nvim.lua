require("oil").setup({
    view_options = {
        show_hidden = true,
    },
    default_file_explorer = true,
    keymaps = require("mappings.plugins._oil"),

    -- uncomment to disable (unused) keymaps
    -- use_default_keymaps = false,
})

require("mappings.setup._oil")()
