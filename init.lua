require("globals")
require("configs")
require("options")
require("mappings.setup._editor")()
require("commands")
require("autocmds")
require("highlights")
require("macros")

-- disables? semantic tokens
for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
    vim.api.nvim_set_hl(0, group, {})
end
