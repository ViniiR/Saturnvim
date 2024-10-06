local map = vim.keymap.set

return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = { "nvim-lua/plenary.nvim" },
        cmd = "Telescope",
        module = "telescope",
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
    },
    {
        "navarasu/onedark.nvim",
    },
    {
        "stevearc/conform.nvim",
    },
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
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
        "nvim-tree/nvim-web-devicons",
        opts = function() end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function() require("configs.lspconfig") end,
    },
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
    {
        "stevearc/oil.nvim",
        opts = {},
        dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        event = "User FilePost",
        opts = {
            indent = { char = "│", highlight = "IblChar" },
            scope = { char = "│", highlight = "IblScopeChar" },
        },
        config = function(_, opts)
            dofile(vim.g.base46_cache .. "blankline")
            local hooks = require("ibl.hooks")
            hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
            require("ibl").setup(opts)
        end,
    },
    {
        "folke/which-key.nvim",
        keys = { "<leader>", "<c-r>", "<c-w>", '"', "'", "`", "c", "v", "g", "[", "]" },
        cmd = "WhichKey",
        opts = function() return {} end,
    },
    {
        "mbbill/undotree",
    },
    {
        "lewis6991/gitsigns.nvim",
        event = "User FilePost",
    },
    -- { "rafamadriz/friendly-snippets" },
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            {
                "L3MON4D3/LuaSnip",
                dependencies = "rafamadriz/friendly-snippets",
                opts = { history = true, updateevents = "TextChanged,TextChangedI" },
                --            config = function(_, opts)
                -- require("configs.luasnip")
                --            end,
            },
            {
                "windwp/nvim-autopairs",
                opts = {
                    fast_wrap = {},
                    disable_filetype = { "TelescopePrompt", "vim" },
                },
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
        init = function() vim.g.rustfmt_autosave = 1 end,
    },
}
