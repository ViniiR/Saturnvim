local luasnip = require("luasnip")
vim.g.vscode_snippets_path = vim.fn.stdpath("config") .. "/snippets/vscode"

-- vscode format
require("luasnip.loaders.from_vscode").lazy_load({ exclude = vim.g.vscode_snippets_exclude or {} })
require("luasnip.loaders.from_vscode").lazy_load({ paths = vim.g.vscode_snippets_path or "" })

-- snipmate format
require("luasnip.loaders.from_snipmate").load()
require("luasnip.loaders.from_snipmate").lazy_load({ paths = vim.g.snipmate_snippets_path or "" })

-- lua format
require("luasnip.loaders.from_lua").load()
require("luasnip.loaders.from_lua").lazy_load({ paths = vim.g.lua_snippets_path or "" })

vim.api.nvim_create_autocmd("InsertLeave", {
    callback = function()
        if
            require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
            and not require("luasnip").session.jump_active
        then
            require("luasnip").unlink_current()
        end
    end,
})

luasnip.setup({
    -- FIXME: history is a legacy option
    history = true,
    -- keep_roots = false,
    -- link_roots = false,
    -- exit_roots = true,
    -- link_children = false,

    -- FIXME: i'm unsure which one i should use, _ is newer
    updateevents = "TextChanged,TextChangedI",
    update_events = "TextChanged,TextChangedI",
})
