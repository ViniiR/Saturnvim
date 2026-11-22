local hl_colors_icons = require("plugins._nvim-highlight-colors.icons")
local colors = require("nvim-highlight-colors.color.utils")
local utils = require("nvim-highlight-colors.utils")

local m = {}

local format_cache = {}
-- TODO: most of these options are apparently never used?
local options_hlc = {
    render = utils.render_options.background,
    enable_hex = true,
    enable_rgb = true,
    enable_hsl = true,
    enable_var_usage = true,
    enable_named_colors = true,
    enable_short_hex = true,
    enable_tailwind = true, -- TODO: was false before (untested)
    custom_colors = nil,
    virtual_symbol = hl_colors_icons.virtual_color,
    virtual_symbol_prefix = "",
    virtual_symbol_suffix = " ",
    virtual_symbol_position = "inline",
    exclude_filetypes = {},
    exclude_buftypes = {},
}

function m.custom_hlc_format(entry, item)
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
    if entryItem == nil then
        return item
    end

    local entryDoc = entryItem.documentation
    if entryDoc == nil or type(entryDoc) ~= "string" then
        return item
    end

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
        -- these two lines here -(minus) the if statement up above are what i settled on after some more testing (it's been like 10 mins since i closed the issue and i'm shy to comment on it again) (it's been 5 months, i have no idea what i've done)
        item.kind_hl_group = cached.hl_group
        local symbol = options_hlc.virtual_symbol
        item.kind = item.kind .. " " .. symbol
    end
    return item
end

return m
