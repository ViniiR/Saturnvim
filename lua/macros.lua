local api = vim.api

--- vim <Esc> key
local esc = api.nvim_replace_termcodes("<Esc>", true, true, true)
-- --- vim <Enter> key
-- local enter = api.nvim_replace_termcodes("<Enter>", true, true, true)
-- --- vim <Tab> key
-- local tab = api.nvim_replace_termcodes("<Tab>", true, true, true)

local m = {
    ---@param macro string[] macro string array stored at register
    ---@param register string register to hold the macro string
    ---@param filetypes table list of string filetypes e.g. { "typescript", "javascript" }
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
    log_key = "l",
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

-- log macros

m.create_macro({
    'yoconsole.log("',
    esc,
    'pa: ", ',
    esc,
    "pa);",
    esc,
}, m.log_key, m.ecma_filetypes, "EcmaLogGroup")
m.create_macro({
    'yodbg!("',
    esc,
    'pa: ", &',
    esc,
    "pa);",
    esc,
    "",
}, m.log_key, m.rust_filetypes, "RustLogGroup")
m.create_macro({
    'yoprint("',
    esc,
    'pa: ", ',
    esc,
    "pa)",
    esc,
    "",
}, m.log_key, m.lua_filetypes, "LuaLogGroup")
