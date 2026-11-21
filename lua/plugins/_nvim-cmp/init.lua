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
            -- TODO: wait for hrsh7th to accept https://github.com/hrsh7th/cmp-nvim-lsp-signature-help/issues/56
            "steenrotsman/cmp-nvim-lsp-signature-help",
            branch = "client-request-deprecation",
            commit = "465a7b9db5bc82ec270bdf5e5741d9aa9a792c87",
        },
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
