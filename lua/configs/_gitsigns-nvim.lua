require("gitsigns").setup({
    signs = {
        add = { text = GIT_SIGNS.add },
        change = { text = GIT_SIGNS.change },
        delete = { text = GIT_SIGNS.delete },
        topdelete = { text = GIT_SIGNS.topdelete },
        changedelete = { text = GIT_SIGNS.changedelete },
        untracked = { text = GIT_SIGNS.untracked },
    },
    signs_staged = {
        add = { text = GIT_SIGNS_STAGED.add },
        change = { text = GIT_SIGNS_STAGED.change },
        delete = { text = GIT_SIGNS_STAGED.delete },
        topdelete = { text = GIT_SIGNS_STAGED.topdelete },
        changedelete = { text = GIT_SIGNS_STAGED.changedelete },
        untracked = { text = GIT_SIGNS_STAGED.untracked },
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
    preview_config = {
        -- Options passed to nvim_open_win
        -- TODO: whats this
        border = "single",
        style = "minimal",
        relative = "cursor",
        row = 0,
        col = 1,
    },
})
require("mappings.setup._gitsigns")()
