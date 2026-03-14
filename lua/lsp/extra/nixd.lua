--- @type vim.lsp.ClientConfig
return {
    cmd = { "nixd" },
    filetypes = { "nix" },
    root_markers = {
        "flake.nix",
        ".git",
    },
    -- FIXME: has capability to autocomplete nixos && hm modules but doesn't
    settings = {
        nixd = {
            nixpkgs = {
                -- For flake.
                -- This expression will be interpreted as "nixpkgs" toplevel
                -- Nixd provides package, lib completion/information from it.
                -- Resource Usage: Entries are lazily evaluated, entire nixpkgs takes 200~300MB for just "names".
                -- Package documentation, versions, are evaluated by-need.
                -- expr = "import (builtins.getFlake(toString ./.)).inputs.nixpkgs { }",
                expr = nil,
            },
            formatting = {
                command = nil,
            },
            options = {
                nixos = {
                    expr = nil,
                },
                -- home_manager = {
                --     expr = 'let flake = builtins.getFlake(toString ./.); in flake.homeConfigurations."nixos@vinii".options',
                -- },
            },
        },
    },
}
