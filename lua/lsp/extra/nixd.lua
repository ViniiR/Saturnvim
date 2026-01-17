--- @type vim.lsp.ClientConfig
return {
    cmd = { "nixd" },
    root_markers = {
        "flake.nix",
        "shell.nix",
        ".git",
    },
    filetypes = { "nix" },
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
