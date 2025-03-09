local nv_config = require("nvim-surround.config")

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
        -- -- bacKticK
        -- ["k"] = {
        --     add = { "`", "`" },
        -- },
        -- ["g"] = {
        --     add = function()
        --         local result = nv_config.get_input("Enter generic Type name: ")
        --         if result then return { { result .. "<" }, { ">" } } end
        --     end,
        --     find = function()
        --         if vim.g.loaded_nvim_treesitter then
        --             local selection = nv_config.get_selection({
        --                 query = {
        --                     capture = "@call.outer",
        --                     type = "textobjects",
        --                 },
        --             })
        --             if selection then return selection end
        --         end
        --         return nv_config.get_selection({ pattern = "[^=%s%(%){}]+%b()" })
        --     end,
        --     delete = "^(.-%()().-(%))()$",
        --     change = {
        --         target = "^.-([%w_]+)()%(.-%)()()$",
        --         replacement = function()
        --             local result = nv_config.get_input("Enter generic Type name: ")
        --             if result then return { { result }, { "" } } end
        --         end,
        --     },
        -- },
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
