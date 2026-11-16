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
            border = BORDER_KIND,
            title_pos = "left",
            title = string.format(" %s Harpoon ", HARPOON_ICON),
        }
    end,
    opts = require("plugins._harpoon.config"),
    config = function(_, opts)
        require("harpoon"):setup(opts)
        require("mappings.setup._harpoon")()
    end,

    dependencies = {
        { "nvim-lua/plenary.nvim" },
    },
}
