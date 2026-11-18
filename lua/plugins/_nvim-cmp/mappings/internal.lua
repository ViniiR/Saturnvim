local cmp = require("cmp")

local lib = require("mappings.lib")
local keys = lib.keys
local modes = lib.modes
local desc = lib.desc

return {
    [keys.control("n")] = cmp.mapping.select_next_item(),
    [keys.control("p")] = cmp.mapping.select_prev_item(),
    [keys.control("d")] = cmp.mapping.scroll_docs(-4),
    [keys.control("f")] = cmp.mapping.scroll_docs(4),
    [keys.control(keys.space)] = cmp.mapping.complete(),
    [keys.control("z")] = cmp.mapping.close(),
    [keys.carriage_return] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
    }),
    [keys.tab] = cmp.mapping(function(fallback)
        if cmp.visible() then
            cmp.select_next_item()
            -- comment to disable <Tab> for luasnip
        elseif require("luasnip").expand_or_jumpable() then
            require("luasnip").expand_or_jump()
        else
            fallback()
        end
    end, { "i", "s" }),
    [keys.shift_tab] = cmp.mapping(function(fallback)
        if cmp.visible() then
            cmp.select_prev_item()
            -- comment to disable <S-Tab> for luasnip
        elseif require("luasnip").jumpable(-1) then
            require("luasnip").jump(-1)
        else
            fallback()
        end
    end, { "i", "s" }),
}
