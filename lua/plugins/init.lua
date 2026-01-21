--- @class LazyCustom
--- @field branch? string | "master" | "main"
--- @field version? string | boolean | "*"

-- INFO: consult https://lazy.folke.io/spec

--- @type LazySpec | LazyCustom[]
return {
    {
        -- INFO: Must be the first plugin loaded
        "navarasu/onedark.nvim",
        branch = "master",
        version = "*",

        -- Loading
        lazy = false,
        priority = 100, -- Lazy.nvim recommends colorschemes to be higher than 50 (default)

        config = function()
            require("configs._onedark-nvim")
        end,
    },
    {
        -- INFO: Must be loaded right after theme
        "nvim-tree/nvim-web-devicons",
        branch = "master",
        version = false, -- tags are years behind updates

        -- Loading
        lazy = false,

        config = function()
            require("configs._nvim-web-dev-icons")
        end,
    },
    {
        -- INFO: Now only used by vim.lsp api to define default configs
        "neovim/nvim-lspconfig",
        branch = "master",
        version = "*",

        -- Lazy
        event = "VeryLazy",
        lazy = true,

        -- Config
        config = function()
            require("lsp")
        end,
    },
    {
        "nvim-telescope/telescope.nvim",
        branch = "master",
        version = "*",

        -- Loading
        event = "VimEnter",
        cmd = "Telescope",
        lazy = true,

        config = function()
            require("configs._telescope-nvim")
        end,
        module = false,
        dependencies = {
            { "nvim-lua/plenary.nvim" },
        },
    },
    {
        "brenoprata10/nvim-highlight-colors",
        branch = "main",
        version = false, -- does not offer tags

        -- Loading
        event = "VeryLazy",
        lazy = true,

        config = function()
            require("configs._nvim-highlight-colors")
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "master", -- TODO: main branch update (requires new config)
        -- version = "*",

        -- Loading
        event = "VeryLazy",
        lazy = true,

        build = ":TSUpdate",
        config = function()
            require("configs._nvim-treesitter")
        end,
    },
    {
        "stevearc/conform.nvim",
        branch = "master",
        version = "*",

        -- Loading
        event = "VeryLazy",
        lazy = true,

        config = function()
            require("configs._conform-nvim")
        end,
    },
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        version = false, -- does not offer tags

        -- Loading
        event = "VimEnter",
        lazy = true,

        config = function()
            require("configs._harpoon")
        end,
        dependencies = {
            { "nvim-lua/plenary.nvim" },
        },
    },
    {
        "kylechui/nvim-surround",
        branch = "main",
        version = "*",

        -- Loading
        event = "VeryLazy",
        lazy = true,

        config = function()
            require("configs._nvim-surround")
        end,
    },
    {
        "stevearc/oil.nvim",
        branch = "master",
        version = false, -- tags are years behind updates

        -- Loading
        event = "VeryLazy",
        lazy = true,

        config = function()
            require("configs._oil-nvim")
        end,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        branch = "master",
        version = "*",

        -- Loading
        event = "VeryLazy",
        lazy = true,

        main = "ibl",
        config = function()
            require("configs._indent-blankline-nvim")
        end,
    },
    {
        "folke/which-key.nvim",
        branch = "main",
        version = false, -- tags are years behind updates

        -- Loading
        event = "VeryLazy",
        keys = require("mappings.plugins._which-key"),
        cmd = "WhichKey",
        lazy = true,

        config = function()
            require("configs._which-key-nvim")
        end,
    },
    {
        "mbbill/undotree",
        branch = "master",
        version = false, -- tags are years behind updates

        -- Loading
        event = "VeryLazy",
        lazy = true,

        config = function()
            require("configs._undotree")
        end,
    },
    {
        "nvimdev/dashboard-nvim",
        branch = "master",
        version = false, -- does not offer tags

        -- Loading
        event = "VimEnter",
        lazy = true,

        config = function()
            require("configs._dashboard-nvim")
        end,
    },
    {
        "lewis6991/gitsigns.nvim",
        branch = "main",
        version = "*",

        -- Loading
        event = "VeryLazy",
        lazy = true,

        config = function()
            require("configs._gitsigns-nvim")
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        branch = "master",
        version = false, -- does not offer tags

        -- Loading
        event = "VeryLazy",
        lazy = true,

        config = function()
            require("configs._lualine-nvim")
        end,
    },
    {
        "windwp/nvim-autopairs",
        branch = "master",
        version = false, -- tags are years behind updates

        -- Loading
        event = "InsertEnter",
        lazy = true,

        config = function()
            require("configs._nvim-autopairs")
        end,
    },
    {
        "L3MON4D3/LuaSnip",
        branch = "master",
        version = "*",

        -- Loading
        event = "InsertEnter",
        lazy = true,

        config = function()
            require("configs._luasnip")
        end,

        dependencies = {
            "rafamadriz/friendly-snippets",
        },
    },
    {
        "hrsh7th/nvim-cmp",
        branch = "main",
        version = false, -- tags are years behind updates

        -- Loading
        event = "InsertEnter",
        lazy = true,

        config = function()
            require("configs._nvim-cmp")
        end,

        dependencies = {
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
        branch = "master",
        version = "^6", -- NOTE: TODO: must manually update

        -- Loading
        lazy = false, -- This plugin is already lazy

        config = function()
            require("configs._rustaceanvim")
        end,
    },
    {
        "rust-lang/rust.vim",
        branch = "master",
        version = "*",

        -- Loading
        ft = "rust",
        lazy = true,

        init = function()
            vim.g.rustfmt_autosave = 1
        end,
    },
    {
        "saecki/crates.nvim",
        branch = "main",
        version = "*",

        -- Loading
        event = { "BufRead Cargo.toml" },
        lazy = true,

        config = function()
            require("configs._crates-nvim")
        end,
    },
    {
        "lukas-reineke/virt-column.nvim",
        branch = "master",
        version = "*",

        -- Loading
        event = "VeryLazy",
        lazy = true,

        config = function()
            require("configs._virt-column-nvim")
        end,
    },
    {
        "akinsho/toggleterm.nvim",
        branch = "main",
        version = false, -- tags are years behind updates

        -- Loading
        event = "VeryLazy",
        lazy = true,

        config = function()
            require("configs._toggleterm-nvim")
        end,
    },
    {
        "RRethy/vim-illuminate",
        branch = "master",
        version = false, -- does not offer tags

        -- Loading
        event = "VeryLazy",
        lazy = true,

        config = function()
            require("configs._vim-illuminate")
        end,
    },
    {
        "mfussenegger/nvim-dap",
        branch = "master",
        version = "*",

        enabled = false,

        -- Loading
        event = "VeryLazy",
        lazy = true,

        config = function()
            require("configs._nvim-dap")
        end,
    },
    {
        "rcarriga/nvim-dap-ui",
        branch = "master",
        version = "*",

        enabled = false,

        -- Loading
        event = "VeryLazy",
        lazy = true,

        config = function()
            --
        end,

        dependencies = {
            { "nvim-neotest/nvim-nio" },
        },
    },
    {
        "mxsdev/nvim-dap-vscode-js",
        branch = "main",
        version = "*",

        enabled = false,

        -- Loading
        event = "VeryLazy",
        lazy = true,

        config = function()
            require("dap-vscode-js").setup({
                -- WARNING: ensure manually compiled vscode-js-debug github project
                debugger_path = "/home/vinii/Downloads/vscode-js-debug",
                adapters = {
                    "pwa-node",
                    "pwa-chrome",
                    "pwa-msedge",
                    "pwa-extensionHost",
                },
            })
        end,
    },
    {
        dir = "~/Documents/projects/rings-nvim",

        enabled = false,

        -- Loading
        event = "VeryLazy",
        lazy = true,
    },
}
