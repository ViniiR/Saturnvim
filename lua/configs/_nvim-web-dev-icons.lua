local devicons = require("nvim-web-devicons")

devicons.setup({})
-- setup override does not work
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
    i3conf = {
        icon = "",
        name = "i3conf",
        color = COLORS.red
    }
})
