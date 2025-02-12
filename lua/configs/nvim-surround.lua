require("nvim-surround").setup({
    surrounds = {
        ["("] = {
            add = { "(", ")" },
        },
        [")"] = {
            add = { "(", ")" },
        },
        ["{"] = {
            add = { "{", "}" },
        },
        ["}"] = {
            add = { "{", "}" },
        },
        ["<"] = {
            add = { "<", ">" },
        },
        [">"] = {
            add = { "<", ">" },
        },
        ["["] = {
            add = { "[", "]" },
        },
        ["]"] = {
            add = { "[", "]" },
        },
        ["'"] = {
            add = { "'", "'" },
        },
        ['"'] = {
            add = { '"', '"' },
        },
        ["`"] = {
            add = { "`", "`" },
        },
        -- ["i"] = {
        -- },
        -- ["t"] = {
        -- },
        -- ["T"] = {
        -- },
        -- ["f"] = {
        -- },
    },
})
