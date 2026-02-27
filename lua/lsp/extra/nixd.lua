--- @type vim.lsp.ClientConfig
return {
    cmd = { "nixd" },
    root_markers = {
        "flake.nix",
        "shell.nix",
        ".git",
    },
    filetypes = { "nix" },
    -- FIXME: has capability to autocomplete nixos && hm modules but doesn't
    settings = {
        nixd = {
            nixpkgs = {
                expr = "import <nixpkgs> { }",
            },
            formatting = {
                command = { "alejandra" },
            },
            options = {
                nixos = {
                    expr = '(builtins.getFlake ("git+file://" + toString ./.)).nixosConfigurations.nixos.options',
                },
                home_manager = {
                    expr = '(builtins.getFlake ("git+file://" + toString ./.)).homeConfigurations."vinii@nixos".options',
                },
            },
        },
    },
}
