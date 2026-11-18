local macros_lib = require("macros.lib")

--- vim <Esc> key
local esc = vim.api.nvim_replace_termcodes("<Esc>", true, true, true)
-- --- vim <Enter> key
-- local enter = api.nvim_replace_termcodes("<Enter>", true, true, true)
-- --- vim <Tab> key
-- local tab = api.nvim_replace_termcodes("<Tab>", true, true, true)

-- log macros
macros_lib.create_macro({
    'yoconsole.log("',
    esc,
    'pa: ", ',
    esc,
    "pa);",
    esc,
}, macros_lib.keys.log, macros_lib.ecma_filetypes, "EcmaLogGroup")
macros_lib.create_macro({
    'yodbg!("',
    esc,
    'pa: ", &',
    esc,
    "pa);",
    esc,
    "",
}, macros_lib.keys.log, macros_lib.rust_filetypes, "RustLogGroup")
macros_lib.create_macro({
    'yoprint("',
    esc,
    'pa: ", ',
    esc,
    "pa)",
    esc,
    "",
}, macros_lib.keys.log, macros_lib.lua_filetypes, "LuaLogGroup")

-- semicolon macros
macros_lib.create_macro({
    "mzA;",
    esc,
    "`z",
    esc,
    "",
}, macros_lib.keys.semicolon, nil, "SemicolonGroup")
