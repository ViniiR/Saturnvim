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
            prompt_title = string.format("%s Find Files", telescope_icons.telescope),
            preview_title = string.format("%s Grep Preview", telescope_icons.preview),
            results_title = string.format("%s Results", telescope_icons.prompt),
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
        buffers = {
            prompt_title = string.format("%s Buffers", telescope_icons.telescope),
            preview_title = string.format("%s Grep Preview", telescope_icons.preview),
            results_title = string.format("%s Results", telescope_icons.prompt),
        },
        live_grep = {
            prompt_title = string.format("%s Live Grep", telescope_icons.telescope),
            preview_title = string.format("%s Grep Preview", telescope_icons.preview),
            results_title = string.format("%s Results", telescope_icons.prompt),
        },
        current_buffer_fuzzy_find = {
            prompt_title = string.format("%s Current Buffer Fuzzy", telescope_icons.telescope),
            preview_title = string.format("%s Grep Preview", telescope_icons.preview),
            results_title = string.format("%s Results", telescope_icons.prompt),
        },
        highlights = {
            prompt_title = string.format("%s Highlights", telescope_icons.telescope),
            preview_title = string.format("%s Grep Preview", telescope_icons.preview),
            results_title = string.format("%s Results", telescope_icons.prompt),
        },
        marks = {
            prompt_title = string.format("%s Marks", telescope_icons.telescope),
            preview_title = string.format("%s Grep Preview", telescope_icons.preview),
            results_title = string.format("%s Results", telescope_icons.prompt),
        },
        help_tags = {
            prompt_title = string.format("%s Help", telescope_icons.help),
            preview_title = string.format("%s Grep Preview", telescope_icons.preview),
            results_title = string.format("%s Results", telescope_icons.prompt),
        },
        git_status = {
            prompt_title = string.format("%s Git Status", telescope_icons.telescope),
            preview_title = string.format("%s Git File Diff Preview", telescope_icons.preview),
            results_title = string.format("%s Results", telescope_icons.prompt),
        },
    },
}
