require("globals")
require("configs")
require("options")
require("mappings")
require("commands")
require("terminal")
require("autocmds")
require("highlights")
-- disables? semantic tokens
for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
    vim.api.nvim_set_hl(0, group, {})
end
