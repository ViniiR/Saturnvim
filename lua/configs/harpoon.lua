local harpoon = require("harpoon")
local map = vim.keymap.set;

-- REQUIRED
harpoon:setup({})
-- REQUIRED

-- basic telescope configuration
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
            results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
    }):find()
end

map("n", "<M-e>", function() toggle_telescope(harpoon:list()) end, { desc = "Open harpoon window" })
map("n", "<leader>a", function() harpoon:list():add() end)
map("n", "<leader>x", function() harpoon:list():remove() end)

map("n", "<C-h>", function() harpoon:list():select(1) end)
map("n", "<C-j>", function() harpoon:list():select(2) end)
map("n", "<C-k>", function() harpoon:list():select(3) end)
map("n", "<C-l>", function() harpoon:list():select(4) end)
map("n", "<C-ç>", function() harpoon:list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
map("n", "<C-p>", function() harpoon:list():prev() end)
map("n", "<C-n>", function() harpoon:list():next() end)

