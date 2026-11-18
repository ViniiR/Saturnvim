local harpoon_icons = require("plugins._harpoon.icons")

return {
    settings = {
        border = BORDER_KIND,
        title_pos = "left",
        title = string.format(" %s Harpoon ", harpoon_icons.harpoon),
    },
}
