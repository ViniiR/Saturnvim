--- @type vim.lsp.ClientConfig
return {
    cmd = { "lua-language-server" },
    filetypes = FILETYPES.lua,
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
            },
            telemetry = { enable = false },
            workspace = {
                maxPreload = 100000,
                preloadFileSize = 10000,
                checkThirdParty = "Disable", -- auto detect limited number of lua libraries
                library = { -- Libraries available for intellisense
                    -- NOTE: slow option
                    -- vim.api.nvim_get_runtime_file("", true),

                    vim.env.VIMRUNTIME .. "/lua",
                    vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy",
                    vim.fn.stdpath("config"),
                    "${3rd}/luv/library", -- libuv library
                    -- "${3rd}/busted/library", -- busted is a lua testing lib
                },
            },
        },
    },
}
