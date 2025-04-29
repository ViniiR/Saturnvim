local mappings = require("mappings")

return {
    ---Sets up all undotree keybinds
    undotree = function()
        for _, mapping in ipairs(mappings.undotree) do
            local mode = mapping[1]
            local lhs = mapping[2]
            local rhs = mapping[3]
            local opts = mapping[4]
            vim.keymap.set(mode, lhs, rhs, opts)
        end
    end,

    ---Sets up all oil keybinds
    oil = function()
        for _, mapping in ipairs(mappings.oil) do
            local mode = mapping[1]
            local lhs = mapping[2]
            local rhs = mapping[3]
            local opts = mapping[4]
            vim.keymap.set(mode, lhs, rhs, opts)
        end
    end,

    ---Sets up all conform keybinds
    conform = function()
        for _, mapping in ipairs(mappings.conform) do
            local mode = mapping[1]
            local lhs = mapping[2]
            local rhs = mapping[3]
            local opts = mapping[4]
            vim.keymap.set(mode, lhs, rhs, opts)
        end
    end,

    ---Sets up all dap keybinds
    dap = function()
        for _, mapping in ipairs(mappings.dap) do
            local mode = mapping[1]
            local lhs = mapping[2]
            local rhs = mapping[3]
            local opts = mapping[4]
            vim.keymap.set(mode, lhs, rhs, opts)
        end
    end,

    ---Sets up all telescope keybinds
    telescope = function()
        for _, mapping in ipairs(mappings.telescope) do
            local mode = mapping[1]
            local lhs = mapping[2]
            local rhs = mapping[3]
            local opts = mapping[4]
            vim.keymap.set(mode, lhs, rhs, opts)
        end
    end,

    ---Sets up all harpoon keybinds
    harpoon = function()
        for _, mapping in ipairs(mappings.harpoon) do
            local mode = mapping[1]
            local lhs = mapping[2]
            local rhs = mapping[3]
            local opts = mapping[4]
            vim.keymap.set(mode, lhs, rhs, opts)
        end
    end,

    ---Sets up all editor keybinds
    editor = function()
        for _, mapping in ipairs(mappings.editor) do
            local mode = mapping[1]
            local lhs = mapping[2]
            local rhs = mapping[3]
            local opts = mapping[4]
            vim.keymap.set(mode, lhs, rhs, opts)
        end
    end,

    ---Sets up all nvim lsp specific keybinds
    ---@param bufnr integer
    lspconfig = function(bufnr)
        for _, mapping in ipairs(mappings.lspconfig) do
            local mode = mapping[1]
            local lhs = mapping[2]
            local rhs = mapping[3]
            local opts = mapping[4]
            opts.buffer = bufnr
            vim.keymap.set(mode, lhs, rhs, opts)
        end
    end,
}
