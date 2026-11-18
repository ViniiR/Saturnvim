local autocmd = vim.api.nvim_create_autocmd

autocmd({ "BufEnter", "BufWritePost", "TextChanged", "TextChangedI" }, {
    pattern = "*.zig",
    callback = require("unique.zig_format.lib"),
})
