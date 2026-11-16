--- @type LazySpec | LazyCustom
return {
    "windwp/nvim-autopairs",
    branch = "master",
    version = false, -- tags are years behind updates

    -- Loading
    event = "InsertEnter",
    lazy = true,

    opts = require("plugins._nvim-autopairs.config"),
    config = function(_, opts)
        local autopairs = require("nvim-autopairs")
        autopairs.setup(opts)
        local ok, plugin = pcall(require, "cmp")
        if ok then
            -- @diagnostic disable-next-line: undefined-field
            plugin.event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())
        end
        autopairs.remove_rule("```") -- FINALLY PEACE
        -- no mappings
    end,
}
