require("configs")
require("mappings")

vim.cmd("highlight CustomVBool guifg=#4d98d6")
vim.cmd("highlight CustomVHTML guifg=#808080")
vim.cmd("highlight CustomVVariable guifg=#4fc1ff")
vim.cmd("highlight CustomVFunction guifg=#d4814e")
vim.cmd("highlight CustomVType guifg=#4ebd90")
vim.cmd("highlight CustomVProperty guifg=#8dc5e3")
vim.cmd("highlight CustomVPurple guifg=#bfa7f2")
vim.cmd("highlight Constant guifg=#4d98d6")

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
vim.api.nvim_set_hl(0, "@lsp.type.method.rust", { link = "CustomVFunction" })

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

--rust
vim.api.nvim_set_hl(0, "@lsp.type.method.rust", { link = "CustomVFunction" })
vim.api.nvim_set_hl(0, "@lsp.type.method", { link = "CustomVFunction" })
