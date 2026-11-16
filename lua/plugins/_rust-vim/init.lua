--- @type LazySpec | LazyCustom
return {
    "rust-lang/rust.vim",
    branch = "master",
    version = "*",

    -- Loading
    ft = "rust",
    lazy = true,

    init = function()
        vim.g.rustfmt_autosave = 1
    end,
}
