local harpoon_icons = require("plugins._harpoon.icons")
local border_settings = require("settings.border")

return {
    settings = {
        border = border_settings.kind,
        title_pos = "left",
        title = string.format(" %s Harpoon ", harpoon_icons.harpoon),
    },
}
