local cmp_lib = require("plugins._nvim-cmp.lib")
local cmp_icons = require("plugins._nvim-cmp.icons")
local cmp_hlc_lib = require("plugins._nvim-cmp.lib.cmp_nvim_highlight_colors")
local border_settings = require("settings.border")

return {
    mapping = require("plugins._nvim-cmp.mappings.internal"),
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    completion = {
        completeopt = "menu,menuone",
    },
    formatting = {
        fields = { "abbr", "kind", "menu" },
        ---@param entry { source: {} }
        ---@param item {abbr: string, word: string, dup: number, kind: string, menu: string, kind_hl_group: string }
        format = function(entry, item)
            if item.menu ~= nil and #item.menu >= 60 then
                item.menu = string.sub(item.menu or "", 1, 60) .. "..."
            end

            -- Set "KindName .. Icon" for all items
            local icon = cmp_icons[item.kind]
            if icon == nil then
                item.kind = cmp_icons.Text .. " Text"
            else
                -- item.kind = " " .. item.kind
                -- item.abbr = tostring(icon) .. " " .. item.abbr
                item.kind = tostring(icon) .. " " .. item.kind
            end

            -- Handle custom item kinds
            if entry.source.source then
                cmp_lib.populate_custom_kinds(entry, item)
            end

            -- Exclusively used for CompletionItemKind.Color items
            item = cmp_hlc_lib.custom_hlc_format(entry, item)

            -- item = require("nvim-highlight-colors").format(entry, item)
            return item
        end,
    },
    window = {
        completion = {
            border = border_settings.kind,
            winhighlight = "Normal:CmpNormal,FloatBorder:CmpFloatBorder,CursorLine:CmpVisual",
            side_padding = 1,
            scrollbar = false,
            scrolloff = 0,
            -- max_width = math.floor(vim.o.columns * 0.5),
        },
        documentation = {
            border = border_settings.kind,
            winhighlight = "Normal:CmpNormal,FloatBorder:CmpFloatBorder,CursorLine:CmpVisual",
            side_padding = 1,
            scrollbar = false,
            scrolloff = 0,
        },
    },
    matching = {
        disallow_symbol_nonprefix_matching = false,
    },
    sorting = {
        -- comparators = {
        --     set_bottom_priority(require("cmp.types").lsp.CompletionItemKind.Text),
        --     cmp.config.compare.offset,
        --     cmp.config.compare.exact,
        --     cmp.config.compare.score,
        --     cmp.config.compare.recently_used,
        --     cmp.config.compare.locality,
        --     function(entry1, entry2) sort_by_completion_item_kind(entry1, entry2) end,
        --     cmp.config.compare.kind,
        --     -- change length
        --     cmp.config.compare.length,
        --     cmp.config.compare.sort_text,
        --     cmp.config.compare.order,
        -- },
    },
    sources = {
        -- { name = "nvim_lsp", priority = 10 },
        -- { name = "path", priority = 9 },
        -- { name = "luasnip", priority = 8 },
        -- { name = "nvim_lua", priority = 7 },
        -- { name = "buffer", priority = 6 },
        { name = "nvim_lsp" },
        { name = "path" },
        { name = "luasnip" },
        { name = "nvim_lua" },
        { name = "buffer" },
        { name = "nvim_lsp_signature_help" },
        --
        { name = "crates" },
    },
    experimental = {
        ghost_text = false,
    },
}

-- Default kind scores
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
