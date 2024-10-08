local cmp = require("cmp")

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline({ "/", "?" }, {
--     mapping = cmp.mapping.preset.cmdline(),
--     sources = {
--         { name = "buffer" },
--     },
-- })

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline(":", {
--     mapping = {
--         -- cmp.mapping.preset.cmdline(),
--         ["<Tab>"] = cmp.mapping.confirm({
--             behavior = cmp.ConfirmBehavior.Insert,
--             select = true,
--         }),
--         ["<C-p>"] = cmp.mapping.select_prev_item(),
--         ["<C-n>"] = cmp.mapping.select_next_item(),
--     },
--     sources = cmp.config.sources({
--         { name = "path" },
--     }, {
--         { name = "cmdline" },
--     }),
--     matching = { disallow_symbol_nonprefix_matching = false },
-- })

-- original

local options = {
    completion = { completeopt = "menu,menuone" },
    -- breaking formatting fix
	-- issue: when using nvim highlight colors the CmpItemAbbrMatch does not work, the colors are the same for all letters even the matched ones
	-- second issue: when hovering on the selected option if it's a color it will show as white, despite being shown correctly if not hovered on
			--  formatting = {
			--      format = function(entry, item)
			--          item = require("nvim-highlight-colors").format(entry, item)
			-- return item
			--      end,
			--  },
    window = {
        completion = {
            border = "rounded",
            winhighlight = "Normal:CmpNormal,FloatBorder:CmpFloatBorder,CursorLine:CmpVisual",
            side_padding = 0,
            scrollbar = false,
            scrolloff = 0,
        },
        documentation = {
            border = "rounded",
            winhighlight = "Normal:CmpNormal,FloatBorder:CmpFloatBorder,CursorLine:CmpVisual",
            side_padding = 0,
            scrollbar = false,
            scrolloff = 0,
        },
    },

    snippet = {
        expand = function(args) require("luasnip").lsp_expand(args.body) end,
    },

    mapping = {
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),

        ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
        }),

        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif require("luasnip").expand_or_jumpable() then
                require("luasnip").expand_or_jump()
            else
                fallback()
            end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif require("luasnip").jumpable(-1) then
                require("luasnip").jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    },

    matching = { disallow_symbol_nonprefix_matching = false },
    sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "nvim_lua" },
        { name = "path" },
    },
    experimental = {
        ghost_text = false,
    },
}

cmp.setup(options)
