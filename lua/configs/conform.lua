local map = vim.keymap.set

require("conform").setup({
	lsp_fallback = true,
	formatters_by_ft = {
		lua = {
			"stylua",
		},
		javascript = {
			"prettierd",
		},
		typescript = {
			"prettierd",
		},
		javascriptreact = {
			"prettierd",
		},
		typescriptreact = {
			"prettierd",
		},
		json = {
			"prettierd",
		},
		cpp = {
			"clang_format",
		},
		c = {
			"clang_format",
		},
		jsonc = {
			"prettierd",
		},
		css = {
			"prettierd",
		},
		scss = {
			"prettierd",
		},
		sass = {
			"prettierd",
		},
		-- rust is handled by rust.vim and rustaceanvim
	},

	ft_parsers = {
		javascript = "babel",
		javascriptreact = "babel",
		typescript = "typescript",
		typescriptreact = "typescript",
		c = "clang_format",
		cpp = "clang_format",
		vue = "vue",
		css = "css",
		scss = "scss",
		html = "html",
		json = "json",
		jsonc = "json",
		yaml = "yaml",
		markdown = "markdown",
	},
})

map("n", "<leader>fm", function()
	print("Conform formatting...")
	require("conform").format({ lsp_fallback = true })
end, { desc = "General Format file" })
