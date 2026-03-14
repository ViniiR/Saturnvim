--- @type vim.lsp.ClientConfig
return {
    cmd = { "nil" },
    filetypes = { "nix" },
    -- single_file_support = true,
    root_markers = {
        "flake.nix",
        ".git",
    },
    -- coming from "https://github.com/NobbZ/nobbz-vim/blob/main/plugins/nobbz/lua/nobbz/lsp/clients/nil.lua"
    settings = {
        ["nil"] = {
            nix = {
                binary = "nix",
                maxMemoryMB = nil,
                flake = {
                    autoEvalInputs = false,
                    autoArchive = false,
                    nixpkgsInputName = nil,
                },
            },
            formatting = {
                command = { "alejandra", "--" },
            },
        },
    },
}
