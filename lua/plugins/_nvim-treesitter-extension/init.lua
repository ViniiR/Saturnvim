--- @type LazySpec | LazyCustom
return {
    "ViniiR/nvim-treesitter-extension",
    branch = "master",
    version = "*",

    -- dir = "~/Documents/projects/nvim-treesitter-extension",
    -- dev = true,

    -- Loading
    lazy = false,

    opts = require("plugins._nvim-treesitter-extension.config"),
}
