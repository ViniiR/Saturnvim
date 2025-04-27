local api = vim.api

--- vim <Esc> key
local esc = api.nvim_replace_termcodes("<Esc>", true, true, true)

local m = {
    ---@param macro string macro string stored at register
    ---@param register string register to hold the macro string
    ---@param filetypes table list of string filetypes e.g. { "typescript", "javascript" }
    ---@param group_name string string of au_group name e.g. "EcmaLogGroup"
    create_macro = function(macro, register, filetypes, group_name)
        api.nvim_create_augroup(group_name, { clear = true })
        api.nvim_create_autocmd("FileType", {
            group = group_name,
            pattern = filetypes,
            callback = function() vim.fn.setreg(register, macro) end,
        })
    end,
}

local es_macro_string = 'yoconsole.log("' .. esc .. 'pa: ", ' .. esc .. "pa);" .. esc .. ""
local rs_macro_string = 'yodbg!("' .. esc .. 'pa: ", &' .. esc .. "pa);" .. esc .. ""
local lua_macro_string = 'yoprint("' .. esc .. 'pa: ", ' .. esc .. "pa);" .. esc .. ""

m.create_macro(
    es_macro_string,
    "l",
    { "typescript", "typescriptreact", "javascript", "javascriptreact" },
    "EcmaLogGroup"
)
m.create_macro(rs_macro_string, "l", { "rust" }, "RustLogGroup")
m.create_macro(lua_macro_string, "l", { "lua" }, "LuaLogGroup")
