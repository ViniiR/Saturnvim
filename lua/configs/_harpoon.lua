-- ensure set before mappings
HARPOON_OPTS = {
    border = BORDER_KIND,
    title_pos = "left",
    title = string.format(" %s Harpoon ", HARPOON_ICON),
}

require("mappings.setup._harpoon")()

-- possibly deprecated
--
-- local harpoon = require("harpoon")
-- REQUIRED
-- harpoon:setup({
--     settings = {
--         border = BORDER_KIND,
--         display = {
--             title = "test",
--         },
--     },
-- })
-- REQUIRED

-- basic telescope configuration
-- local conf = require("telescope.config").values
-- local function toggle_telescope(harpoon_files)
--     local file_paths = {}
--     for _, item in ipairs(harpoon_files.items) do
--         table.insert(file_paths, item.value)
--     end
--
--     require("telescope.pickers").new({}, {
--         prompt_title = "Harpoon",
--         finder = require("telescope.finders").new_table({
--             results = file_paths,
--         }),
--         previewer = conf.file_previewer({}),
--         sorter = conf.generic_sorter({}),
--     }):find()
-- end
