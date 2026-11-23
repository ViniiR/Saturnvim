return {
    default_file_explorer = true,
    keymaps = require("plugins._oil-nvim.mappings.internal"),
    columns = {
        "icon",
        -- "permissions",
        -- "size",
        -- "mtime",
    },
    view_options = {
        show_hidden = true,
    },

    -- uncomment to disable (unused) keymaps
    -- use_default_keymaps = false,
}
