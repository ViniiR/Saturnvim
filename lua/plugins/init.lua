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
        priority = 1000, -- Recommended

        opts = require("configs._onedark-nvim"),
        config = function(_, opts)
            require("onedark").setup(opts)
            require("onedark").load()
            -- no mappings
        end,
    },
    {
        -- INFO: Must be loaded right after theme
        "nvim-tree/nvim-web-devicons",
        branch = "master",
        version = false, -- tags are years behind updates

        -- Loading
        lazy = false,

        opts = function()
            return require("configs._nvim-web-dev-icons")
        end,
    },
    {
        -- INFO: Now only used by vim.lsp api to define default configs
        "neovim/nvim-lspconfig",
        branch = "master",
        version = "*",

        -- Loading
        event = "VeryLazy",
        lazy = true,

        -- using lspconfig to load vim.lsp config
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

        opts = require("configs._telescope-nvim"),
        config = function(_, opts)
            require("telescope").setup(opts)
            require("mappings.setup._telescope")()
        end,

        dependencies = {
            { "nvim-lua/plenary.nvim" },
            -- { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        },
    },
    {
        "brenoprata10/nvim-highlight-colors",
        branch = "main",
        version = false, -- does not offer tags

        -- Loading
        event = "VeryLazy",
        lazy = true,

        opts = require("configs._nvim-highlight-colors"),
    },
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        commit = "5a70b1e", -- must match nixpkgs nvim-treesitter-cli version
        version = false, -- releases are still the master branch

        -- Loading
        lazy = false,

        build = ":TSUpdate",
        opts = function()
            return require("configs._nvim-treesitter")
        end,
        init = function()
            vim.env.CC = "gcc"
        end,
        config = function(_, opts)
            require("nvim-treesitter.config").setup(opts)
        end,
    },
    {
        "ViniiR/nvim-treesitter-extension",
        branch = "master",
        version = "*",

        -- dir = "~/Documents/projects/nvim-treesitter-extension",
        -- dev = true,

        -- Loading
        lazy = false,

        opts = require("configs._nvim-treesitter-extension"),
    },
    {
        "stevearc/conform.nvim",
        branch = "master",
        version = "*",

        -- Loading
        event = "VeryLazy",
        lazy = true,

        opts = require("configs._conform-nvim"),
        config = function(_, opts)
            require("conform").setup(opts)
            require("mappings.setup._conform")()
        end,
    },
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        version = false, -- does not offer tags

        -- Loading
        event = "VimEnter",
        lazy = true,

        init = function()
            vim.g.harpoon_opts = {
                border = BORDER_KIND,
                title_pos = "left",
                title = string.format(" %s Harpoon ", HARPOON_ICON),
            }
        end,
        opts = require("configs._harpoon"),
        config = function(_, opts)
            require("harpoon"):setup(opts)
            require("mappings.setup._harpoon")()
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

        opts = function()
            return require("configs._nvim-surround")
        end,
        config = function(_, opts)
            require("nvim-surround").setup(opts)
            -- no mappings
        end,
    },
    {
        "stevearc/oil.nvim",
        branch = "master",
        version = false, -- tags are years behind updates

        -- Loading
        lazy = false, -- Load immediately to avoid Netrw

        opts = require("configs._oil-nvim"),
        config = function(_, opts)
            require("oil").setup(opts)
            require("mappings.setup._oil")()
        end,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        branch = "master",
        version = "*",

        -- Loading
        event = "VeryLazy",
        lazy = true,

        main = "ibl", -- TODO: check if works without explicit main =
        opts = require("configs._indent-blankline-nvim"),
        config = function(_, opts)
            require("ibl").setup(opts)
            require("mappings.setup._indent-blankline")()
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

        opts = require("configs._which-key-nvim"),
        config = function(_, opts)
            require("which-key").setup(opts)
            require("mappings.setup._which-key")()
        end,
    },
    {
        "mbbill/undotree",
        branch = "master",
        version = false, -- tags are years behind updates

        -- Loading
        event = "VeryLazy",
        lazy = true,

        init = function()
            for key, value in pairs(require("configs._undotree")) do
                vim.g[key] = value
            end
        end,
        config = function()
            -- no setup
            require("mappings.setup._undotree")()
        end,
    },
    {
        "nvimdev/dashboard-nvim",
        branch = "master",
        version = false, -- does not offer tags

        -- Loading
        event = "VimEnter",
        lazy = true,

        opts = require("configs._dashboard-nvim"),
    },
    {
        "lewis6991/gitsigns.nvim",
        branch = "main",
        version = "*",

        -- Loading
        event = "VeryLazy",
        lazy = true,

        opts = require("configs._gitsigns-nvim"),
        config = function(_, opts)
            require("gitsigns").setup(opts)
            require("mappings.setup._gitsigns")()
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        branch = "master",
        version = false, -- does not offer tags

        -- Loading
        event = "VeryLazy",
        lazy = true,

        -- Cannot use opts, must do require operations
        opts = function()
            return require("configs._lualine-nvim")
        end,
        config = function(_, opts)
            require("lualine").setup(opts)
            -- no mappings
        end,
    },
    {
        "windwp/nvim-autopairs",
        branch = "master",
        version = false, -- tags are years behind updates

        -- Loading
        event = "InsertEnter",
        lazy = true,

        opts = require("configs._nvim-autopairs"),
        config = function(_, opts)
            local autopairs = require("nvim-autopairs")
            autopairs.setup(opts)
            local ok, plugin = pcall(require, "cmp")
            if ok then
                -- @diagnostic disable-next-line: undefined-field
                plugin.event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())
            end
            autopairs.remove_rule("```") -- FINALLY PEACE
            -- no mappings
        end,
    },
    {
        "ViniiR/NixSnip",
        branch = "master",
        version = "*",

        -- dir = "~/Documents/projects/NixSnip",
        dev = false,

        -- Loading
        event = "InsertEnter",
        lazy = true,

        -- build = "make install_jsregexp", -- optional
        -- Cannot use opts, must do require operations
        opts = function()
            return require("configs._luasnip")
        end,
        config = function(_, opts)
            require("luasnip").setup(opts)
        end,

        dependencies = {
            {
                "ViniiR/friendly-snippets",
                branch = "lua-functions-symbols",
            },
        },
    },
    {
        "hrsh7th/nvim-cmp",
        branch = "main",
        version = false, -- tags are years behind updates

        -- Loading
        event = "InsertEnter",
        lazy = true,

        opts = function()
            return require("configs._nvim-cmp")
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
        version = "*",

        -- Loading
        lazy = false, -- This plugin is already lazy

        init = function()
            -- IMPORTANT: WARNING: if lsp is not working basic features like showing errors, run :RustLsp (worked for me)
            vim.g.rustaceanvim = require("configs._rustaceanvim")
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
        opts = require("configs._crates-nvim"),
    },
    {
        "lukas-reineke/virt-column.nvim",
        branch = "master",
        version = "*",

        -- Loading
        event = "VeryLazy",
        lazy = true,

        opts = require("configs._virt-column-nvim"),
    },
    {
        "akinsho/toggleterm.nvim",
        branch = "main",
        version = false, -- tags are years behind updates

        -- Loading
        event = "VeryLazy",
        lazy = true,

        opts = require("configs._toggleterm-nvim"),
    },
    {
        "RRethy/vim-illuminate",
        branch = "master",
        version = false, -- does not offer tags

        -- Loading
        event = "VeryLazy",
        lazy = true,

        opts = require("configs._vim-illuminate"),
        config = function(_, opts)
            require("illuminate").configure(opts)
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
            -- TODO: migrate to opts
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

        -- TODO: migrate to opts
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

        -- TODO: migrate to opts
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
