--- @type LazySpec | LazyCustom
return {
    "nvim-telescope/telescope.nvim",
    branch = "master",
    version = "*",

    -- Loading
    event = "VimEnter",
    cmd = "Telescope",
    lazy = true,

    opts = require("plugins._telescope-nvim.config"),
    config = function(_, opts)
        require("telescope").setup(opts)
        require("plugins._telescope-nvim.mappings"):setup()
    end,

    dependencies = {
        { "nvim-lua/plenary.nvim" },
        -- { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
}
