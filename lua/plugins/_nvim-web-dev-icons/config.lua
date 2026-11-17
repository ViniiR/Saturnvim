local devicons = require("nvim-web-devicons")
local theme = require("highlight.theme")

devicons.set_icon({
    i3conf = {
        icon = "",
        name = "i3conf",
        color = theme.colors.red
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
            color = theme.colors.ts_fg,
        },
    }
}
