local cmp = require("cmp")

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
    Keyword = "󰌋", --
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
    Boolean = "", --
    Number = "", --
    Null = "󰟢", --
    File = "󰈚",
    Folder = "󰉋", -- Directory
    Namespace = "󰌗",
    TypeParameter = "󰊄",
    Package = "",
    EnumMember = "",

    --

    Unit = "󰑭",
    Reference = "󰈇",
    Event = "",
    Supermaven = "",
    Calendar = "",
    Watch = "󰥔",
    Copilot = "",
    Codeium = "",
    TabNine = "",
    BladeNav = "",
}

--- Moves CompletionItemKind to the bottom of priority
--- @param kind any CompletionItemKind
--- @return nil
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

local format_cache = {}
local colors = require("nvim-highlight-colors.color.utils")
local utils = require("nvim-highlight-colors.utils")
local options_hlc = {
    render = utils.render_options.background,
    enable_hex = true,
    enable_rgb = true,
    enable_hsl = true,
    enable_var_usage = true,
    enable_named_colors = true,
    enable_short_hex = true,
    enable_tailwind = false,
    custom_colors = nil,
    virtual_symbol = "■",
    virtual_symbol_prefix = "",
    virtual_symbol_suffix = " ",
    virtual_symbol_position = "inline",
    exclude_filetypes = {},
    exclude_buftypes = {},
}
local function format(entry, item)
    local kind_text = string.sub(item.kind, item.kind:find("%s") + 1 or 1, #item.kind)
    -- item.menu = item.kind
    -- item.kind = item.abbr
    -- item.kind_hl_group = ""
    -- item.abbr = ""

    if kind_text ~= "Color" then
        -- item.abbr = "  " .. item.abbr
        return item
    end

    local entryItem = entry:get_completion_item()
    if entryItem == nil then return item end

    local entryDoc = entryItem.documentation
    if entryDoc == nil or type(entryDoc) ~= "string" then return item end

    local cached = format_cache[entryDoc]
    if cached == nil then
        local color_hex = colors.get_color_value(entryDoc)
        cached = color_hex and { hl_group = utils.create_highlight_name("fg-" .. color_hex), color_hex = color_hex }
            or false
        format_cache[entryDoc] = cached
    end
    if cached then
        vim.api.nvim_set_hl(0, cached.hl_group, { fg = cached.color_hex, default = true })
        -- IMPORTANT: for those who came here from the nvim-highlight-colors nvim-cmp integration issue, the commented lines are what i show on the issue
        -- item.abbr_hl_group = cached.hl_group
        -- item.abbr = options_hlc.virtual_symbol .. " " .. item.abbr
        --
        -- +(plus) these lines up above:
        -- if kind_text ~= "Color" then
        --     item.abbr = "  " .. item.abbr
        --     return item
        -- end
        --
        -- these two lines here -(minus) the if statement up above are what i settled on after some more testing (it's been like 10 mins since i closed the issue and i'm shy to comment on it again)
        item.kind_hl_group = cached.hl_group
        local symbol = options_hlc.virtual_symbol
        item.kind = item.kind .. " " .. symbol
    end
    return item
end

local options = {
    completion = { completeopt = "menu,menuone" },
    formatting = {
        ---@param entry {}
        ---@param item {abbr: string, word: string, dup: number, kind: string, menu: string }
        format = function(entry, item)
            if item.menu ~= nil and #item.menu >= 60 then item.menu = string.sub(item.menu or "", 1, 60) .. "..." end

            local icon = icons[item.kind]
            if icon == nil then
                item.kind = icons.Text .. " Text"
            else
                -- item.kind = " " .. item.kind
                -- item.abbr = tostring(icon) .. " " .. item.abbr
                item.kind = tostring(icon) .. " " .. item.kind
            end

            item = format(entry, item)
            -- vim.notify(vim.inspect(item))

            -- item = require("nvim-highlight-colors").format(entry, item)
            return item
        end,
    },
    window = {
        completion = {
            -- { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
            border = BORDER_KIND or "single",
            winhighlight = "Normal:CmpNormal,FloatBorder:CmpFloatBorder,CursorLine:CmpVisual",
            side_padding = 1,
            scrollbar = false,
            scrolloff = 0,
            -- max_width = math.floor(vim.o.columns * 0.5),
        },
        documentation = {
            border = BORDER_KIND or "single",
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
        ["<C-z>"] = cmp.mapping.close(),

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
            set_bottom_priority(require("cmp.types").lsp.CompletionItemKind.Text),
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
    },
    experimental = {
        ghost_text = false,
    },
}

cmp.setup(options)

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
