return {
    {
        -- Must be the first plugin loaded
        "navarasu/onedark.nvim",
        lazy = false,
        config = function() require("configs._onedark-nvim") end,
    },
    {
        "nvim-tree/nvim-web-devicons",
        lazy = false,
        config = function() require("configs._nvim-web-dev-icons") end,
    },
    {
        "neovim/nvim-lspconfig",
        event = "VeryLazy",
        lazy = true,
        config = function() require("configs._nvim-lspconfig") end,
    },
    {
        "nvim-telescope/telescope.nvim",
        -- old
        -- tag = "0.1.8",
        branch = "0.1.x",
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
        "brenoprata10/nvim-highlight-colors",
        event = "VeryLazy",
        lazy = true,
        config = function() require("configs._nvim-highlight-colors") end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = "VeryLazy",
        lazy = true,
        config = function() require("configs._nvim-treesitter") end,
    },
    {
        "stevearc/conform.nvim",
        event = "VeryLazy",
        lazy = true,
        config = function() require("configs._conform-nvim") end,
    },
    {
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
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        lazy = true,
        config = function() require("configs._nvim-surround") end,
    },
    {
        "stevearc/oil.nvim",
        event = "VeryLazy",
        lazy = true,
        config = function() require("configs._oil-nvim") end,
        dependencies = {
            { "nvim-tree/nvim-web-devicons" },
        },
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        event = "VeryLazy",
        lazy = true,
        config = function() require("configs._indent-blankline-nvim") end,
    },
    {
        "folke/which-key.nvim",
        -- TODO: move to config if possible
        keys = { "<leader>", "<c-r>", "<c-w>", '"', "'", "`", "c", "v", "g", "[", "]" },
        cmd = "WhichKey",
        event = "VeryLazy",
        lazy = true,
        config = function() require("configs._which-key-nvim") end,
    },
    {
        "mbbill/undotree",
        event = "VeryLazy",
        lazy = true,
        config = function() require("configs._undotree") end,
    },
    {
        "nvimdev/dashboard-nvim",
        event = "VimEnter",
        lazy = true,
        config = function() require("configs._dashboard-nvim") end,
        dependencies = {
            { "nvim-tree/nvim-web-devicons" },
        },
    },
    {
        "lewis6991/gitsigns.nvim",
        event = "VeryLazy",
        lazy = true,
        config = function() require("configs._gitsigns-nvim") end,
    },
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        lazy = true,
        config = function() require("configs._lualine-nvim") end,
        dependencies = {
            { "nvim-tree/nvim-web-devicons" },
        },
    },
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        lazy = true,
        config = function() require("configs._nvim-cmp") end,
        dependencies = {
            {
                "L3MON4D3/LuaSnip",
                -- TODO: move to setup
                opts = {
                    history = true,
                    updateevents = "TextChanged,TextChangedI",
                },
                lazy = true,
                config = function() require("configs._luasnip") end,
                dependencies = {
                    "rafamadriz/friendly-snippets",
                },
            },
            {
                "windwp/nvim-autopairs",
                config = function() require("configs._nvim-autopairs") end,
            },
            { "neovim/nvim-lspconfig" },
            { "brenoprata10/nvim-highlight-colors" },
            { "saadparwaiz1/cmp_luasnip" },
            { "hrsh7th/cmp-nvim-lua" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            -- { "hrsh7th/cmp-cmdline" },
        },
    },
    {
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
        "rust-lang/rust.vim",
        ft = "rust",
        lazy = true,
        init = function() vim.g.rustfmt_autosave = 1 end,
    },
    {
        "saecki/crates.nvim",
        tag = "stable",
        ft = { "toml" },
        event = { "BufRead Cargo.toml" },
        lazy = true,
        config = function() require("configs._crates-nvim") end,
    },
    {
        "lukas-reineke/virt-column.nvim",
        event = "VeryLazy",
        lazy = true,
        config = function() require("configs._virt-column-nvim") end,
    },
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        event = "VeryLazy",
        lazy = true,
        config = function() require("configs._toggleterm-nvim") end,
    },
    {
        "RRethy/vim-illuminate",
        event = "VeryLazy",
        lazy = true,
        config = function() require("configs._vim-illuminate") end,
    },
    -- {
    --     "mfussenegger/nvim-dap",
    --     event = "VeryLazy",
    --     lazy = true,
    --     config = function() require("configs._nvim-dap") end,
    -- },
    -- {
    --     "rcarriga/nvim-dap-ui",
    --     event = "VeryLazy",
    --     lazy = true,
    --     dependencies = {
    --         { "mfussenegger/nvim-dap" },
    --         { "nvim-neotest/nvim-nio" },
    --     },
    -- },
    -- {
    --     "mxsdev/nvim-dap-vscode-js",
    --     event = "VeryLazy",
    --     lazy = true,
    --     config = function()
    --         require("dap-vscode-js").setup({
    --             -- WARNING: ensure manually compiled vscode-js-debug github project
    --             debugger_path = "/home/vinii/Downloads/vscode-js-debug",
    --             adapters = {
    --                 "pwa-node",
    --                 "pwa-chrome",
    --                 "pwa-msedge",
    --                 "pwa-extensionHost",
    --             },
    --         })
    --     end,
    -- },
}
