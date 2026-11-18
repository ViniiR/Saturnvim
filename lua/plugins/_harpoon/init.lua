--- @type LazySpec | LazyCustom
return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    version = false, -- does not offer tags

    -- Loading
    event = "VimEnter",
    lazy = true,

    init = function()
        vim.g.harpoon_opts = {
            border = require("settings.border").kind,
            title_pos = "left",
            title = string.format(" %s Harpoon ", require("plugins._harpoon.icons").harpoon),
        }
    end,
    opts = require("plugins._harpoon.config"),
    config = function(_, opts)
        require("harpoon"):setup(opts)
        require("plugins._harpoon.mappings"):setup()
    end,

    dependencies = {
        { "nvim-lua/plenary.nvim" },
    },
}
