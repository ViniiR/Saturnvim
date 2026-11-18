local telescope_icons = require("plugins._telescope-nvim.icons")
local border_settings = require("settings.border")

return {
    defaults = {
        layout_strategy = "horizontal",
        prompt_prefix = string.format(" %s  ", telescope_icons.prompt),
        selection_caret = string.format("%s", telescope_icons.selection_caret),
        -- space before all entries
        entry_prefix = " ",
        borderchars = border_settings.chars,
        layout_config = {
            horizontal = {
                prompt_position = "top",
                preview_width = 0.55,
            },
            width = 0.87,
            height = 0.80,
        },
        sorting_strategy = "ascending",
        mappings = require("plugins._telescope-nvim.mappings.internal"),

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
