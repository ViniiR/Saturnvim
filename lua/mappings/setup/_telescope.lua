local telescope_builtin = require("telescope.builtin")

local lib = require("mappings.lib")
local keys = lib.keys
local modes = lib.modes
local desc = lib.desc

local mappings = {
    {
        modes.normal,
        keys.leader("ff"),
        telescope_builtin.find_files,
        desc.desc("Telescope find files"),
    },
    {
        modes.normal,
        keys.leader("fw"),
        telescope_builtin.live_grep,
        desc.desc("Telescope live grep"),
    },
    {
        modes.normal,
        keys.leader("fb"),
        telescope_builtin.buffers,
        desc.desc("Telescope find open buffers"),
    },
    {
        -- clone of builtin.buffers for convenience
        modes.normal,
        keys.leader("bb"),
        telescope_builtin.buffers,
        desc.desc("Telescope find open buffers"),
    },
    {
        modes.normal,
        keys.leader("ft"),
        telescope_builtin.help_tags,
        desc.desc("Telescope help tags"),
    },
    {
        modes.normal,
        keys.leader("fh"),
        telescope_builtin.highlights,
        desc.desc("Telescope find highlights"),
    },
    {
        modes.normal,
        keys.leader("fa"),
        function() vim.cmd("Telescope find_files follow=true no_ignore=true hidden=true") end,
        desc.desc("Telescope find all files"),
    },
    {
        modes.normal,
        keys.leader("fk"),
        telescope_builtin.marks,
        desc.desc("Telescope find marks"),
    },
    {
        modes.normal,
        keys.leader("gc"),
        telescope_builtin.git_commits,
        desc.desc("Telescope git commits"),
    },
    {
        modes.normal,
        keys.leader("gs"),
        telescope_builtin.git_status,
        desc.desc("Telescope git status"),
    },
    {
        modes.normal,
        keys.leader("fg"), -- fz
        telescope_builtin.current_buffer_fuzzy_find,
        desc.desc("Telescope current buffer fuzzy find"),
    },
}
return function()
    for _, mapping in ipairs(mappings) do
        local mode = mapping[1]
        local lhs = mapping[2]
        local rhs = mapping[3]
        local opts = mapping[4]
        vim.keymap.set(mode, lhs, rhs, opts)
    end
end
