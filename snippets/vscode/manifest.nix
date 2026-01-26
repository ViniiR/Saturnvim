{
    name = "SaturnVim Snippets";
    contributes = {
        snippets = [
            {
                language = [
                    "javascript"
                    "javascriptreact"
                    "typescript"
                    "typescriptreact"
                ];
                path = ./ecmascript.nix;
            }
            {
                language = "json";
                path = ./json.nix;
            }
            {
                language = "rust";
                path = ./rust.nix;
            }
            {
                language = [
                    "bash"
                    "zsh"
                    "shell"
                    "sh"
                ];
                path = ./bash.nix;
            }
            {
                language = [
                    "c"
                    "cpp"
                ];
                path = ./cxx.nix;
            }
            {
                language = "cpp";
                path = ./cpp.nix;
            }
            {
                language = "nix";
                path = ./nix.nix;
            }
            {
                language = "lua";
                path = ./lua.nix;
            }
            {
                language = "ocaml";
                path = ./ocaml.nix;
            }
        ];
    };
}
