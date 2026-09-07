return {
    defaults = {
        layout_strategy = "horizontal",
        prompt_prefix = string.format(" %s  ", TELESCOPE_ICONS.prompt),
        selection_caret = string.format("%s", TELESCOPE_ICONS.selection_caret),
        -- space before all entries
        entry_prefix = " ",
        borderchars = ROUNDED_BORDER_CHARS,
        layout_config = {
            horizontal = {
                prompt_position = "top",
                preview_width = 0.55,
            },
            width = 0.87,
            height = 0.80,
        },
        sorting_strategy = "ascending",
        mappings = require("mappings.plugins._telescope"),

        -- Default ignored files on all Telescope pickers
        file_ignore_patterns = {
            "node_modules",
            "^%.git/",
            "^%.godot/",
        },
        extensions = {},
    },
    pickers = {
        -- Ignore files on <leader>ff && <leader>fa (since fa is only flags of find_files)
        find_files = {
            -- NOTE: Overrides defaults
            file_ignore_patterns = {
                "node_modules",
                "^%.git/",
                "^%.godot/",
                "^target/",
                "%.gd%.uid$",
                "%.cs%.uid$",
            },
        },
    },
}
