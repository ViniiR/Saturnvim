local cmp = require("cmp")

-- cmp.setup.cmdline({ "/", "?" }, {
--     mapping = cmp.mapping.preset.cmdline(),
--     sources = {
--         { name = "buffer" },
--     },
-- })

-- cmp.setup.cmdline(":", {
--     mapping = cmp.mapping.preset.cmdline({
--         ["<C-p>"] = { c = cmp.mapping.select_prev_item() },
--         ["<C-n>"] = { c = cmp.mapping.select_next_item() },
-- 					--    ["<Tab>"] = {
-- 					--        c = function()
-- 					--            local entry = cmp.get_selected_entry()
-- 					--            if entry then
-- 					--                local items = cmp.get_entries()
-- 					-- print(items[1])
-- 					--                if #items > 0 and entry == items[1] then cmp.mapping.confirm() end
-- 					--            end
-- 					--            cmp.mapping.select_next_item()
-- 					--        end,
-- 					--    },
--     }),
--     sources = cmp.config.sources({
--         { name = "path" },
--     }, {
--         { name = "cmdline" },
--     }),
--     matching = { disallow_symbol_nonprefix_matching = false },
-- })

local icons = {
    Text = "󰉿",
    Function = "󰆧",
    Constructor = "",
    Field = "󰜢",
    Variable = "󰀫",
    Class = "󰠱",
    Interface = "",
    Module = "",
    Method = "󰆧",
    Property = "󰜢",
    Value = "󰎠",
    Enum = "",
    Keyword = "󰌋",
    Snippet = "",
    Color = "󰏘",
    Constant = "󰏿",
    Struct = "󰙅",
    String = "󰉿",
    Operator = "󰆕",
    Table = "",
    Object = "󰅩",
    Tag = "",
    Array = "[]",
    Boolean = "",
    Number = "",
    Null = "󰟢",
    File = "󰈚",

    --

    Namespace = "󰌗",
    Unit = "󰑭",
    Reference = "󰈇",
    Directory = "󰉋",
    EnumMember = "",
    Event = "",
    TypeParameter = "󰊄",
    Supermaven = "",
    Calendar = "",
    Watch = "󰥔",
    Package = "",
    Copilot = "",
    Codeium = "",
    TabNine = "",
    BladeNav = "",
}

local options = {
    completion = { completeopt = "menu,menuone" },
    -- breaking formatting fix
    -- issue: when using nvim highlight colors the CmpItemAbbrMatch does not work, the colors are the same for all letters even the matched ones
    -- second issue: when hovering on the selected option if it's a color it will show as white, despite being shown correctly if not hovered on
    formatting = {
        format = function(entry, item)
            item.kind = icons[item.kind] .. " " .. item.kind or icons.Text

            if item.menu ~= nil and item.menu ~= "" then item.menu = "-> " .. item.menu end

            if item.menu ~= nil and #item.menu >= 60 then item.menu = string.sub(item.menu or "", 1, 60) .. "..." end
            -- item = require("nvim-highlight-colors").format(entry, item)
            return item
        end,
    },
    window = {
        completion = {
            border = "rounded",
            winhighlight = "Normal:CmpNormal,FloatBorder:CmpFloatBorder,CursorLine:CmpVisual",
            side_padding = 1,
            scrollbar = false,
            scrolloff = 0,
            -- max_width = math.floor(vim.o.columns * 0.5),
        },
        documentation = {
            border = "rounded",
            winhighlight = "Normal:CmpNormal,FloatBorder:CmpFloatBorder,CursorLine:CmpVisual",
            side_padding = 1,
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
    sorting = {
        comparators = {
            cmp.config.compare.exact,
            cmp.config.compare.recently_used,
            cmp.config.compare.locality,
            cmp.config.compare.offset,
        },
    },
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
