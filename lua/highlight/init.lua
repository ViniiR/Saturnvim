local theme = require("highlight.theme")

-- IMPORTANT NOTE:
-- to disable a highlight set it { link = "" }
local highlights = {}

-- CustomV
highlights["CustomVBool"] = { fg = "#4d98d6" }
highlights["CustomVHTML"] = { fg = "#808080" }
highlights["CustomVVariable"] = { fg = "#4fc1ff" }
highlights["CustomVFunction"] = { fg = "#d4814e" }
highlights["CustomVType"] = { fg = "#4ebd90" }
highlights["CustomVProperty"] = { fg = "#8dc5e3" }
highlights["CustomVPurple"] = { fg = "#bfa7f2" }
highlights["Constant"] = { fg = "#4d98d6" }
highlights["VFixme"] = { bg = "NONE", fg = "pink", underline = true }
highlights["VTodo"] = { bg = "NONE", fg = "yellow", underline = true }
-- highlights["CustomVChar"] = { fg = "#ed4a57" }
highlights["CustomVChar"] = { link = "@variable.parameter" }
highlights["CustomVEnum"] = { fg = "#4ebd90" }
highlights["CustomVEnumMember"] = { fg = "#4d98d6" }
highlights["CustomVStruct"] = { fg = "#4ebd90" }
highlights["CustomVLualineGreen"] = { fg = "#7eca9c", bg = "#323942" }
highlights["CustomVLualineGreenLsp"] = { fg = "#51db44", bg = "#323942" }
highlights["CustomVLualineYellow"] = { fg = "yellow", bg = "#323942" }
highlights["CustomVLualineLspRed"] = { fg = "red", bg = "#323942" }
highlights["CustomVNix"] = { fg = "#5277C3", bg = "#323942" }

-- vim illuminate
highlights["IlluminatedWord"] = { bold = false, bg = theme.colors.illuminate_bg }
highlights["IlluminatedCurWord"] = { bold = false, bg = theme.colors.illuminate_bg }
highlights["IlluminatedWordRead"] = { bold = false, bg = theme.colors.illuminate_bg }
highlights["IlluminatedWordText"] = { bold = false, bg = theme.colors.illuminate_bg }
highlights["IlluminatedWordWrite"] = { bold = false, bg = theme.colors.illuminate_bg }

-- comments
highlights["@comment.error.comment"] = { link = "VFixme" }
highlights["@comment.todo.comment"] = { link = "VTodo" }

--lsp hover
highlights["FloatBorder"] = { link = "CmpFloatBorder" }
highlights["NormalFloat"] = { link = "CmpNormal" }

-- left editor column in general
highlights["GitSignsCurrentLineBlame"] = { link = "comment" }
highlights["FoldColumn"] = { link = "Normal" }

-- cmp
highlights["Title"] = { bg = theme.colors.one_bg, fg = theme.colors.title_fg }
highlights["CmpNormal"] = { bg = theme.colors.one_bg }
highlights["CmpFloatBorder"] = { bg = theme.colors.one_bg }
-- selection
-- CmpItemAbbrMatchFuzzy fg=#56b6c2
highlights["CmpItemAbbrMatchFuzzy"] = { fg = theme.colors.matching_bg, underline = false, bold = true }
highlights["CmpVisual"] = { bg = theme.colors.matching_bg, fg = theme.colors.cmp_selected_text_fg, bold = false }
highlights["CmpItemAbbrMatch"] = { fg = theme.colors.matching_bg, bold = true }
-- highlights["CmpVisual", { bg = "#56b6c2"] = fg = COLORS.cmp_selected_text_fg, bold = false }
-- highlights["CmpItemAbbrMatch", { fg = "#56b6c2"] = bold = true }
-- --
-- highlights["CmpItemMenu"] = { link = "CustomVType" }

-- item kinds for completions
-- Commented outs are using defaults
highlights["CmpItemKindVariable"] = { link = "CustomVVariable" }
highlights["CmpItemKindMethod"] = { link = "CustomVFunction" }
highlights["CmpItemKindFunction"] = { link = "CustomVFunction" }
highlights["CmpItemKindConstructor"] = { link = "CustomVFunction" }
highlights["CmpItemKindField"] = { link = "CustomVProperty" }
highlights["CmpItemKindClass"] = { link = "CustomVType" }
highlights["CmpItemKindProperty"] = { link = "CustomVProperty" }
highlights["CmpItemKindValue"] = { link = "Number" }
highlights["CmpItemKindKeyword"] = { link = "@keyword" }
highlights["CmpItemKindConstant"] = { link = "CustomVBool" }
highlights["CmpItemKindText"] = { link = "TelescopeMatching" }
-- try changing to CustomVType
highlights["CmpItemKindTypeParameter"] = { link = "@variable.parameter" }

-- highlights["CmpItemKindStruct"] = { link = "CustomVType" }
-- highlights["CmpItemKindEnumMember"] = { link = "CustomVPurple" }
-- highlights["CmpItemKindEnum"] = { link = "CustomVType" }
highlights["CmpItemKindInterface"] = { link = "CustomVType" }
highlights["CmpItemKindStruct"] = { link = "CustomVStruct" }
highlights["CmpItemKindEnumMember"] = { link = "CustomVEnumMember" }
highlights["CmpItemKindEnum"] = { link = "CustomVEnum" }
highlights["CmpItemKindHtml"] = { link = "CmpItemKindSnippet" }
highlights["CmpItemKindVersion"] = { link = "DiagnosticInfo" }
highlights["CmpItemKindFeature"] = { link = "CustomVFunction" }
-- highlights["CmpItemKindInterface"] = { link = "CustomVInterface" }
--
-- highlights["CmpItemKindColor"] = { link = "" }
-- highlights["CmpItemKindModule"] = { link = "" }
-- highlights["CmpItemKindUnit"] = { link = "" }
-- highlights["CmpItemKindSnippet"] = { link = "" }
-- highlights["CmpItemKindFile"] = { link = "" }
-- highlights["CmpItemKindReference"] = { link = "" }
-- highlights["CmpItemKindFolder"] = { link = "" }
-- highlights["CmpItemKindEvent"] = { link = "" }
-- highlights["CmpItemKindOperator"] = { link = "" }
--
-- 'Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None'
--
highlights["Include"] = { link = "@keyword.repeat" }
highlights["@punctuation.delimiter"] = { fg = "#abb2bf" }
highlights["@property"] = { link = "CustomVVariable" }
highlights["Label"] = { link = "CustomVVariable" }
highlights["@punctuation.bracket"] = { link = "CustomVPurple" }
highlights["Delimiter"] = { link = "CustomVPurple" }
highlights["Boolean"] = { link = "CustomVBool" }
highlights["@constant.builtin"] = { link = "CustomVBool" }
highlights["@constant"] = { link = "CustomVBool" }
highlights["@keyword.storage"] = { link = "CustomVBool" }
highlights["Type"] = { link = "CustomVType" }
highlights["@type.builtin"] = { link = "CustomVType" }
highlights["Function"] = { link = "CustomVFunction" }
highlights["@function"] = { link = "CustomVFunction" }
highlights["@function.builtin"] = { link = "CustomVFunction" }
highlights["@variable"] = { link = "CustomVVariable" }
highlights["@variable.member"] = { link = "CustomVProperty" }
highlights["@function.call"] = { link = "CustomVFunction" }

highlights["@punctuation.bracket.tsx"] = { link = "CustomVPurple" }
highlights["@punctuation.bracket"] = { link = "CustomVPurple" }
highlights["@punctuation.bracket.typescript"] = { link = "CustomVPurple" }
-- ; ,
highlights["@punctuation.delimiter.tsx"] = { link = "@none" }
highlights["@punctuation.delimiter.typescript"] = { link = "@none" }
-- <></>
highlights["@tag.delimiter.tsx"] = { link = "CustomVHTML" }
-- <tagName></tagName>
highlights["@tag.builtin.tsx"] = { link = "CustomVBool" }
highlights["@constant.builtin"] = { link = "CustomVBool" }
-- let var: Type;
highlights["@type.builtin.tsx"] = { link = "CustomVType" }
highlights["@type.builtin.typescript"] = { link = "CustomVType" }
highlights["@type.tsx"] = { link = "CustomVType" }
highlights["@type.typescript"] = { link = "CustomVType" }

-- object property
highlights["@variable.member.typescript"] = { link = "CustomVProperty" }
highlights["@variable.member.tsx"] = { link = "CustomVProperty" }
highlights["@variable.member"] = { link = "CustomVProperty" }
highlights["@property"] = { link = "CustomVProperty" }

highlights["@boolean.tsx"] = { link = "CustomVBool" }
highlights["@boolean"] = { link = "CustomVBool" }
highlights["@boolean.typescript"] = { link = "CustomVBool" }

-- vars
highlights["@variable.tsx"] = { link = "CustomVVariable" }
highlights["@variable.typescript"] = { link = "CustomVVariable" }
highlights["@variable.typescript"] = { link = "CustomVVariable" }
-- possible TODO:
-- disable variable.builtin so built-in variables have special highlight (default: red-ish)
highlights["@variable.builtin.tsx"] = { link = "CustomVVariable" }
highlights["@variable.builtin.typescript"] = { link = "CustomVVariable" }
highlights["@variable.builtin.javascript"] = { link = "CustomVVariable" }

-- imports
highlights["@keyword.import.tsx"] = { link = "@keyword.coroutine.tsx" }
highlights["@keyword.import.typescript"] = { link = "@keyword.coroutine.tsx" }

-- funcs
highlights["@function.tsx"] = { link = "CustomVFunction" }
highlights["@function.typescript"] = { link = "CustomVFunction" }
highlights["@function"] = { link = "CustomVFunction" }

-- func calls
highlights["@function.call"] = { link = "CustomVFunction" }
highlights["@function.method"] = { link = "CustomVFunction" }
highlights["@function.method.call"] = { link = "CustomVFunction" }
highlights["@function.call.tsx"] = { link = "CustomVFunction" }
highlights["@function.call.rust"] = { link = "CustomVFunction" }
highlights["@character.rust"] = { link = "CustomVChar" }
highlights["@character.special.rust"] = { link = "Special" }
highlights["@punctuation.special.rust"] = { fg = "#e5c07b" } -- lsp namespace color
highlights["@function.call.typescript"] = { link = "CustomVFunction" }
highlights["@function.method.call.typescript"] = { link = "CustomVFunction" }
highlights["@function.method.call.tsx"] = { link = "CustomVFunction" }
highlights["@constructor.cpp"] = { link = "CustomVFunction" }

-- tags attr className
highlights["@tag.attribute.tsx"] = { link = "CustomVProperty" }
-- tsx tag
highlights["@tag.tsx"] = { link = "CustomVType" }
--
--
-- Semantic tokens override
--
--
highlights["@lsp.type.method.rust"] = { link = "CustomVFunction" }
highlights["@lsp.type.method"] = { link = "CustomVFunction" }
highlights["@lsp.typemod.method.defaultLibrary"] = { link = "CustomVFunction" }
highlights["@lsp.typemod.function.defaultLibrary"] = { link = "CustomVFunction" }
highlights["@function.macro.rust"] = { link = "@variable.parameter" }
highlights["@lsp.mod.macro.rust"] = { fg = "red", link = "@variable.parameter" }
highlights["@lsp.typemod.macro.declaration.rust"] = { link = "CustomVFunction" }
highlights["@lsp.type.macro"] = { link = "@variable.parameter" }
highlights["@type"] = { link = "CustomVType" }
highlights["@lsp.typemod.operator.controlFlow.rust"] = { link = "Special" }

-- highlights["@lsp.type.attributeBracket"] = { link = "" }
-- highlights["@lsp.type.builtinAttribute"] = { link = "" }
highlights["@lsp.type.builtinType"] = { link = "CustomVType" }
highlights["@lsp.type.class"] = { link = "CustomVType" }
-- highlights["@lsp.type.comment"] = { link = "" }
-- highlights["@lsp.type.decorator"] = { link = "" }
-- highlights["@lsp.type.derive"] = { link = "" }
highlights["@lsp.type.enum"] = { link = "CustomVEnum" }
highlights["@lsp.type.enumMember"] = { link = "CustomVEnumMember" }
-- highlights["@lsp.type.formatSpecifier"] = { link = "" }
highlights["@lsp.type.function"] = { link = "CustomVFunction" }
-- highlights["@lsp.type.generic"] = { link = "" }
highlights["@lsp.type.interface"] = { link = "CustomVType" }
highlights["@lsp.type.keyword"] = { link = "@keyword" }
highlights["@keyword.debug.rust"] = { link = "@variable.parameter" }
highlights["@lsp.type.macro"] = { link = "@function.macro.rust" }
highlights["@lsp.type.method"] = { link = "CustomVFunction" }
-- highlights["@lsp.type.namespace"] = { link = "" }
highlights["@lsp.type.parameter"] = { link = "@function.macro.rust" }
highlights["@lsp.type.property"] = { link = "CustomVProperty" }
-- change this to better colors this is useful
highlights["@lsp.type.selfKeyword"] = { link = "CustomVBool" }
highlights["@lsp.type.selfTypeKeyword"] = { link = "CustomVType" }
-- old
-- highlights["@lsp.type.selfKeyword"] = { fg = "#f72058" }
-- highlights["@lsp.type.selfTypeKeyword"] = { fg = "#e03d68" }
highlights["@lsp.type.string"] = { link = "@string" }
highlights["@lsp.type.struct"] = { link = "CustomVStruct" }
highlights["@lsp.type.struct.rust"] = { link = "CustomVType" }
highlights["@lsp.type.type"] = { link = "CustomVType" }
highlights["@lsp.type.typeAlias"] = { link = "CustomVType" } -- change ?
highlights["@lsp.type.typeParameter"] = { link = "CustomVType" }
-- highlights["@lsp.type.variable"] = { link = "CustomVVariable" }
highlights["@lsp.type.variable.rust"] = { link = "CustomVVariable" }
highlights["@lsp.type.formatSpecifier.rust"] = { link = "CustomVChar" }
--
highlights["@lsp.mod.public.rust"] = { link = "CustomVFunction" }
highlights["@lsp.typemod.namespace.macro.rust"] = { link = "@lsp.type.namespace" }

-- disables stupid variable hl on modules
highlights["@lsp.mod.macro.rust"] = { link = "" }
highlights["@lsp.mod.procMacro.rust"] = { link = "" }
highlights["@lsp.typemod.variable.macro.rust"] = { link = "" }
highlights["@lsp.typemod.variable.procMacro.rust"] = { link = "" }
--

-- used for color difference between function parameters that have been shadowed and regular variables
highlights["@lsp.typemod.variable.reference.rust"] = { link = "@lsp.type.parameter" }
highlights["@lsp.typemod.variable.declaration.rust"] = { link = "CustomVVariable", default = true }
highlights["@lsp.typemod.variable.mutable.rust"] = { link = "CustomVVariable" }

-- normal modules
-- highlights["@module"] = { link = "CmpItemKindModule" }
-- red modules (nvchad)
highlights["@module"] = { link = "@variable.parameter" }
-- yellow modules
-- highlights["@module.rust"] = { link = "@lsp.type.namespace" }

-- Char
-- highlights["@character"] = { link = "CustomVChar" }

highlights["@lsp.type.generic.rust"] = {}
highlights["@lsp.mod.macro.rust"] = {}
highlights["@lsp.typemod.generic.macro.rust"] = {}
highlights["@lsp.type.decorator.rust"] = {}
highlights["@lsp.type.lifetime"] = { link = "Special" }
highlights["@lsp.type.lifetime.rust"] = { link = "@lsp.type.lifetime" }

highlights["DevIconc"] = { fg = theme.colors.blue }
highlights["DevIconcss"] = { fg = theme.colors.blue }
highlights["DevIcondeb"] = { fg = theme.colors.cyan }
highlights["DevIconDockerfile"] = { fg = theme.colors.cyan }
highlights["DevIconhtml"] = { fg = theme.colors.baby_pink }
highlights["DevIconjpeg"] = { fg = theme.colors.dark_purple }
highlights["DevIconjpg"] = { fg = theme.colors.dark_purple }
highlights["DevIconjs"] = { fg = theme.colors.sun }
highlights["DevIconkt"] = { fg = theme.colors.orange }
highlights["DevIconlock"] = { fg = theme.colors.red }
highlights["DevIconlua"] = { fg = theme.colors.blue }
highlights["DevIconmp3"] = { fg = theme.colors.white }
highlights["DevIconmp4"] = { fg = theme.colors.white }
highlights["DevIconout"] = { fg = theme.colors.white }
highlights["DevIconpng"] = { fg = theme.colors.dark_purple }
highlights["DevIconpy"] = { fg = theme.colors.cyan }
highlights["DevIcontoml"] = { fg = theme.colors.blue }
highlights["DevIconts"] = { fg = theme.colors.teal }
highlights["DevIconttf"] = { fg = theme.colors.white }
highlights["DevIconrb"] = { fg = theme.colors.pink }
highlights["DevIconrpm"] = { fg = theme.colors.orange }
highlights["DevIconvue"] = { fg = theme.colors.vibrant_green }
highlights["DevIconwoff"] = { fg = theme.colors.white }
highlights["DevIconwoff2"] = { fg = theme.colors.white }
highlights["DevIconxz"] = { fg = theme.colors.sun }
highlights["DevIconzip"] = { fg = theme.colors.sun }
highlights["DevIconZig"] = { fg = theme.colors.orange }
highlights["DevIconMd"] = { fg = theme.colors.blue }
highlights["DevIconTSX"] = { fg = theme.colors.ts_fg }
highlights["DevIconJSX"] = { fg = theme.colors.blue }
highlights["DevIconSvelte"] = { fg = theme.colors.red }
highlights["DevIconJava"] = { fg = theme.colors.orange }
highlights["DevIconDart"] = { fg = theme.colors.cyan }

-- git
highlights["diffNewFile"] = { fg = theme.colors.blue }
highlights["DiffText"] = { fg = theme.colors.white, bg = theme.colors.black2 }
highlights["gitcommitOverflow"] = { fg = theme.scheme.base08 }
highlights["gitcommitSummary"] = { fg = theme.scheme.base0B }
highlights["gitcommitComment"] = { fg = theme.scheme.base03 }
highlights["gitcommitUntracked"] = { fg = theme.scheme.base03 }
highlights["gitcommitDiscarded"] = { fg = theme.scheme.base03 }
highlights["gitcommitSelected"] = { fg = theme.scheme.base03 }
highlights["gitcommitHeader"] = { fg = theme.scheme.base0E }
highlights["gitcommitSelectedType"] = { fg = theme.scheme.base0D }
highlights["gitcommitUnmergedType"] = { fg = theme.scheme.base0D }
highlights["gitcommitDiscardedType"] = { fg = theme.scheme.base0D }
highlights["gitcommitBranch"] = { fg = theme.scheme.base09, bold = true }
highlights["gitcommitUntrackedFile"] = { fg = theme.scheme.base0A }
highlights["gitcommitUnmergedFile"] = { fg = theme.scheme.base08, bold = true }
highlights["gitcommitDiscardedFile"] = { fg = theme.scheme.base08, bold = true }
highlights["gitcommitSelectedFile"] = { fg = theme.scheme.base0B, bold = true }
-- Telescope
--highlights["TelescopeBorder"] = { fg = colors.white }
--highlights["TelescopePromptBorder"] = { fg = "#373b43" }
--highlights["TelescopePreviewBorder"] = { fg = "#373b43" }
--highlights["TelescopeResultsBorder"] = { fg = "#373b43" }
--highlights["TelescopePromptPrefix"] = { fg = "#373b43" }
--highlights["TelescopeMatching"] = { fg = colors.blue, bg = colors.one_bg }
--highlights["TelescopeSelectionCaret"] = { fg = "#5acc37" }

-- Telescope
--
-- borders
highlights["TelescopeBorder"] = { fg = theme.colors.one_bg3 }
highlights["TelescopePromptBorder"] = { fg = theme.colors.one_bg3 }
highlights["TelescopePreviewBorder"] = { fg = theme.colors.one_bg3 }
highlights["TelescopeResultsBorder"] = { fg = theme.colors.one_bg3 }

highlights["TelescopePromptTitle"] = { fg = theme.colors.black, bg = theme.colors.red }

highlights["TelescopeSelection"] = { bg = theme.colors.grey, fg = "none" }
highlights["TelescopeResultsDiffAdd"] = { fg = theme.colors.green }
highlights["TelescopeResultsDiffChange"] = { fg = theme.colors.yellow }
highlights["TelescopeResultsDiffDelete"] = { fg = theme.colors.red }

highlights["TelescopeMatching"] = { bg = "none", fg = theme.colors.matching_bg }
highlights["TelescopeResultsTitle"] = { fg = theme.colors.black, bg = theme.colors.green }
highlights["TelescopePreviewTitle"] = { fg = theme.colors.black, bg = theme.colors.blue }
highlights["TelescopePromptPrefix"] = { fg = theme.colors.red, bg = "none" }
highlights["TelescopeNormal"] = { bg = "none" }
highlights["TelescopePromptNormal"] = { bg = "none" }

-- LSP diagnostics virtual text
highlights["DiagnosticVirtualTextInfo"] = { fg = theme.colors.info_diagnostic_fg, bg = "none" }
highlights["DiagnosticVirtualTextHint"] = { fg = theme.colors.purple, bg = "none" }
highlights["DiagnosticVirtualTextWarn"] = { fg = theme.colors.yellow, bg = "none" }
highlights["DiagnosticVirtualTextError"] = { fg = theme.colors.red, bg = "none" }

-- LSP diagnostics icons(generally)
highlights["DiagnosticInfo"] = { fg = theme.colors.info_diagnostic_fg }
highlights["DiagnosticHint"] = { fg = theme.colors.purple }
highlights["DiagnosticWarn"] = { fg = theme.colors.yellow }
highlights["DiagnosticError"] = { fg = theme.colors.red }

highlights["LspSignatureActiveParameter"] = { fg = theme.colors.black, bg = theme.colors.green }

-- dap
highlights["DapBreakpoint"] = { fg = theme.colors.bright_red }
highlights["DapBreakpointCondition"] = { fg = theme.colors.red }
highlights["DapLogPoint"] = { fg = theme.colors.yellow }
highlights["DapStopped"] = { fg = theme.colors.bright_red }
highlights["DapBreakpointRejected"] = { fg = theme.colors.bright_red }

-- ibl indent blank line
highlights["IblIndent"] = theme.colors.indent_bar_hl
highlights["IblWhitespace"] = theme.colors.indent_whitespace_hl
highlights["Whitespace"] = theme.colors.whitespace_hl
highlights["IblScope"] = { fg = "grey", bg = "none" }
-- vim.api.nvim_set_hl(0, "@ibl.scope.underline.1", { fg = "white", bg = "none" })

-- HTML
highlights["@tag.delimiter.html"] = { link = "@tag.delimiter.tsx" }
highlights["@tag.html"] = { link = "@tag.builtin.tsx" }
highlights["@tag.attribute.html"] = { link = "@tag.attribute.tsx" }
-- XML
highlights["@tag.delimiter.xml"] = { link = "@tag.delimiter.tsx" }
highlights["@tag.xml"] = { fg = "#ed4a57" }

-- nvim default for \n chars
highlights["NonText"] = theme.colors.whitespace_hl
-- nvim lsp inlay hint
highlights["LspInlayHint"] = { fg = "#5c6370" } --  by default links to NonText so hard code default color or NonText

-- which key
highlights["WhichKeySeparator"] = { fg = "#a5a9ae" }

-- nix
highlights["@string.special.path.nix"] = { link = "@variable.parameter" }

-- disabled
highlights["@none.tsx"] = { link = "" }

--

for hl_name, hl_value in pairs(highlights) do
    vim.api.nvim_set_hl(0, hl_name, hl_value)
end
