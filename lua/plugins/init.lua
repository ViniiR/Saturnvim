local map = vim.keymap.set;

return {
	{
		'nvim-telescope/telescope.nvim', 
		tag = '0.1.8',
		dependencies = { 'nvim-lua/plenary.nvim' },
		cmd = "Telescope",
		module = "telescope",
		config = function(_)
			local telescope = require("telescope");
			local builtin = require("telescope.builtin");

			map('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' });
			map('n', '<leader>fw', builtin.live_grep, { desc = 'Telescope live grep' });
			map('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' });
			map('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' });

			telescope.setup{
				defaults = {
					layout_strategy = "horizontal",
					layout_config = {
						horizontal = {
							prompt_position = "top",
						},
					},
					prompt_prefix = "> ",
					sorting_strategy = "ascending",
					mappings = {
						i = {
							["<C-H>"] = function()
								vim.api.nvim_input("<C-W>")
							end,
							["<C-Del>"] = function()
								vim.api.nvim_input("<C-o>dw")
							end,
							["<Tab>"] = function()
								vim.api.nvim_input("<C-n>")
							end,
							["<S-Tab>"] = function()
								vim.api.nvim_input("<C-p>")
							end,
						},
					},
					pickers = {},
					extensions = {},
					file_ignore_patterns = { "node_modules", ".git/", "target", ".png", ".webp", ".jpeg", ".jpg", ".svg" },
				},
			};
		end;
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	}
};
