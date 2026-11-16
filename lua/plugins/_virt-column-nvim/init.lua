--- @type LazySpec | LazyCustom
return {
    "lukas-reineke/virt-column.nvim",
    branch = "master",
    version = "*",

    -- Loading
    event = "VeryLazy",
    lazy = true,

    opts = require("plugins._virt-column-nvim.config"),
}
