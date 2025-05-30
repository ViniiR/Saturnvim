local config = require("nvim-surround.config")

require("nvim-surround").setup({
    surrounds = {
        ["("] = {
            add = { "(", ")" },
        },
        [")"] = {
            add = { "( ", " )" },
        },
        ["{"] = {
            add = { "{", "}" },
        },
        ["}"] = {
            add = { "{ ", " }" },
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
            add = { "[ ", " ]" },
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
        -- bacKticK
        ["k"] = {
            add = { "`", "`" },
        },
        -- Generic<Type> surround
        ["g"] = {
            add = function()
                local result = config.get_input("Enter generic Type name: ")
                if result then return { { result .. "<" }, { ">" } } end
            end,
            find = function()
                if vim.g.loaded_nvim_treesitter then
                    local selection = config.get_selection({
                        query = {
                            capture = "@call.outer",
                            type = "textobjects",
                        },
                    })
                    if selection then return selection end
                end
                return config.get_selection({ pattern = "[^=%s%<%>{}]+%b<>" })
            end,
            delete = "^(.-%<)().-(%>)()$",
            change = {
                target = "^.-([%w_]+)()%<.-%>()()$",
                replacement = function()
                    local result = config.get_input("Enter generic Type name: ")
                    if result then return { { result }, { "" } } end
                end,
            },
        },
        -- -- generic statement surround (requires manual input)
        -- ["i"] = {
        -- },
        -- -- html tag
        -- ["t"] = {
        -- },
        -- -- html tag
        -- ["T"] = {
        -- },
        -- -- function call surround
        -- ["f"] = {
        -- },
    },
})
