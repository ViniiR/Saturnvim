--- @type LazySpec | LazyCustom
return {
    "hrsh7th/nvim-cmp",
    branch = "main",
    version = false, -- tags are years behind updates

    -- Loading
    event = "InsertEnter",
    lazy = true,

    opts = function()
        return require("plugins._nvim-cmp.config")
    end,
    dependencies = {
        { "saadparwaiz1/cmp_luasnip" },
        { "hrsh7th/cmp-nvim-lua" },
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/cmp-buffer" },
        { "hrsh7th/cmp-path" },
        {
            "petertriho/cmp-git",
            opts = require("plugins._nvim-cmp.dependencies.cmp_git.config"),
            init = function()
                table.insert(require("cmp").get_config().sources, { name = "git" })
            end,
        },
        -- { "hrsh7th/cmp-cmdline" },
    },
}
