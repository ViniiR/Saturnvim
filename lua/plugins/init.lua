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
			map( "n", "<leader>fa", "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
				{ desc = "telescope find all files" }
			);

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
	},
	{
		"navarasu/onedark.nvim",
	},
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		opts = {
			fast_wrap = {},
			disable_filetype = { "TelescopePrompt", "vim" },
		},
		config = function(_, opts)
			require("nvim-autopairs").setup(opts)

			-- local cmp_autopairs = require "nvim-autopairs.completion.cmp"
			-- require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	},
	-- {
	-- 	"stevearc/conform.nvim",
	-- 	config = function()
	-- 		require("configs.conform")
	-- 	end,
	-- },
	{
		"nvim-tree/nvim-tree.lua",
		opts = {
			git = { enable = true },
		},
	},
	-- {
	-- 	"neovim/nvim-lspconfig",
	-- 	config = function()
	-- 		require("configs.lspconfig")
	-- 	end,
	-- },
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},
	-- {
	-- 	"mrcjkb/rustaceanvim",
	-- 	version = "^5", -- Recommended
	-- 	lazy = false, -- This plugin is already lazy
	-- 	dependencies = "neovim/nvim-lspconfig",
	-- 	config = function()
	-- 		local lspconfig = require("nvchad.configs.lspconfig")
	-- 		vim.g.rustaceanvim = {
	-- 			--TODO: fix this shit, fsr autoformat broke
	-- 			server = {
	-- 				on_attach = lspconfig.on_attach,
	-- 				default_settings = {
	-- 					["rust-analyzer"] = {
	-- 						capabilities = lspconfig.capabilities,
	-- 						cargo = {
	-- 							allFeatures = true,
	-- 						},
	-- 						-- checkOnSave = true,
	-- 						-- check = {
	-- 							-- 	enable = true,
	-- 							-- 	command = "check",
	-- 							-- },
	-- 						},
	-- 					},
	-- 				},
	-- 			}
	-- 		end,
	-- 		ft = { "rust" },
	-- 	},
	-- 	{
	-- 		"rust-lang/rust.vim",
	-- 		ft = "rust",
	-- 		init = function()
	-- 			vim.g.rustfmt_autosave = 1
	-- 		end,
	-- 	},
};
