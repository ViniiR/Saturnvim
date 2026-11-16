local devicons = require("nvim-web-devicons")

devicons.set_icon({
    i3conf = {
        icon = "",
        name = "i3conf",
        color = COLORS.red
    },
})

-- Setup override does not create new icons
return {
    override = {
        js = {
            icon = "",
            name = "js",
        },
        ts = {
            icon = "",
            name = "ts",
            color = COLORS.ts_fg,
        },
    }
}
