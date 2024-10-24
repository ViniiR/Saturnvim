-- Ensure lazy is first
require("configs.lazy")
--

-- Must be loaded immediately
require("configs.theme")
require("configs.dashboard")
require("configs.web-dev-icons")
require("configs.highlight-colors")
require("configs.which-key")
-- Must be loaded before first input
require("configs.telescope")
require("configs.lualine")
require("configs.treesitter")
-- Must be loaded between Loading initials and Opening file
require("configs.oil")
require("configs.harpoon")
-- Must be loaded while Opening file
require("configs.gitsigns")
require("configs.cmp")
require("configs.conform")
require("configs.lspconfig")
require("configs.luasnip")
require("configs.undotree")
require("configs.dap")
require("configs.indent-blankline")
require("configs.rust_plugins")
