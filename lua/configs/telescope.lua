local telescope = require("telescope")
local actions = require("telescope.actions")

local builtin = require("telescope.builtin")

local map = vim.keymap.set

map("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
map("n", "<leader>fw", builtin.live_grep, { desc = "Telescope live grep" })
map("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
-- map("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
map("n", "<leader>fh", function() vim.cmd("Telescope highlights") end, { desc = "Telescope highlights" })
map(
    "n",
    "<leader>fa",
    "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
    { desc = "telescope find all files" }
)

telescope.setup({
    defaults = {
        layout_strategy = "horizontal",
        prompt_prefix = "   ",
        selection_caret = " ",
        entry_prefix = " ",
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        layout_config = {
            horizontal = {
                prompt_position = "top",
                preview_width = 0.55,
            },
            width = 0.87,
            height = 0.80,
        },
        sorting_strategy = "ascending",
        mappings = {
            n = {
                ["q"] = actions.close,
            },
            i = {
                ["<C-H>"] = function() vim.api.nvim_input("<C-W>") end,
                ["<C-Del>"] = function() vim.api.nvim_input("<C-o>dw") end,
                ["<Tab>"] = function() vim.api.nvim_input("<C-n>") end,
                ["<S-Tab>"] = function() vim.api.nvim_input("<C-p>") end,
                ["<Esc>"] = actions.close,
            },
        },
        pickers = {},
        extensions = {},
        file_ignore_patterns = { "node_modules", ".git/", "target", ".png", ".webp", ".jpeg", ".jpg", ".svg" },
    },
})
