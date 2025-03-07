local devicons = require("nvim-web-devicons")

devicons.setup({})
-- setuo override does not work
devicons.set_icon({
    js = {
        icon = "",
        name = "js",
    },
    ts = {
        icon = "",
        name = "ts",
        color = COLORS.ts_fg,
    },
})
