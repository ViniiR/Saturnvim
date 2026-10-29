-- WARNING: AI written code, i decided to separate it from the rest since it is so long
-- it does have acceptable performance, it does not however highlight it in a perfect way (TODO: improve hl)

local namespace = vim.api.nvim_create_namespace("ZigFormatHighlights")

local function set_extmark_safe(bufnr, ns, line_idx, start_col, end_col, hl_group, priority)
    if end_col > start_col then
        vim.api.nvim_buf_set_extmark(bufnr, ns, line_idx, start_col, {
            end_col = end_col,
            hl_group = hl_group,
            priority = priority,
        })
    end
end

local function handle_special_or_colon(bufnr, ns, line_idx, inner_col_start, i, is_colon, state)
    if state.current_start then
        local v_start = inner_col_start + (state.current_start - 1)
        local v_end = inner_col_start + (i - 1)
        set_extmark_safe(bufnr, ns, line_idx, v_start, v_end, state.current_type, 115)
        state.current_start = nil
        state.current_type = nil
    end
    if is_colon then
        state.has_seen_colon = true
    end
    local s_char_col = inner_col_start + (i - 1)
    set_extmark_safe(bufnr, ns, line_idx, s_char_col, s_char_col + 1, "Special", 115)
end

local function handle_regular_char(bufnr, ns, line_idx, inner_col_start, i, state)
    local target_type = state.has_seen_colon and "Number" or "CustomVVariable"
    if not state.current_start then
        state.current_start = i
        state.current_type = target_type
        return
    end
    if state.current_type ~= target_type then
        local v_start = inner_col_start + (state.current_start - 1)
        local v_end = inner_col_start + (i - 1)
        set_extmark_safe(bufnr, ns, line_idx, v_start, v_end, state.current_type, 115)
        state.current_start = i
        state.current_type = target_type
    end
end

local function highlight_inner_text(bufnr, ns, line_idx, inner_sub, inner_col_start)
    local state = { current_start = nil, current_type = nil, has_seen_colon = false }
    for i = 1, #inner_sub + 1 do
        local char = i <= #inner_sub and inner_sub:sub(i, i) or ""
        local is_special = (char == "?" or char == "!")
        local is_colon = (char == ":")

        if is_special or is_colon or char == "" then
            handle_special_or_colon(bufnr, ns, line_idx, inner_col_start, i, is_colon, state)
        else
            handle_regular_char(bufnr, ns, line_idx, inner_col_start, i, state)
        end
    end
end

local function find_escaped_brace_end(quoted_str, s)
    local depth, j = 0, s
    while j <= #quoted_str do
        if quoted_str:sub(j, j + 1) == "{{" then
            depth = depth + 1
            j = j + 2
        elseif quoted_str:sub(j, j + 1) == "}}" then
            depth = depth - 1
            if depth == 0 then
                return j + 1
            end
            j = j + 2
        else
            j = j + 1
        end
    end
    return nil
end

local function find_single_brace_end(quoted_str, s)
    local depth, invalid = 0, false
    for j = s, #quoted_str do
        local char = quoted_str:sub(j, j)
        local next_char = quoted_str:sub(j + 1, j + 1)
        if char == "{" then
            if next_char == "{" then
                invalid = true
            end
            depth = depth + 1
            if depth > 1 then
                invalid = true
            end
        elseif char == "}" then
            if next_char == "}" then
                invalid = true
            end
            depth = depth - 1
            if depth == 0 then
                if not invalid then
                    return j
                end
                return nil
            end
        end
    end
    return nil
end

local function process_single_brace(bufnr, ns, line_idx, quoted_str, s_quote, s, e)
    local full_brace = quoted_str:sub(s, e)
    local brace_start_rel = s
    local brace_end_rel = e + 1

    local abs_brace_start = s_quote + brace_start_rel - 2
    local abs_brace_end = s_quote + brace_end_rel - 2

    set_extmark_safe(bufnr, ns, line_idx, abs_brace_start, abs_brace_start + 1, "Special", 110)
    set_extmark_safe(bufnr, ns, line_idx, abs_brace_end - 1, abs_brace_end, "Special", 110)

    local inner_text = full_brace:match("^{%s*(.-)%s*}$")
    if inner_text and inner_text ~= "" then
        local inner_sub = quoted_str:sub(brace_start_rel + 1, brace_end_rel - 2)
        local inner_col_start = s_quote + brace_start_rel - 1
        highlight_inner_text(bufnr, ns, line_idx, inner_sub, inner_col_start)
    end
end

local function scan_and_highlight_braces(bufnr, ns, line_idx, quoted_str, s_quote)
    local idx = 1
    while idx <= #quoted_str do
        local s = quoted_str:find("{", idx)
        if not s then
            break
        end

        if quoted_str:sub(s + 1, s + 1) == "{" then
            local e = find_escaped_brace_end(quoted_str, s)
            idx = e and (e + 1) or (s + 2)
        else
            local e = find_single_brace_end(quoted_str, s)
            if e then
                process_single_brace(bufnr, ns, line_idx, quoted_str, s_quote, s, e)
                idx = e + 1
            else
                idx = s + 1
            end
        end
    end
end

return function(cb_args)
    local bufnr = cb_args.buf or 0
    vim.api.nvim_buf_clear_namespace(bufnr, namespace, 0, -1)

    local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
    for row, line in ipairs(lines) do
        local line_idx = row - 1
        for s_quote, e_quote in line:gmatch('()"[^"]*"()') do
            local quoted_str = line:sub(s_quote, e_quote - 1)
            scan_and_highlight_braces(bufnr, namespace, line_idx, quoted_str, s_quote)
        end
    end
end
