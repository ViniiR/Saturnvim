--- @type LazySpec | LazyCustom
return {
    "saecki/crates.nvim",
    branch = "main",
    version = "*",

    -- Loading
    event = { "BufRead Cargo.toml" },
    lazy = true,
    opts = require("plugins._crates-nvim.config"),
}
