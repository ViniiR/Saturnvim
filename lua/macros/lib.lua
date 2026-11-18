local api = vim.api

local m = {
    ---@param macro string[] macro string array stored at register
    ---@param register string register to hold the macro string
    ---@param filetypes nil | table list of string filetypes e.g. { "typescript", "javascript" }
    ---@param group_name string string of au_group name e.g. "EcmaLogGroup"
    create_macro = function(macro, register, filetypes, group_name)
        local macro_string = table.concat(macro)
        api.nvim_create_augroup(group_name, { clear = true })
        api.nvim_create_autocmd("FileType", {
            group = group_name,
            pattern = filetypes,
            callback = function()
                vim.fn.setreg(register, macro_string)
            end,
        })
    end,
    keys = {
        log = "l",
        semicolon = "c",
    },
    if_key = "i",
    function_key = "f",
    ecma_filetypes = {
        "typescript",
        "typescriptreact",
        "javascript",
        "javascriptreact",
        "vue",
        "html",
    },
    rust_filetypes = {
        "rust",
    },
    lua_filetypes = {
        "lua",
    },
    bash_filetypes = {
        "bash",
        "shell",
        "sh",
    },
}

return m
