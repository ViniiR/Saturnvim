## Features

- Ctrl + rmb goto link or "gl"
- Cmp gitcommit source
- Command mode autopairs (maybe)
- Use native completion + snippets
- Document_color
- Add IMPORTANT: highlight
- Make it so b, and e do not jump lines

- Goto definition on lazy plugins
- Nvim cmp lsp capabilities

## Fixes

- Use vim.cmd. instead of vim.cmd()

- Zig icon color
- C icon and color

- Remove #region #endregion snippets
- Virt column fix
- Cmp "..." bug(only happens in "" and not [""] likely some special cmp flag to remove edge characters but works when it isn't a string too)
- Hover doesnt ignore ```
- Lua_ls autocomplete slow if include all plugins
- Fix filetypes issues from 0.12

## Plugins

- vscode-diff-nvim
- coerce.nvim
- https://github.com/ThePrimeagen/refactoring.nvim?tab=readme-ov-file#refactoring-features
- preview.nvim
- nvim-treesitter-textobjects
