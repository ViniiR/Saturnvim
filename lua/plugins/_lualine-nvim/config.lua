local lualine_theme = require("plugins._lualine-nvim.theme")
local modes_map = require("plugins._lualine-nvim.modes_map")
local lualine_icons = require("plugins._lualine-nvim.icons")
local lsp_icons = require("lsp.icons")

return {
    options = {
        icons_enabled = true,
        theme = lualine_theme,
        -- █
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
            "NvimTree",
            -- statusline = {},
            -- winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 100,
            tabline = 100, -- TODO: disable
            winbar = 1000, -- TODO: disable
        },
    },
    sections = {
        lualine_a = {
            function()
                local mode = vim.api.nvim_get_mode().mode
                return modes_map[mode] or modes_map.unknown
            end,
        },
        lualine_b = {
            { "branch", icon = lualine_icons.git.branch },
            {
                "diff",
                symbols = {
                    added = lualine_icons.git.added .. " ",
                    modified = lualine_icons.git.modified .. " ",
                    removed = lualine_icons.git.removed .. " ",
                },
            },
            -- { "diff", symbols = { added = " ", modified = " ", removed = " " } },
        },
        lualine_c = {
            { "filename", file_status = false },
            function()
                if vim.bo.modified then
                    -- syntax for inline highlights = "%#<hl_name>#"
                    return "%#CustomVLualineGreen#" .. lualine_icons.file.modified
                elseif vim.bo.modifiable == false or vim.bo.readonly == true then
                    return "%#CustomVLualineYellow#" .. lualine_icons.file.immutable
                else
                    return ""
                end
            end,
            { "filetype", icon_only = true },
            -- "searchcount",
        },
        lualine_x = {
            {
                "diagnostics",
                symbols = {
                    error = lsp_icons.severity.error .. " ",
                    warn = lsp_icons.severity.warn .. " ",
                    info = lsp_icons.severity.info .. " ",
                    hint = lsp_icons.severity.hint .. " ",
                },
            },
            function()
                local has_lsp = vim.g.current_attached_lsp ~= nil and vim.g.current_attached_lsp ~= "No LSP"
                local str = ""

                local is_in_nix_shell = vim.env.IN_NIX_SHELL ~= nil

                -- Override the lualine_theme theme color if there is no LSP
                -- NOTE: lualine does not recompute lualine_theme after setup, so changing it at runtime does not modify the color
                if has_lsp then
                    str = string.format("%s %s", lualine_icons.lsp.server, vim.g.current_attached_lsp)
                    if is_in_nix_shell then
                        str = "%#CustomVLualineGreenLsp#" .. str
                    end
                else
                    str = "%#CustomVLualineLspRed#" .. string.format("%s %s", lualine_icons.lsp.server_fail, "None")
                end

                if is_in_nix_shell then
                    local icon = lualine_icons.nix.pure
                    if vim.env.IN_NIX_SHELL == "impure" then
                        icon = lualine_icons.nix.impure
                    end

                    str = "%#CustomVNix#" .. icon .. "  " .. str
                end

                return str
            end,
        },
        lualine_y = {
            -- "encoding",
            "fileformat",
            function()
                local tablen = vim.bo.tabstop
                if string.len(tablen) == 0 then
                    return ""
                end
                return string.format("Tabs: %d,", tablen)
            end,
            function()
                return string.format("Ln %2d, Col %2d", vim.fn.line("."), vim.fn.charcol("."))
            end,
        },
        lualine_z = {
            function()
                return string.format("%s %s", lualine_icons.file.directory, vim.fn.fnamemodify(vim.fn.getcwd(), ":t"))
            end,
        },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
    },
    tabline = {
        -- lualine_a = {
        --     "buffers",
        -- },
    },
    winbar = {},
    inactive_winbar = {},
    extensions = {},
}
