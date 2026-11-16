--- @type LazySpec | LazyCustom
return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    commit = "5a70b1e", -- must match nixpkgs nvim-treesitter-cli version
    version = false, -- releases are still the master branch

    -- Loading
    lazy = false,

    build = ":TSUpdate",
    opts = function()
        return require("plugins._nvim-treesitter-extension.config")
    end,
    init = function()
        vim.env.CC = "gcc"
    end,
    config = function(_, opts)
        require("nvim-treesitter.config").setup(opts)
    end,
}
