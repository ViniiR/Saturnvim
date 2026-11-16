--- @type LazySpec | LazyCustom
return {
    "nvimdev/dashboard-nvim",
    branch = "master",
    version = false, -- does not offer tags

    -- Loading
    event = "VimEnter",
    lazy = true,

    opts = require("plugins._dashboard-nvim.config"),
}
