--- @type LazySpec | LazyCustom
return {
    "mrcjkb/rustaceanvim",
    branch = "master",
    version = "*",

    -- Loading
    lazy = false, -- This plugin is already lazy

    init = function()
        -- IMPORTANT: WARNING: if lsp is not working basic features like showing errors, run :RustLsp (worked for me)
        vim.g.rustaceanvim = require("plugins._rustaceanvim.config")
    end,
}
