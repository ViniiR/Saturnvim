--- @type LazySpec | LazyCustom
return {
    "mbbill/undotree",
    branch = "master",
    version = false, -- tags are years behind updates

    -- Loading
    event = "VeryLazy",
    lazy = true,

    init = function()
        for key, value in pairs(require("plugins._undotree.config")) do
            vim.g[key] = value
        end
    end,
    config = function()
        -- no setup
        require("plugins._undotree.mappings"):setup()
    end,
}
