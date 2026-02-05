-- Used by ignore_install and highlight.disable,
-- Why enable it if it should not be installed?
local ignore_install = {
    "gitcommit",
}

--- @type table
return {
    -- A list of parser names (the listed parsers MUST always be installed)
    ensure_installed = {
        "bash",
        "c",
        "comment",
        "cpp",
        "css",
        "csv",
        "diff",
        "git_config",
        "git_rebase",
        "gitignore",
        "html",
        "ini",
        "javascript",
        "json",
        -- "jsonc", -- issues downloading, unmaintained parser (might still work)
        "lua",
        "markdown",
        "markdown_inline",
        "nix",
        "php",
        "query",
        "rasi",
        "rust",
        "scss",
        "tmux",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "xml",
        "yaml",
        "gdscript",
    },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,
    -- List of parsers to ignore installing
    ignore_install = ignore_install,

    indent = true, -- experimental
    fold = false,

    highlight = {
        enable = true,
        disable = ignore_install,
    },
}
