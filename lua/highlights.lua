-- PLEASE DELETE ALL OF THE COMMENTED OUT IF IT WORKS FINE FROM NOW ON TODO

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
highlights["CustomVLualineYellow"] = { fg = "yellow", bg = "#323942" }

-- vim illuminate
highlights["IlluminatedWord"] = { bold = false, bg = COLORS.illuminate_bg }
highlights["IlluminatedCurWord"] = { bold = false, bg = COLORS.illuminate_bg }
highlights["IlluminatedWordRead"] = { bold = false, bg = COLORS.illuminate_bg }
highlights["IlluminatedWordText"] = { bold = false, bg = COLORS.illuminate_bg }
highlights["IlluminatedWordWrite"] = { bold = false, bg = COLORS.illuminate_bg }

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
highlights["Title"] = { bg = COLORS.one_bg, fg = COLORS.title_fg }
highlights["CmpNormal"] = { bg = COLORS.one_bg }
highlights["CmpFloatBorder"] = { bg = COLORS.one_bg }
-- selection
-- CmpItemAbbrMatchFuzzy fg=#56b6c2
highlights["CmpItemAbbrMatchFuzzy"] = { fg = COLORS.matching_bg, underline = false, bold = true }
highlights["CmpVisual"] = { bg = COLORS.matching_bg, fg = COLORS.cmp_selected_text_fg, bold = false }
highlights["CmpItemAbbrMatch"] = { fg = COLORS.matching_bg, bold = true }
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
highlights["@variable.builtin.tsx"] = { link = "CustomVVariable" }
highlights["@variable.builtin.typescript"] = { link = "CustomVVariable" }

-- imports
highlights["@keyword.import.tsx"] = { link = "@keyword.coroutine.tsx" }
highlights["@keyword.import.typescript"] = { link = "@keyword.coroutine.tsx" }

-- funcs
highlights["@function.tsx"] = { link = "CustomVFunction" }
highlights["@function.typescript"] = { link = "CustomVFunction" }
highlights["@function"] = { link = "CustomVFunction" }

-- func calls
highlights["@function.call"] = { link = "CustomVFunction" }
highlights["@function.method.call"] = { link = "CustomVFunction" }
highlights["@function.call.tsx"] = { link = "CustomVFunction" }
highlights["@function.call.rust"] = { link = "CustomVFunction" }
highlights["@character.rust"] = { link = "CustomVChar" }
highlights["@character.special.rust"] = { link = "@punctuation.delimiter" }
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
highlights["@lsp.type.type"] = { link = "CustomVType" }
highlights["@lsp.type.typeAlias"] = { link = "CustomVType" } -- change ?
highlights["@lsp.type.typeParameter"] = { link = "CustomVType" }
-- highlights["@lsp.type.variable"] = { link = "CustomVVariable" }
highlights["@lsp.type.variable.rust"] = { link = "" }
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

highlights["DevIconc"] = { fg = COLORS.blue }
highlights["DevIconcss"] = { fg = COLORS.blue }
highlights["DevIcondeb"] = { fg = COLORS.cyan }
highlights["DevIconDockerfile"] = { fg = COLORS.cyan }
highlights["DevIconhtml"] = { fg = COLORS.baby_pink }
highlights["DevIconjpeg"] = { fg = COLORS.dark_purple }
highlights["DevIconjpg"] = { fg = COLORS.dark_purple }
highlights["DevIconjs"] = { fg = COLORS.sun }
highlights["DevIconkt"] = { fg = COLORS.orange }
highlights["DevIconlock"] = { fg = COLORS.red }
highlights["DevIconlua"] = { fg = COLORS.blue }
highlights["DevIconmp3"] = { fg = COLORS.white }
highlights["DevIconmp4"] = { fg = COLORS.white }
highlights["DevIconout"] = { fg = COLORS.white }
highlights["DevIconpng"] = { fg = COLORS.dark_purple }
highlights["DevIconpy"] = { fg = COLORS.cyan }
highlights["DevIcontoml"] = { fg = COLORS.blue }
highlights["DevIconts"] = { fg = COLORS.teal }
highlights["DevIconttf"] = { fg = COLORS.white }
highlights["DevIconrb"] = { fg = COLORS.pink }
highlights["DevIconrpm"] = { fg = COLORS.orange }
highlights["DevIconvue"] = { fg = COLORS.vibrant_green }
highlights["DevIconwoff"] = { fg = COLORS.white }
highlights["DevIconwoff2"] = { fg = COLORS.white }
highlights["DevIconxz"] = { fg = COLORS.sun }
highlights["DevIconzip"] = { fg = COLORS.sun }
highlights["DevIconZig"] = { fg = COLORS.orange }
highlights["DevIconMd"] = { fg = COLORS.blue }
highlights["DevIconTSX"] = { fg = COLORS.ts_fg }
highlights["DevIconJSX"] = { fg = COLORS.blue }
highlights["DevIconSvelte"] = { fg = COLORS.red }
highlights["DevIconJava"] = { fg = COLORS.orange }
highlights["DevIconDart"] = { fg = COLORS.cyan }

-- git
highlights["diffNewFile"] = { fg = COLORS.blue }
highlights["DiffText"] = { fg = COLORS.white, bg = COLORS.black2 }
highlights["gitcommitOverflow"] = { fg = THEME.base08 }
highlights["gitcommitSummary"] = { fg = THEME.base0B }
highlights["gitcommitComment"] = { fg = THEME.base03 }
highlights["gitcommitUntracked"] = { fg = THEME.base03 }
highlights["gitcommitDiscarded"] = { fg = THEME.base03 }
highlights["gitcommitSelected"] = { fg = THEME.base03 }
highlights["gitcommitHeader"] = { fg = THEME.base0E }
highlights["gitcommitSelectedType"] = { fg = THEME.base0D }
highlights["gitcommitUnmergedType"] = { fg = THEME.base0D }
highlights["gitcommitDiscardedType"] = { fg = THEME.base0D }
highlights["gitcommitBranch"] = { fg = THEME.base09, bold = true }
highlights["gitcommitUntrackedFile"] = { fg = THEME.base0A }
highlights["gitcommitUnmergedFile"] = { fg = THEME.base08, bold = true }
highlights["gitcommitDiscardedFile"] = { fg = THEME.base08, bold = true }
highlights["gitcommitSelectedFile"] = { fg = THEME.base0B, bold = true }
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
highlights["TelescopeBorder"] = { fg = COLORS.one_bg3 }
highlights["TelescopePromptBorder"] = { fg = COLORS.one_bg3 }
highlights["TelescopePreviewBorder"] = { fg = COLORS.one_bg3 }
highlights["TelescopeResultsBorder"] = { fg = COLORS.one_bg3 }

highlights["TelescopePromptTitle"] = { fg = COLORS.black, bg = COLORS.red }

highlights["TelescopeSelection"] = { bg = COLORS.grey, fg = COLORS.white }
highlights["TelescopeResultsDiffAdd"] = { fg = COLORS.green }
highlights["TelescopeResultsDiffChange"] = { fg = COLORS.yellow }
highlights["TelescopeResultsDiffDelete"] = { fg = COLORS.red }

highlights["TelescopeMatching"] = { bg = "none", fg = COLORS.matching_bg }
highlights["TelescopeResultsTitle"] = { fg = COLORS.black, bg = COLORS.green }
highlights["TelescopePreviewTitle"] = { fg = COLORS.black, bg = COLORS.blue }
highlights["TelescopePromptPrefix"] = { fg = COLORS.red, bg = "none" }
highlights["TelescopeNormal"] = { bg = "none" }
highlights["TelescopePromptNormal"] = { bg = "none" }

-- LSP diagnostics virtual text
highlights["DiagnosticVirtualTextInfo"] = { fg = COLORS.info_diagnostic_fg, bg = "none" }
highlights["DiagnosticVirtualTextHint"] = { fg = COLORS.purple, bg = "none" }
highlights["DiagnosticVirtualTextWarn"] = { fg = COLORS.yellow, bg = "none" }
highlights["DiagnosticVirtualTextError"] = { fg = COLORS.red, bg = "none" }

-- LSP diagnostics icons(generally)
highlights["DiagnosticInfo"] = { fg = COLORS.info_diagnostic_fg }
highlights["DiagnosticHint"] = { fg = COLORS.purple }
highlights["DiagnosticWarn"] = { fg = COLORS.yellow }
highlights["DiagnosticError"] = { fg = COLORS.red }

highlights["LspSignatureActiveParameter"] = { fg = COLORS.black, bg = COLORS.green }

-- dap
highlights["DapBreakpoint"] = { fg = COLORS.bright_red }
highlights["DapBreakpointCondition"] = { fg = COLORS.red }
highlights["DapLogPoint"] = { fg = COLORS.yellow }
highlights["DapStopped"] = { fg = COLORS.bright_red }
highlights["DapBreakpointRejected"] = { fg = COLORS.bright_red }

-- ibl indent blank line
highlights["IblIndent"] = COLORS.indent_bar_hl
highlights["IblWhitespace"] = COLORS.indent_whitespace_hl
highlights["Whitespace"] = COLORS.whitespace_hl
highlights["IblScope"] = { fg = "grey", bg = "none" }
-- vim.api.nvim_set_hl(0, "@ibl.scope.underline.1", { fg = "white", bg = "none" })

-- nvim default for \n chars
highlights["NonText"] = COLORS.whitespace_hl
-- nvim lsp inlay hint
highlights["LspInlayHint"] = { fg = "#5c6370" } --  by default links to NonText so hard code default color or NonText

-- which key
-- highlights["WhichKeySeparator"] = {link = "@ibl.scope.char.1"}

-- disabled
highlights["@none.tsx"] = { link = "" }
--

for hl_name, hl_value in pairs(highlights) do
    vim.api.nvim_set_hl(0, hl_name, hl_value)
end

-- git
-- highlights["diffNewFile"] = { fg = COLORS.blue }
-- highlights["DiffText"] = { fg = COLORS.white, bg = COLORS.black2 }
-- highlights["gitcommitOverflow"] = { fg = THEME.base08 }
-- highlights["gitcommitSummary"] = { fg = THEME.base0B }
-- highlights["gitcommitComment"] = { fg = THEME.base03 }
-- highlights["gitcommitUntracked"] = { fg = THEME.base03 }
-- highlights["gitcommitDiscarded"] = { fg = THEME.base03 }
-- highlights["gitcommitSelected"] = { fg = THEME.base03 }
-- highlights["gitcommitHeader"] = { fg = THEME.base0E }
-- highlights["gitcommitSelectedType"] = { fg = THEME.base0D }
-- highlights["gitcommitUnmergedType"] = { fg = THEME.base0D }
-- highlights["gitcommitDiscardedType"] = { fg = THEME.base0D }
-- highlights["gitcommitBranch"] = { fg = THEME.base09, bold = true }
-- highlights["gitcommitUntrackedFile"] = { fg = THEME.base0A }
-- highlights["gitcommitUnmergedFile"] = { fg = THEME.base08, bold = true }
-- highlights["gitcommitDiscardedFile"] = { fg = THEME.base08, bold = true }
-- highlights["gitcommitSelectedFile"] = { fg = THEME.base0B, bold = true }
-- DiffAdd = {
--   bg = mix(colors.green, colors.black, 90),
--   fg = colors.green,
-- },
--
-- DiffAdded = {
--   bg = mix(colors.green, colors.black, 90),
--   fg = colors.green,
-- },
--
-- DiffChange = {
--   bg = mix(colors.light_grey, colors.black, 90),
--   fg = colors.light_grey,
-- },
--
-- DiffChangeDelete = {
--   bg = mix(colors.red, colors.black, 90),
--   fg = colors.red,
-- },
--
-- DiffModified = {
--   bg = mix(colors.orange, colors.black, 90),
--   fg = colors.orange,
-- },
--
-- DiffDelete = {
--   bg = mix(colors.red, colors.black, 90),
--   fg = colors.red,
-- },
--
-- DiffRemoved = {
--   bg = mix(colors.red, colors.black, 90),
--   fg = colors.red,
-- },

-- old hl_groups(pre-standardization)

-- vim.cmd("highlight CustomVBool guifg=#4d98d6")
-- vim.cmd("highlight CustomVHTML guifg=#808080")
-- vim.cmd("highlight CustomVVariable guifg=#4fc1ff")
-- vim.cmd("highlight CustomVFunction guifg=#d4814e")
-- vim.cmd("highlight CustomVType guifg=#4ebd90")
-- vim.cmd("highlight CustomVProperty guifg=#8dc5e3")
-- vim.cmd("highlight CustomVPurple guifg=#bfa7f2")
-- vim.cmd("highlight Constant guifg=#4d98d6")
-- vim.cmd("highlight VFixme guibg=pink guifg=black")
-- vim.cmd("highlight VTodo guibg=yellow guifg=black")
-- -- vim.cmd("highlight CustomVChar guifg=#ed4a57")
-- vim.cmd("highlight CustomVEnum guifg=#4ebd90")
-- vim.cmd("highlight CustomVEnumMember guifg=#4d98d6")
-- vim.cmd("highlight CustomVStruct guifg=#4ebd90")
-- vim.cmd("highlight CustomVLualineGreen guifg=#7eca9c guibg=#323942")
-- vim.cmd("highlight CustomVLualineYellow guifg=yellow guibg=#323942")
-- -- vim.cmd("highlight CustomVEnum guifg=#4ebd90")
-- -- vim.cmd("highlight CustomVEnumMember guifg=#2685d4")
-- -- vim.cmd("highlight CustomVStruct guifg=#2cac99")
-- -- vim.cmd("highlight CustomVInterface guifg=#af6c92")
-- -- vim.cmd("highlight CustomVInterface guifg=#53db5f")
-- -- onedark themes
-- -- local bg0 = "#363a43"
-- -- local COLORS.illuminate = "#31353f"
-- -- local bg2 = "#393f4a"
-- -- local bg3 = "#3b3f4c"
--
-- -- git
--
-- -- vim.api.nvim_set_hl(0, "diffNewFile", { fg = COLORS.blue })
-- -- vim.api.nvim_set_hl(0, "DiffText", { fg = COLORS.white, bg = COLORS.black2 })
-- -- vim.api.nvim_set_hl(0, "gitcommitOverflow", { fg = THEME.base08 })
-- -- vim.api.nvim_set_hl(0, "gitcommitSummary", { fg = THEME.base0B })
-- -- vim.api.nvim_set_hl(0, "gitcommitComment", { fg = THEME.base03 })
-- -- vim.api.nvim_set_hl(0, "gitcommitUntracked", { fg = THEME.base03 })
-- -- vim.api.nvim_set_hl(0, "gitcommitDiscarded", { fg = THEME.base03 })
-- -- vim.api.nvim_set_hl(0, "gitcommitSelected", { fg = THEME.base03 })
-- -- vim.api.nvim_set_hl(0, "gitcommitHeader", { fg = THEME.base0E })
-- -- vim.api.nvim_set_hl(0, "gitcommitSelectedType", { fg = THEME.base0D })
-- -- vim.api.nvim_set_hl(0, "gitcommitUnmergedType", { fg = THEME.base0D })
-- -- vim.api.nvim_set_hl(0, "gitcommitDiscardedType", { fg = THEME.base0D })
-- -- vim.api.nvim_set_hl(0, "gitcommitBranch", { fg = THEME.base09, bold = true })
-- -- vim.api.nvim_set_hl(0, "gitcommitUntrackedFile", { fg = THEME.base0A })
-- -- vim.api.nvim_set_hl(0, "gitcommitUnmergedFile", { fg = THEME.base08, bold = true })
-- -- vim.api.nvim_set_hl(0, "gitcommitDiscardedFile", { fg = THEME.base08, bold = true })
-- -- vim.api.nvim_set_hl(0, "gitcommitSelectedFile", { fg = THEME.base0B, bold = true })
-- -- DiffAdd = {
-- --   bg = mix(colors.green, colors.black, 90),
-- --   fg = colors.green,
-- -- },
-- --
-- -- DiffAdded = {
-- --   bg = mix(colors.green, colors.black, 90),
-- --   fg = colors.green,
-- -- },
-- --
-- -- DiffChange = {
-- --   bg = mix(colors.light_grey, colors.black, 90),
-- --   fg = colors.light_grey,
-- -- },
-- --
-- -- DiffChangeDelete = {
-- --   bg = mix(colors.red, colors.black, 90),
-- --   fg = colors.red,
-- -- },
-- --
-- -- DiffModified = {
-- --   bg = mix(colors.orange, colors.black, 90),
-- --   fg = colors.orange,
-- -- },
-- --
-- -- DiffDelete = {
-- --   bg = mix(colors.red, colors.black, 90),
-- --   fg = colors.red,
-- -- },
-- --
-- -- DiffRemoved = {
-- --   bg = mix(colors.red, colors.black, 90),
-- --   fg = colors.red,
-- -- },
--
-- -- diagnostics
-- vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = COLORS.info_diagnostic_fg })
-- vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { fg = COLORS.info_diagnostic_fg, bg = "none" })
--
-- -- vim illuminate
-- vim.api.nvim_set_hl(0, "IlluminatedWord", { bold = false, bg = COLORS.illuminate_bg })
-- vim.api.nvim_set_hl(0, "IlluminatedCurWord", { bold = false, bg = COLORS.illuminate_bg })
-- vim.api.nvim_set_hl(0, "IlluminatedWordRead", { bold = false, bg = COLORS.illuminate_bg })
-- vim.api.nvim_set_hl(0, "IlluminatedWordText", { bold = false, bg = COLORS.illuminate_bg })
-- vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { bold = false, bg = COLORS.illuminate_bg })
--
-- -- comments
-- vim.api.nvim_set_hl(0, "@comment.error.comment", { link = "VFixme" })
-- vim.api.nvim_set_hl(0, "@comment.todo.comment", { link = "VTodo" })
--
-- --lsp hover
-- vim.api.nvim_set_hl(0, "FloatBorder", { link = "CmpFloatBorder" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { link = "CmpNormal" })
--
-- -- left editor column in general
-- vim.api.nvim_set_hl(0, "GitSignsCurrentLineBlame", { link = "comment" })
-- vim.api.nvim_set_hl(0, "FoldColumn", { link = "Normal" })
--
-- -- cmp
-- vim.api.nvim_set_hl(0, "Title", { bg = COLORS.one_bg, fg = COLORS.title_fg })
-- vim.api.nvim_set_hl(0, "CmpNormal", { bg = COLORS.one_bg })
-- vim.api.nvim_set_hl(0, "CmpFloatBorder", { bg = COLORS.one_bg })
-- -- selection
-- -- CmpItemAbbrMatchFuzzy fg=#56b6c2
-- vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = COLORS.matching_bg, underline = false, bold = true })
-- vim.api.nvim_set_hl(0, "CmpVisual", { bg = COLORS.matching_bg, fg = COLORS.cmp_selected_text_fg, bold = false })
-- vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = COLORS.matching_bg, bold = true })
-- -- vim.api.nvim_set_hl(0, "CmpVisual", { bg = "#56b6c2", fg = COLORS.cmp_selected_text_fg, bold = false })
-- -- vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#56b6c2", bold = true })
-- -- --
-- -- vim.api.nvim_set_hl(0, "CmpItemMenu", { link = "CustomVType" })
--
-- -- item kinds for completions
-- -- Commented outs are using defaults
-- vim.api.nvim_set_hl(0, "CmpItemKindVariable", { link = "CustomVVariable" })
-- vim.api.nvim_set_hl(0, "CmpItemKindMethod", { link = "CustomVFunction" })
-- vim.api.nvim_set_hl(0, "CmpItemKindFunction", { link = "CustomVFunction" })
-- vim.api.nvim_set_hl(0, "CmpItemKindConstructor", { link = "CustomVFunction" })
-- vim.api.nvim_set_hl(0, "CmpItemKindField", { link = "CustomVProperty" })
-- vim.api.nvim_set_hl(0, "CmpItemKindClass", { link = "CustomVType" })
-- vim.api.nvim_set_hl(0, "CmpItemKindProperty", { link = "CustomVProperty" })
-- vim.api.nvim_set_hl(0, "CmpItemKindValue", { link = "Number" })
-- vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { link = "@keyword" })
-- vim.api.nvim_set_hl(0, "CmpItemKindConstant", { link = "CustomVBool" })
-- vim.api.nvim_set_hl(0, "CmpItemKindText", { link = "TelescopeMatching" })
-- -- try changing to CustomVType
-- vim.api.nvim_set_hl(0, "CmpItemKindTypeParameter", { link = "@variable.parameter" })
--
-- -- vim.api.nvim_set_hl(0, "CmpItemKindStruct", { link = "CustomVType" })
-- -- vim.api.nvim_set_hl(0, "CmpItemKindEnumMember", { link = "CustomVPurple" })
-- -- vim.api.nvim_set_hl(0, "CmpItemKindEnum", { link = "CustomVType" })
-- vim.api.nvim_set_hl(0, "CmpItemKindInterface", { link = "CustomVType" })
-- --
-- vim.api.nvim_set_hl(0, "CmpItemKindStruct", { link = "CustomVStruct" })
-- vim.api.nvim_set_hl(0, "CmpItemKindEnumMember", { link = "CustomVEnumMember" })
-- vim.api.nvim_set_hl(0, "CmpItemKindEnum", { link = "CustomVEnum" })
-- -- vim.api.nvim_set_hl(0, "CmpItemKindInterface", { link = "CustomVInterface" })
-- --
-- -- vim.api.nvim_set_hl(0, "CmpItemKindColor", { link = "" })
-- -- vim.api.nvim_set_hl(0, "CmpItemKindModule", { link = "" })
-- -- vim.api.nvim_set_hl(0, "CmpItemKindUnit", { link = "" })
-- -- vim.api.nvim_set_hl(0, "CmpItemKindSnippet", { link = "" })
-- -- vim.api.nvim_set_hl(0, "CmpItemKindFile", { link = "" })
-- -- vim.api.nvim_set_hl(0, "CmpItemKindReference", { link = "" })
-- -- vim.api.nvim_set_hl(0, "CmpItemKindFolder", { link = "" })
-- -- vim.api.nvim_set_hl(0, "CmpItemKindEvent", { link = "" })
-- -- vim.api.nvim_set_hl(0, "CmpItemKindOperator", { link = "" })
-- --
-- -- 'Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None'
-- --
-- vim.api.nvim_set_hl(0, "Include", { link = "@keyword.repeat" })
-- vim.api.nvim_set_hl(0, "@punctuation.delimiter", { fg = "#abb2bf" })
-- vim.api.nvim_set_hl(0, "@property", { link = "CustomVVariable" })
-- vim.api.nvim_set_hl(0, "Label", { link = "CustomVVariable" })
-- vim.api.nvim_set_hl(0, "@punctuation.bracket", { link = "CustomVPurple" })
-- vim.api.nvim_set_hl(0, "Delimiter", { link = "CustomVPurple" })
-- vim.api.nvim_set_hl(0, "Boolean", { link = "CustomVBool" })
-- vim.api.nvim_set_hl(0, "@constant.builtin", { link = "CustomVBool" })
-- vim.api.nvim_set_hl(0, "@constant", { link = "CustomVBool" })
-- vim.api.nvim_set_hl(0, "@keyword.storage", { link = "CustomVBool" })
-- vim.api.nvim_set_hl(0, "Type", { link = "CustomVType" })
-- vim.api.nvim_set_hl(0, "@type.builtin", { link = "CustomVType" })
-- vim.api.nvim_set_hl(0, "Function", { link = "CustomVFunction" })
-- vim.api.nvim_set_hl(0, "@function", { link = "CustomVFunction" })
-- vim.api.nvim_set_hl(0, "@function.builtin", { link = "CustomVFunction" })
-- vim.api.nvim_set_hl(0, "@variable", { link = "CustomVVariable" })
-- vim.api.nvim_set_hl(0, "@variable.member", { link = "CustomVProperty" })
-- vim.api.nvim_set_hl(0, "@function.call", { link = "CustomVFunction" })
--
-- vim.api.nvim_set_hl(0, "@punctuation.bracket.tsx", { link = "CustomVPurple" })
-- vim.api.nvim_set_hl(0, "@punctuation.bracket", { link = "CustomVPurple" })
-- vim.api.nvim_set_hl(0, "@punctuation.bracket.typescript", { link = "CustomVPurple" })
-- -- ; ,
-- vim.api.nvim_set_hl(0, "@punctuation.delimiter.tsx", { link = "@none" })
-- vim.api.nvim_set_hl(0, "@punctuation.delimiter.typescript", { link = "@none" })
-- -- <></>
-- vim.api.nvim_set_hl(0, "@tag.delimiter.tsx", { link = "CustomVHTML" })
-- -- <tagName></tagName>
-- vim.api.nvim_set_hl(0, "@tag.builtin.tsx", { link = "CustomVBool" })
-- vim.api.nvim_set_hl(0, "@constant.builtin", { link = "CustomVBool" })
-- -- let var: Type;
-- vim.api.nvim_set_hl(0, "@type.builtin.tsx", { link = "CustomVType" })
-- vim.api.nvim_set_hl(0, "@type.builtin.typescript", { link = "CustomVType" })
-- vim.api.nvim_set_hl(0, "@type.tsx", { link = "CustomVType" })
-- vim.api.nvim_set_hl(0, "@type.typescript", { link = "CustomVType" })
--
-- -- object property
-- vim.api.nvim_set_hl(0, "@variable.member.typescript", { link = "CustomVProperty" })
-- vim.api.nvim_set_hl(0, "@variable.member.tsx", { link = "CustomVProperty" })
-- vim.api.nvim_set_hl(0, "@variable.member", { link = "CustomVProperty" })
-- vim.api.nvim_set_hl(0, "@property", { link = "CustomVProperty" })
--
-- vim.api.nvim_set_hl(0, "@boolean.tsx", { link = "CustomVBool" })
-- vim.api.nvim_set_hl(0, "@boolean", { link = "CustomVBool" })
-- vim.api.nvim_set_hl(0, "@boolean.typescript", { link = "CustomVBool" })
--
-- -- vars
-- vim.api.nvim_set_hl(0, "@variable.tsx", { link = "CustomVVariable" })
-- vim.api.nvim_set_hl(0, "@variable.typescript", { link = "CustomVVariable" })
-- vim.api.nvim_set_hl(0, "@variable.typescript", { link = "CustomVVariable" })
-- vim.api.nvim_set_hl(0, "@variable.builtin.tsx", { link = "CustomVVariable" })
-- vim.api.nvim_set_hl(0, "@variable.builtin.typescript", { link = "CustomVVariable" })
--
-- -- imports
-- vim.api.nvim_set_hl(0, "@keyword.import.tsx", { link = "@keyword.coroutine.tsx" })
-- vim.api.nvim_set_hl(0, "@keyword.import.typescript", { link = "@keyword.coroutine.tsx" })
--
-- -- funcs
-- vim.api.nvim_set_hl(0, "@function.tsx", { link = "CustomVFunction" })
-- vim.api.nvim_set_hl(0, "@function.typescript", { link = "CustomVFunction" })
-- vim.api.nvim_set_hl(0, "@function", { link = "CustomVFunction" })
--
-- -- func calls
-- vim.api.nvim_set_hl(0, "@function.call", { link = "CustomVFunction" })
-- vim.api.nvim_set_hl(0, "@function.method.call", { link = "CustomVFunction" })
-- vim.api.nvim_set_hl(0, "@function.call.tsx", { link = "CustomVFunction" })
-- vim.api.nvim_set_hl(0, "@function.call.rust", { link = "CustomVFunction" })
-- vim.api.nvim_set_hl(0, "@function.call.typescript", { link = "CustomVFunction" })
-- vim.api.nvim_set_hl(0, "@function.method.call.typescript", { link = "CustomVFunction" })
-- vim.api.nvim_set_hl(0, "@function.method.call.tsx", { link = "CustomVFunction" })
-- vim.api.nvim_set_hl(0, "@constructor.cpp", { link = "CustomVFunction" })
--
-- -- tags attr className
-- vim.api.nvim_set_hl(0, "@tag.attribute.tsx", { link = "CustomVProperty" })
-- -- tsx tag
-- vim.api.nvim_set_hl(0, "@tag.tsx", { link = "CustomVType" })
--
-- --
-- --
-- -- Semantic tokens override
-- --
-- --
-- vim.api.nvim_set_hl(0, "@lsp.type.method.rust", { link = "CustomVFunction" })
-- vim.api.nvim_set_hl(0, "@lsp.type.method", { link = "CustomVFunction" })
-- vim.api.nvim_set_hl(0, "@lsp.typemod.method.defaultLibrary", { link = "CustomVFunction" })
-- vim.api.nvim_set_hl(0, "@lsp.typemod.function.defaultLibrary", { link = "CustomVFunction" })
-- vim.api.nvim_set_hl(0, "@function.macro.rust", { link = "@variable.parameter" })
-- vim.api.nvim_set_hl(0, "@lsp.type.macro", { link = "@variable.parameter" })
-- vim.api.nvim_set_hl(0, "@type", { link = "CustomVType" })
--
-- -- vim.api.nvim_set_hl(0, "@lsp.type.attributeBracket", { link = "" })
-- -- vim.api.nvim_set_hl(0, "@lsp.type.builtinAttribute", { link = "" })
-- vim.api.nvim_set_hl(0, "@lsp.type.builtinType", { link = "CustomVType" })
-- vim.api.nvim_set_hl(0, "@lsp.type.class", { link = "CustomVType" })
-- -- vim.api.nvim_set_hl(0, "@lsp.type.comment", { link = "" })
-- -- vim.api.nvim_set_hl(0, "@lsp.type.decorator", { link = "" })
-- -- vim.api.nvim_set_hl(0, "@lsp.type.derive", { link = "" })
-- vim.api.nvim_set_hl(0, "@lsp.type.enum", { link = "CustomVEnum" })
-- vim.api.nvim_set_hl(0, "@lsp.type.enumMember", { link = "CustomVEnumMember" })
-- -- vim.api.nvim_set_hl(0, "@lsp.type.formatSpecifier", { link = "" })
-- vim.api.nvim_set_hl(0, "@lsp.type.function", { link = "CustomVFunction" })
-- -- vim.api.nvim_set_hl(0, "@lsp.type.generic", { link = "" })
-- vim.api.nvim_set_hl(0, "@lsp.type.interface", { link = "CustomVType" })
-- vim.api.nvim_set_hl(0, "@lsp.type.keyword", { link = "@keyword" })
-- vim.api.nvim_set_hl(0, "@lsp.type.macro", { link = "@function.macro.rust" })
-- vim.api.nvim_set_hl(0, "@lsp.type.method", { link = "CustomVFunction" })
-- -- vim.api.nvim_set_hl(0, "@lsp.type.namespace", { link = "" })
-- vim.api.nvim_set_hl(0, "@lsp.type.parameter", { link = "@function.macro.rust" })
-- vim.api.nvim_set_hl(0, "@lsp.type.property", { link = "CustomVProperty" })
-- vim.api.nvim_set_hl(0, "@lsp.type.selfKeyword", { fg = "#f72058" })
-- vim.api.nvim_set_hl(0, "@lsp.type.selfTypeKeyword", { fg = "#e03d68" })
-- vim.api.nvim_set_hl(0, "@lsp.type.string", { link = "@string" })
-- vim.api.nvim_set_hl(0, "@lsp.type.struct", { link = "CustomVStruct" })
-- vim.api.nvim_set_hl(0, "@lsp.type.type", { link = "CustomVType" })
-- vim.api.nvim_set_hl(0, "@lsp.type.typeAlias", { link = "CustomVType" }) -- change ?
-- vim.api.nvim_set_hl(0, "@lsp.type.typeParameter", { link = "CustomVType" })
-- vim.api.nvim_set_hl(0, "@lsp.type.variable", { link = "CustomVVariable" })
-- -- used for color difference between function paramenters that have been shadowed and regular variables
-- -- vim.api.nvim_set_hl(0, "@lsp.typemod.variable.reference.rust", { link = "@lsp.type.parameter" })
-- vim.api.nvim_set_hl(0, "@lsp.typemod.variable.declaration.rust", { link = "CustomVVariable" })
-- vim.api.nvim_set_hl(0, "@lsp.typemod.variable.mutable.rust", { link = "CustomVVariable" })
--
-- vim.api.nvim_set_hl(0, "@module", { link = "CmpItemKindModule" })
--
-- -- Char
-- -- vim.api.nvim_set_hl(0, "@character", { link = "CustomVChar" })
--
-- vim.api.nvim_set_hl(0, "@lsp.type.generic.rust", {})
-- vim.api.nvim_set_hl(0, "@lsp.mod.macro.rust", {})
-- vim.api.nvim_set_hl(0, "@lsp.typemod.generic.macro.rust", {})
-- vim.api.nvim_set_hl(0, "@lsp.type.decorator.rust", {})
-- vim.api.nvim_set_hl(0, "@lsp.type.lifetime", { link = "Special" })
-- vim.api.nvim_set_hl(0, "@lsp.type.lifetime.rust", { link = "@lsp.type.lifetime" })
