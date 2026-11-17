## Features

- Ctrl + rmb goto link or "gl"
- Enable inlay hints on all LSP that support it
- Cmp gitcommit source
- Command mode autopairs (maybe)
- Use native completion + snippets
- Document_color
- Separate autocmds
- Separate semantic tokens config

## Fixes

- vim-illuminate fix order

- Remove #region #endregion snippets
- Virt column fix
- Goto on lazy plugins
- Cmp "..." bug(only happens in "" and not [""] likely some special cmp flag to remove edge characters but works when it isn't a string too)
- Hover doesnt ignore ```
- Nvim cmp lsp capabilities
- Lua_ls autocomplete slow if include all plugins
- Fix filetypes issues from 0.12

## Plugins

- vscode-diff-nvim
- coerce.nvim
- https://github.com/ThePrimeagen/refactoring.nvim?tab=readme-ov-file#refactoring-features
- preview.nvim
- nvim-treesitter-textobjects
