require("configs")
require("options")
require("mappings")
require("commands")
require("terminal")

vim.cmd("highlight CustomVBool guifg=#4d98d6")
vim.cmd("highlight CustomVHTML guifg=#808080")
vim.cmd("highlight CustomVVariable guifg=#4fc1ff")
vim.cmd("highlight CustomVFunction guifg=#d4814e")
vim.cmd("highlight CustomVType guifg=#4ebd90")
vim.cmd("highlight CustomVProperty guifg=#8dc5e3")
vim.cmd("highlight CustomVPurple guifg=#bfa7f2")
vim.cmd("highlight Constant guifg=#4d98d6")
vim.cmd("highlight VFixme guibg=pink guifg=black")
vim.cmd("highlight VTodo guibg=yellow guifg=black")
-- vim.cmd("highlight CustomVChar guifg=#ed4a57")
vim.cmd("highlight CustomVEnum guifg=#4ebd90")
vim.cmd("highlight CustomVEnumMember guifg=#4d98d6")
vim.cmd("highlight CustomVStruct guifg=#4ebd90")
-- vim.cmd("highlight CustomVEnum guifg=#4ebd90")
-- vim.cmd("highlight CustomVEnumMember guifg=#2685d4")
-- vim.cmd("highlight CustomVStruct guifg=#2cac99")
-- vim.cmd("highlight CustomVInterface guifg=#af6c92")
-- vim.cmd("highlight CustomVInterface guifg=#53db5f")
-- onedark themes
local bg0 = "#282c34"
local bg1 = "#31353f"
local bg2 = "#393f4a"
local bg3 = "#3b3f4c"

-- comments
vim.api.nvim_set_hl(0, "@comment.error.comment", { link = "VFixme" })
vim.api.nvim_set_hl(0, "@comment.todo.comment", { link = "VTodo" })

--lsp hover
vim.api.nvim_set_hl(0, "FloatBorder", { link = "CmpFloatBorder", bg = bg0 })
vim.api.nvim_set_hl(0, "NormalFloat", { link = "CmpNormal" })

-- cmp
vim.api.nvim_set_hl(0, "CmpNormal", { bg = bg0 })
vim.api.nvim_set_hl(0, "CmpFloatBorder", { bg = bg0 })
vim.api.nvim_set_hl(0, "CmpVisual", { bg = "#61afee", fg = bg0, bold = false })
-- vim.api.nvim_set_hl(0, "CmpVisual", { bg = "#56b6c2", fg = bg0, bold = false })
vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#61afee", bold = true })
-- vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#56b6c2", bold = true })
-- --
-- vim.api.nvim_set_hl(0, "CmpItemMenu", { link = "CustomVType" })

-- item kinds for completions
-- Commented outs are using defaults
vim.api.nvim_set_hl(0, "CmpItemKindVariable", { link = "CustomVVariable" })
vim.api.nvim_set_hl(0, "CmpItemKindMethod", { link = "CustomVFunction" })
vim.api.nvim_set_hl(0, "CmpItemKindFunction", { link = "CustomVFunction" })
vim.api.nvim_set_hl(0, "CmpItemKindConstructor", { link = "CustomVFunction" })
vim.api.nvim_set_hl(0, "CmpItemKindField", { link = "CustomVProperty" })
vim.api.nvim_set_hl(0, "CmpItemKindClass", { link = "CustomVType" })
vim.api.nvim_set_hl(0, "CmpItemKindProperty", { link = "CustomVProperty" })
vim.api.nvim_set_hl(0, "CmpItemKindValue", { link = "Number" })
vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { link = "@keyword" })
vim.api.nvim_set_hl(0, "CmpItemKindConstant", { link = "CustomVBool" })
vim.api.nvim_set_hl(0, "CmpItemKindText", { link = "TelescopeMatching" })
vim.api.nvim_set_hl(0, "CmpItemKindTypeParameter", { link = "@variable.parameter" })

-- vim.api.nvim_set_hl(0, "CmpItemKindStruct", { link = "CustomVType" })
-- vim.api.nvim_set_hl(0, "CmpItemKindEnumMember", { link = "CustomVPurple" })
-- vim.api.nvim_set_hl(0, "CmpItemKindEnum", { link = "CustomVType" })
vim.api.nvim_set_hl(0, "CmpItemKindInterface", { link = "CustomVType" })
--
vim.api.nvim_set_hl(0, "CmpItemKindStruct", { link = "CustomVStruct" })
vim.api.nvim_set_hl(0, "CmpItemKindEnumMember", { link = "CustomVEnumMember" })
vim.api.nvim_set_hl(0, "CmpItemKindEnum", { link = "CustomVEnum" })
-- vim.api.nvim_set_hl(0, "CmpItemKindInterface", { link = "CustomVInterface" })
--
-- vim.api.nvim_set_hl(0, "CmpItemKindColor", { link = "" })
-- vim.api.nvim_set_hl(0, "CmpItemKindModule", { link = "" })
-- vim.api.nvim_set_hl(0, "CmpItemKindUnit", { link = "" })
-- vim.api.nvim_set_hl(0, "CmpItemKindSnippet", { link = "" })
-- vim.api.nvim_set_hl(0, "CmpItemKindFile", { link = "" })
-- vim.api.nvim_set_hl(0, "CmpItemKindReference", { link = "" })
-- vim.api.nvim_set_hl(0, "CmpItemKindFolder", { link = "" })
-- vim.api.nvim_set_hl(0, "CmpItemKindEvent", { link = "" })
-- vim.api.nvim_set_hl(0, "CmpItemKindOperator", { link = "" })
--
-- 'Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None'
--
vim.api.nvim_set_hl(0, "Include", { link = "@keyword.repeat" })
vim.api.nvim_set_hl(0, "@punctuation.delimiter", { fg = "white" })
vim.api.nvim_set_hl(0, "@property", { link = "CustomVVariable" })
vim.api.nvim_set_hl(0, "Label", { link = "CustomVVariable" })
vim.api.nvim_set_hl(0, "@punctuation.bracket", { link = "CustomVPurple" })
vim.api.nvim_set_hl(0, "Delimiter", { link = "CustomVPurple" })
vim.api.nvim_set_hl(0, "Boolean", { link = "CustomVBool" })
vim.api.nvim_set_hl(0, "@constant.builtin", { link = "CustomVBool" })
vim.api.nvim_set_hl(0, "@constant", { link = "CustomVBool" })
vim.api.nvim_set_hl(0, "@keyword.storage", { link = "CustomVBool" })
vim.api.nvim_set_hl(0, "Type", { link = "CustomVType" })
vim.api.nvim_set_hl(0, "@type.builtin", { link = "CustomVType" })
vim.api.nvim_set_hl(0, "Function", { link = "CustomVFunction" })
vim.api.nvim_set_hl(0, "@function", { link = "CustomVFunction" })
vim.api.nvim_set_hl(0, "@function.builtin", { link = "CustomVFunction" })
vim.api.nvim_set_hl(0, "@variable", { link = "CustomVVariable" })
vim.api.nvim_set_hl(0, "@variable.member", { link = "CustomVProperty" })
vim.api.nvim_set_hl(0, "@function.call", { link = "CustomVFunction" })

vim.api.nvim_set_hl(0, "@punctuation.bracket.tsx", { link = "CustomVPurple" })
vim.api.nvim_set_hl(0, "@punctuation.bracket", { link = "CustomVPurple" })
vim.api.nvim_set_hl(0, "@punctuation.bracket.typescript", { link = "CustomVPurple" })
-- ; ,
vim.api.nvim_set_hl(0, "@punctuation.delimiter.tsx", { link = "@none" })
vim.api.nvim_set_hl(0, "@punctuation.delimiter.typescript", { link = "@none" })
-- <></>
vim.api.nvim_set_hl(0, "@tag.delimiter.tsx", { link = "CustomVHTML" })
-- <tagName></tagName>
vim.api.nvim_set_hl(0, "@tag.builtin.tsx", { link = "CustomVBool" })
vim.api.nvim_set_hl(0, "@constant.builtin", { link = "CustomVBool" })
-- let var: Type;
vim.api.nvim_set_hl(0, "@type.builtin.tsx", { link = "CustomVType" })
vim.api.nvim_set_hl(0, "@type.builtin.typescript", { link = "CustomVType" })
vim.api.nvim_set_hl(0, "@type.tsx", { link = "CustomVType" })
vim.api.nvim_set_hl(0, "@type.typescript", { link = "CustomVType" })

-- object property
vim.api.nvim_set_hl(0, "@variable.member.typescript", { link = "CustomVProperty" })
vim.api.nvim_set_hl(0, "@variable.member.tsx", { link = "CustomVProperty" })
vim.api.nvim_set_hl(0, "@variable.member", { link = "CustomVProperty" })
vim.api.nvim_set_hl(0, "@property", { link = "CustomVProperty" })

vim.api.nvim_set_hl(0, "@boolean.tsx", { link = "CustomVBool" })
vim.api.nvim_set_hl(0, "@boolean", { link = "CustomVBool" })
vim.api.nvim_set_hl(0, "@boolean.typescript", { link = "CustomVBool" })

-- vars
vim.api.nvim_set_hl(0, "@variable.tsx", { link = "CustomVVariable" })
vim.api.nvim_set_hl(0, "@variable.typescript", { link = "CustomVVariable" })
vim.api.nvim_set_hl(0, "@variable.typescript", { link = "CustomVVariable" })
vim.api.nvim_set_hl(0, "@variable.builtin.tsx", { link = "CustomVVariable" })
vim.api.nvim_set_hl(0, "@variable.builtin.typescript", { link = "CustomVVariable" })

-- imports
vim.api.nvim_set_hl(0, "@keyword.import.tsx", { link = "@keyword.coroutine.tsx" })
vim.api.nvim_set_hl(0, "@keyword.import.typescript", { link = "@keyword.coroutine.tsx" })

-- funcs
vim.api.nvim_set_hl(0, "@function.tsx", { link = "CustomVFunction" })
vim.api.nvim_set_hl(0, "@function.typescript", { link = "CustomVFunction" })
vim.api.nvim_set_hl(0, "@function", { link = "CustomVFunction" })

-- func calls
vim.api.nvim_set_hl(0, "@function.call", { link = "CustomVFunction" })
vim.api.nvim_set_hl(0, "@function.method.call", { link = "CustomVFunction" })
vim.api.nvim_set_hl(0, "@function.call.tsx", { link = "CustomVFunction" })
vim.api.nvim_set_hl(0, "@function.call.rust", { link = "CustomVFunction" })
vim.api.nvim_set_hl(0, "@function.call.typescript", { link = "CustomVFunction" })
vim.api.nvim_set_hl(0, "@function.method.call.typescript", { link = "CustomVFunction" })
vim.api.nvim_set_hl(0, "@function.method.call.tsx", { link = "CustomVFunction" })
vim.api.nvim_set_hl(0, "@constructor.cpp", { link = "CustomVFunction" })

-- tags attr className
vim.api.nvim_set_hl(0, "@tag.attribute.tsx", { link = "CustomVProperty" })
-- tsx tag
vim.api.nvim_set_hl(0, "@tag.tsx", { link = "CustomVType" })

--
--
-- Semantic tokens override
--
--
vim.api.nvim_set_hl(0, "@lsp.type.method.rust", { link = "CustomVFunction" })
vim.api.nvim_set_hl(0, "@lsp.type.method", { link = "CustomVFunction" })
vim.api.nvim_set_hl(0, "@lsp.typemod.method.defaultLibrary", { link = "CustomVFunction" })
vim.api.nvim_set_hl(0, "@lsp.typemod.function.defaultLibrary", { link = "CustomVFunction" })
vim.api.nvim_set_hl(0, "@function.macro.rust", { link = "@variable.parameter" })
vim.api.nvim_set_hl(0, "@lsp.type.macro", { link = "@variable.parameter" })
vim.api.nvim_set_hl(0, "@type", { link = "CustomVType" })

-- vim.api.nvim_set_hl(0, "@lsp.type.attributeBracket", { link = "" })
-- vim.api.nvim_set_hl(0, "@lsp.type.builtinAttribute", { link = "" })
vim.api.nvim_set_hl(0, "@lsp.type.builtinType", { link = "CustomVType" })
vim.api.nvim_set_hl(0, "@lsp.type.class", { link = "CustomVType" })
-- vim.api.nvim_set_hl(0, "@lsp.type.comment", { link = "" })
-- vim.api.nvim_set_hl(0, "@lsp.type.decorator", { link = "" })
-- vim.api.nvim_set_hl(0, "@lsp.type.derive", { link = "" })
vim.api.nvim_set_hl(0, "@lsp.type.enum", { link = "CustomVEnum" })
vim.api.nvim_set_hl(0, "@lsp.type.enumMember", { link = "CustomVEnumMember" })
-- vim.api.nvim_set_hl(0, "@lsp.type.formatSpecifier", { link = "" })
vim.api.nvim_set_hl(0, "@lsp.type.function", { link = "CustomVFunction" })
-- vim.api.nvim_set_hl(0, "@lsp.type.generic", { link = "" })
vim.api.nvim_set_hl(0, "@lsp.type.interface", { link = "CustomVType" })
vim.api.nvim_set_hl(0, "@lsp.type.keyword", { link = "@keyword" })
vim.api.nvim_set_hl(0, "@lsp.type.macro", { link = "@function.macro.rust" })
vim.api.nvim_set_hl(0, "@lsp.type.method", { link = "CustomVFunction" })
-- vim.api.nvim_set_hl(0, "@lsp.type.namespace", { link = "" })
vim.api.nvim_set_hl(0, "@lsp.type.parameter", { link = "@function.macro.rust" })
vim.api.nvim_set_hl(0, "@lsp.type.property", { link = "CustomVProperty" })
vim.api.nvim_set_hl(0, "@lsp.type.selfKeyword", { fg = "#f72058" })
vim.api.nvim_set_hl(0, "@lsp.type.selfTypeKeyword", { fg = "#e03d68" })
vim.api.nvim_set_hl(0, "@lsp.type.string", { link = "@string" })
vim.api.nvim_set_hl(0, "@lsp.type.struct", { link = "CustomVStruct" })
vim.api.nvim_set_hl(0, "@lsp.type.type", { link = "CustomVType" })
vim.api.nvim_set_hl(0, "@lsp.type.typeAlias", { link = "CustomVType" }) -- change ?
vim.api.nvim_set_hl(0, "@lsp.type.typeParameter", { link = "CustomVType" })
vim.api.nvim_set_hl(0, "@lsp.type.variable", { link = "CustomVVariable" })
-- used for color difference between function paramenters that have been shadowed and regular variables
-- vim.api.nvim_set_hl(0, "@lsp.typemod.variable.reference.rust", { link = "@lsp.type.parameter" })
vim.api.nvim_set_hl(0, "@lsp.typemod.variable.declaration.rust", { link = "CustomVVariable" })
vim.api.nvim_set_hl(0, "@lsp.typemod.variable.mutable.rust", { link = "CustomVVariable" })

vim.api.nvim_set_hl(0, "@module", { link = "CmpItemKindModule" })

-- Char
-- vim.api.nvim_set_hl(0, "@character", { link = "CustomVChar" })

vim.api.nvim_set_hl(0, "@lsp.type.generic.rust", {})
vim.api.nvim_set_hl(0, "@lsp.mod.macro.rust", {})
vim.api.nvim_set_hl(0, "@lsp.typemod.generic.macro.rust", {})
vim.api.nvim_set_hl(0, "@lsp.type.decorator.rust", {})
vim.api.nvim_set_hl(0, "@lsp.type.lifetime", { link = "Special" })
vim.api.nvim_set_hl(0, "@lsp.type.lifetime.rust", { link = "@lsp.type.lifetime" })
