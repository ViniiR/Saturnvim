local border_settings = require("settings.border")

return {
    win = {
        no_overlap = true,
        border = border_settings.kind,
        width = vim.o.columns,
        title_pos = "left",
    },
}
