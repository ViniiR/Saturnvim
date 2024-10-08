return {
    {

        "nvim-lua/plenary.nvim",
    },
    {
        "neovim/nvim-lspconfig",
		lazy = true,
        config = function() require("configs.lspconfig") end,
    },
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        lazy = true,
        dependencies = {
            {
                "neovim/nvim-lspconfig",
            },
            {
                "hrsh7th/cmp-nvim-lsp",
            },
            {
                "hrsh7th/cmp-buffer",
            },
            {
                "hrsh7th/cmp-path",
            },
            {
                "hrsh7th/cmp-cmdline",
            },
            {
                "hrsh7th/nvim-cmp",
            },
            {
                "L3MON4D3/LuaSnip",
            },
            {
                "saadparwaiz1/cmp_luasnip",
            },
        },
    },
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = { "nvim-lua/plenary.nvim" },
        cmd = "Telescope",
        module = "telescope",
    },
    { "brenoprata10/nvim-highlight-colors" },
    {
        "nvim-tree/nvim-web-devicons",
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        lazy = true,
    },
    {
        "navarasu/onedark.nvim",
    },
    {
        "stevearc/conform.nvim",
        lazy = true,
    },
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        lazy = true,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
        },
    },
    {
        "nvim-tree/nvim-tree.lua",
        opts = {
            git = { enable = true },
        },
    },
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        lazy = true,
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end,
    },
    {
        "stevearc/oil.nvim",
        opts = {},
        lazy = true,
        dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        event = "User FilePost",
        lazy = true,
        opts = {
            indent = { char = "│", highlight = "IblChar" },
            scope = { char = "│", highlight = "IblScopeChar" },
        },
        config = function(_, opts)
            local hooks = require("ibl.hooks")
            hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
            require("ibl").setup(opts)
        end,
    },
    {
        "folke/which-key.nvim",
        keys = { "<leader>", "<c-r>", "<c-w>", '"', "'", "`", "c", "v", "g", "[", "]" },
        cmd = "WhichKey",
        event = "VeryLazy",
    },
    {
        "mbbill/undotree",
    },
    {
        "nvimdev/dashboard-nvim",
        event = "VimEnter",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    {
        "lewis6991/gitsigns.nvim",
        lazy = true,
        event = "User FilePost",
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        lazy = true,
        dependencies = {
            { "brenoprata10/nvim-highlight-colors" },
            {
                "L3MON4D3/LuaSnip",
                dependencies = "rafamadriz/friendly-snippets",
                opts = { history = true, updateevents = "TextChanged,TextChangedI" },
                lazy = true,
            },
            {
                "windwp/nvim-autopairs",
                opts = {
                    fast_wrap = {},
                    disable_filetype = { "TelescopePrompt", "vim" },
                },
                lazy = true,
                config = function(_, opts)
                    require("nvim-autopairs").setup(opts)
                    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
                    require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
                end,
            },
            {
                "saadparwaiz1/cmp_luasnip",
                "hrsh7th/cmp-nvim-lua",
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-path",
            },
        },
    },
    {
        "mrcjkb/rustaceanvim",
        version = "^5", -- Recommended
        lazy = false, -- This plugin is already lazy
        dependencies = "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("configs.lspconfig")
            vim.g.rustaceanvim = {
                server = {
                    on_attach = lspconfig.on_attach,
                    default_settings = {
                        ["rust-analyzer"] = {
                            capabilities = lspconfig.capabilities,
                            cargo = {
                                allFeatures = true,
                            },
                            -- checkOnSave = true,
                            -- check = {
                            -- 	enable = true,
                            -- 	command = "check",
                            -- },
                        },
                    },
                },
            }
        end,
        ft = { "rust" },
    },
    {
        "rust-lang/rust.vim",
        ft = "rust",
        lazy = true,
        init = function() vim.g.rustfmt_autosave = 1 end,
    },
}
