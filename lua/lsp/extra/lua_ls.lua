--- see https://luals.github.io/wiki/settings/
--- @type vim.lsp.ClientConfig
return {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    root_markers = {
        ".luarc.json",
        ".luarc.jsonc",
        ".stylua.toml",
        ".git",
    },
    -- formatters = {
    --     ignoreComments = false,
    -- },
    settings = {
        doc = {
            privateName = { "^_" },
        },
        Lua = {
            runtime = {
                version = "LuaJIT", -- Current Neovim Lua runtime version
                pathStrict = false, -- Searches nested directories if false
                path = vim.list_extend({ -- Paths for "require()"
                    "?.lua",
                    "?/init.lua",
                    "?/?.lua",
                }, vim.split(package.path, ";")), -- Default paths in "/nix/..."
            },
            diagnostics = {
                globals = { "vim" }, -- Global variables
                unusedLocalExclude = {
                    "^_",
                },
            },
            codeLens = { enable = true },
            hint = {
                enable = true,
                setType = true,
                semicolon = "Enable",
            },
            workspace = {
                maxPreload = 100000,
                preloadFileSize = 10000,
                checkThirdParty = "Disable", -- auto detect limited number of lua libraries

                library = { -- Libraries available for intellisense (including files for require)
                    vim.env.VIMRUNTIME .. "/lua",
                    vim.fn.stdpath("config"),

                    -- vim.fn.stdpath("data") .. "/lazy", -- all lazy plugins including itself NOTE: makes it way too slow
                    vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy", -- NOTE: mutually exclusive with .. /lazy

                    "${3rd}/luv/library", -- libuv library
                    -- "${3rd}/busted/library", -- busted is a lua testing lib
                },
            },
        },
    },
}
