local cmp = require("cmp")
local cmp_icons = require("plugins._nvim-cmp.icons")

local m = {}

---@param entry { source: {} }
---@param item {abbr: string, word: string, dup: number, kind: string, menu: string, kind_hl_group: string }
function m.populate_custom_kinds(entry, item)
    local is_text = item.kind == cmp_icons.Text .. " Text"

    if entry.source.name == "nvim_lsp" then
        local lsp_name = tostring(entry.source.source.client.name)

        if is_text then
            local is_html_snippet = lsp_name == "emmet_language_server"
            if is_html_snippet then
                item.kind_hl_group = "CmpItemKindHtml"
                item.kind = tostring(cmp_icons.Html) .. " Html"
            end
        end
    elseif entry.source.name == "nvim_lsp_signature_help" then
        if is_text then
            item.kind_hl_group = "CmpItemKindFunctionParameter"
            item.kind = tostring(cmp_icons.FunctionParameter) .. " Parameter"
        end
    end
end

-- NOTE: everything below this comment is unused
-- TODO: maybe remove in the future

local kind_mapper = require("cmp.types").lsp.CompletionItemKind
local kind_score = {
    FunctionParameter = 1,
    Html = 1,
    Version = 1,
    Feature = 1,
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

--- Moves CompletionItemKind to the bottom of priority
--- @param kind any CompletionItemKind
--- @return nil
local function set_bottom_priority(kind) -- unnecessary as long as the function below works
    -- Magic function (unfortunately) for setting Text kind as lowest priority (unless its a emmet_language_server Html snippet)
    -- emmet_language_server snippets are considered text before format function kick in

    -- i do not know if e1 is current item entry and e2 is next one
    return function(e1, e2)
        if kind == cmp.lsp.CompletionItemKind.Text then
            local is_html_snippet = vim.inspect(e1.source.name)
            -- returning false means (i hope so): it will remain the same order?
            if is_html_snippet then
                return false
            end
        end
        if e1:get_kind() == kind then
            return false
        end
        if e2:get_kind() == kind then
            return true
        end
    end
end

local function sort_by_completion_item_kind(entry1, entry2)
    local kind1 = kind_score[kind_mapper[entry1:get_kind()]] or 100
    local kind2 = kind_score[kind_mapper[entry2:get_kind()]] or 100

    if kind1 < kind2 then
        return true
    elseif kind1 > kind2 then
        return false
    end
end

return m
