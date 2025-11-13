local telescope = require("telescope")

require("mappings.setup._telescope")()

telescope.setup({
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
        pickers = {},
        extensions = {},
        file_ignore_patterns = {
            "node_modules",
            ".git/",
            "target",
            ".png",
            ".webp",
            ".jpeg",
            ".jpg",
            ".svg",
            ".gd.uid"
        },
    },
})
