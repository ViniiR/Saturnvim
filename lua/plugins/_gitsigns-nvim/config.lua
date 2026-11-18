local gitsigns_icons = require("plugins._gitsigns-nvim.icons")
local border_settings = require("settings.border")

return {
    signs = {
        add = { text = gitsigns_icons.signs.add },
        change = { text = gitsigns_icons.signs.change },
        delete = { text = gitsigns_icons.signs.delete },
        topdelete = { text = gitsigns_icons.signs.topdelete },
        changedelete = { text = gitsigns_icons.signs.changedelete },
        untracked = { text = gitsigns_icons.signs.untracked },
    },
    signs_staged = {
        add = { text = gitsigns_icons.signs_staged.add },
        change = { text = gitsigns_icons.signs_staged.change },
        delete = { text = gitsigns_icons.signs_staged.delete },
        topdelete = { text = gitsigns_icons.signs_staged.topdelete },
        changedelete = { text = gitsigns_icons.signs_staged.changedelete },
        untracked = { text = gitsigns_icons.signs_staged.untracked },
    },
    signs_staged_enable = true,
    signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
    numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
    linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
    word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
    watch_gitdir = {
        follow_files = true,
    },
    auto_attach = true,
    attach_to_untracked = false,
    current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
        delay = 1000,
        ignore_whitespace = false,
        virt_text_priority = 100,
        use_focus = true,
    },
    current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",
    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil, -- Use default
    max_file_length = 40000, -- Disable if file is longer than this (in lines)
    -- Used by :Gitsigns preview_hunk
    preview_config = {
        -- Options passed to nvim_open_win
        border = border_settings.kind,
        style = "minimal",
        relative = "cursor",
        row = 0,
        col = 1,
    },
}
