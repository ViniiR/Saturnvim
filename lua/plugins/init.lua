return {
    {
        -- TEST WORKS
        -- Must be the first plugin loaded
        "navarasu/onedark.nvim",
        lazy = false,
        config = function() require("configs._onedark-nvim") end,
    },
    {
        -- TEST WORKS
        "nvim-tree/nvim-web-devicons",
        lazy = false,
        config = function() require("configs._nvim-web-dev-icons") end,
    },
    {
        -- TEST WORKS
        "neovim/nvim-lspconfig",
        event = "VeryLazy",
        lazy = true,
        config = function() require("configs._nvim-lspconfig") end,
    },
    {
        -- TEST WORKS
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        cmd = "Telescope",
        module = "telescope",
        event = "VimEnter",
        lazy = true,
        config = function() require("configs._telescope-nvim") end,
        dependencies = {
            { "nvim-lua/plenary.nvim" },
        },
    },
    {
        -- TEST WORKS
        "brenoprata10/nvim-highlight-colors",
        event = "VeryLazy",
        lazy = true,
        config = function() require("configs._nvim-highlight-colors") end,
    },
    {
        -- TEST WORKS
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = "VeryLazy",
        lazy = true,
        config = function() require("configs._nvim-treesitter") end,
    },
    {
        -- TEST WORKS
        "stevearc/conform.nvim",
        event = "VeryLazy",
        lazy = true,
        config = function() require("configs._conform-nvim") end,
    },
    {
        -- TEST WORKS
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        event = "VimEnter",
        lazy = true,
        config = function() require("configs._harpoon") end,
        dependencies = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-telescope/telescope.nvim" },
        },
    },
    {
        -- TEST WORKS
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        lazy = true,
        config = function() require("configs._nvim-surround") end,
    },
    {
        -- TEST WORKS
        "stevearc/oil.nvim",
        event = "VeryLazy",
        lazy = true,
        config = function() require("configs._oil-nvim") end,
        dependencies = {
            { "nvim-tree/nvim-web-devicons" },
        },
    },
    {
        -- TEST WORKS
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        event = "VeryLazy",
        lazy = true,
        config = function() require("configs._indent-blankline-nvim") end,
    },
    {
        -- TEST WORKS
        "folke/which-key.nvim",
        keys = { "<leader>", "<c-r>", "<c-w>", '"', "'", "`", "c", "v", "g", "[", "]" },
        cmd = "WhichKey",
        event = "VeryLazy",
        lazy = true,
        config = function() require("configs._which-key-nvim") end,
    },
    {
        -- TEST WORKS
        "mbbill/undotree",
        event = "VeryLazy",
        lazy = true,
        config = function() require("configs._undotree") end,
    },
    {
        -- TEST WORKS
        "nvimdev/dashboard-nvim",
        event = "VimEnter",
        lazy = true,
        config = function() require("configs._dashboard-nvim") end,
        dependencies = {
            { "nvim-tree/nvim-web-devicons" },
        },
    },
    {
        -- TEST WORKS
        "lewis6991/gitsigns.nvim",
        event = "VeryLazy",
        lazy = true,
        config = function() require("configs._gitsigns-nvim") end,
    },
    {
        -- TEST WORKS
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        lazy = true,
        config = function() require("configs._lualine-nvim") end,
        dependencies = {
            { "nvim-tree/nvim-web-devicons" },
        },
    },
    {
        -- TEST WORKS
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        lazy = true,
        config = function() require("configs._nvim-cmp") end,
        dependencies = {
            { "neovim/nvim-lspconfig" },
            { "brenoprata10/nvim-highlight-colors" },
            {
                "L3MON4D3/LuaSnip",
                dependencies = {
                    "rafamadriz/friendly-snippets",
                },
                opts = {
                    history = true,
                    updateevents = "TextChanged,TextChangedI",
                },
                lazy = true,
            },
            {
                "windwp/nvim-autopairs",
                opts = {
                    fast_wrap = {},
                    disable_filetype = { "TelescopePrompt", "vim" },
                },
                -- TODO: move to separate file
                config = function(_, opts)
                    require("nvim-autopairs").setup(opts)
                    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
                    require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
                end,
            },
            { "saadparwaiz1/cmp_luasnip" },
            { "hrsh7th/cmp-nvim-lua" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            -- { "hrsh7th/cmp-cmdline" },
        },
    },
    {
        -- TEST UNTESTED
        "mrcjkb/rustaceanvim",
        version = "^5", -- Recommended
        ft = { "rust" },
        lazy = false, -- This plugin is already lazy
        config = function() require("configs._rustaceanvim") end,
        dependencies = {
            { "neovim/nvim-lspconfig" },
        },
        -- TODO: delete if it works
        -- 11/03/2025 20:39 Confirmed to be working on xv-chat repo (apparently perfectly)
        -- 11/03/2025 21:28 Does not work on overly large projects (hopefully a hardware issue since it works on different pc (same setup))
        -- config = function()
        --     local lspconfig = require("configs.lspconfig")
        --     vim.g.rustaceanvim = {
        --         server = {
        --             on_attach = lspconfig.on_attach,
        --             -- capabilities = lspconfig.capabilities,
        --             -- on_init = lspconfig.on_init,
        --             default_settings = {
        --                 ["rust-analyzer"] = {
        --                     capabilities = lspconfig.capabilities,
        --                     cargo = {
        --                         allFeatures = true,
        --                     },
        --                     -- checkOnSave = true,
        --                     -- check = {
        --                     -- 	enable = true,
        --                     -- 	command = "check",
        --                     -- },
        --                 },
        --             },
        --         },
        --     }
        -- end,
    },
    {
        -- TEST WORKS
        "rust-lang/rust.vim",
        ft = "rust",
        lazy = true,
        init = function() vim.g.rustfmt_autosave = 1 end,
    },
    {
        -- TEST WORKS
        "saecki/crates.nvim",
        tag = "stable",
        ft = { "toml" },
        event = { "BufRead Cargo.toml" },
        lazy = true,
        config = function() require("configs._crates-nvim") end,
    },
    {
        -- TEST WORKS
        "lukas-reineke/virt-column.nvim",
        event = "VeryLazy",
        lazy = true,
        config = function() require("configs._virt-column-nvim") end,
    },
    {
        -- TEST WORKS
        "akinsho/toggleterm.nvim",
        version = "*",
        event = "VeryLazy",
        lazy = true,
        config = function() require("configs._toggleterm-nvim") end,
    },
    {
        -- TEST WORKS
        "RRethy/vim-illuminate",
        event = "VeryLazy",
        lazy = true,
        config = function() require("configs._vim-illuminate") end,
    },
    {
        -- TEST WORKS
        "mfussenegger/nvim-dap",
        event = "VeryLazy",
        lazy = true,
        config = function() require("configs._nvim-dap") end,
    },
    {
        -- TEST UNTESTED
        "rcarriga/nvim-dap-ui",
        event = "VeryLazy",
        lazy = true,
        dependencies = {
            { "mfussenegger/nvim-dap" },
            { "nvim-neotest/nvim-nio" },
        },
    },
}
