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

-- 󰆧
local icons = {
    Text = "󰉿",
    Function = "󰊕",
    Method = "󰊕",
    Constructor = "",
    Field = "󰜢",
    Variable = "󰀫",
    Class = "󰠱",
    Interface = "",
    Module = "",
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

-- Moves CompletionItemKind to the bottom of priority
-- @param kind CompletionItemKind
-- @return nil
local function set_bottom_priority(kind) -- unnecessary as long as the function below works
    return function(e1, e2)
        if e1:get_kind() == kind then return false end
        if e2:get_kind() == kind then return true end
    end
end

local kind_mapper = require("cmp.types").lsp.CompletionItemKind
-- Defaults
-- 	Text = 1;
-- 	Method = 2;
-- 	Function = 3;
-- 	Constructor = 4;
-- 	Field = 5;
-- 	Variable = 6;
-- 	Class = 7;
-- 	Interface = 8;
-- 	Module = 9;
-- 	Property = 10;
-- 	Unit = 11;
-- 	Value = 12;
-- 	Enum = 13;
-- 	Keyword = 14;
-- 	Snippet = 15;
-- 	Color = 16;
-- 	File = 17;
-- 	Reference = 18;
-- 	Folder = 19;
-- 	EnumMember = 20;
-- 	Constant = 21;
-- 	Struct = 22;
-- 	Event = 23;
-- 	Operator = 24;
-- 	TypeParameter = 25;
local kind_score = {
    Variable = 1,
    Color = 2,
    Method = 3,
    Function = 4,
    Constructor = 5,
    Field = 6,
    Class = 7,
    Interface = 8,
    Module = 9,
    Property = 10,
    Unit = 11,
    Value = 12,
    Enum = 13,
    Keyword = 14,
    Snippet = 15,
    EnumMember = 16,
    Constant = 17,
    Struct = 18,
    Text = 19,
    File = 20,
    Reference = 21,
    Folder = 22,
    Event = 23,
    Operator = 24,
    TypeParameter = 25,
}

local function sort_by_completion_item_kind(entry1, entry2)
    local kind1 = kind_score[kind_mapper[entry1:get_kind()]] or 100
    local kind2 = kind_score[kind_mapper[entry2:get_kind()]] or 100

    if kind1 < kind2 then
        return true
    elseif kind1 > kind2 then
        return false
    end
end

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
            -- set_bottom_priority(require("cmp.types").lsp.CompletionItemKind.Text),
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.score,
            cmp.config.compare.recently_used,
            cmp.config.compare.locality,
            function(entry1, entry2) sort_by_completion_item_kind(entry1, entry2) end,
            cmp.config.compare.kind,
            cmp.config.compare.length,
            cmp.config.compare.sort_text,
            cmp.config.compare.order,
        },
    },
    sources = {
        { name = "nvim_lsp", priority = 10 },
        { name = "path", priority = 9 },
        { name = "luasnip", priority = 8 },
        { name = "nvim_lua", priority = 7 },
        { name = "buffer", priority = 6 },
    },
    experimental = {
        ghost_text = false,
    },
}

cmp.setup(options)
