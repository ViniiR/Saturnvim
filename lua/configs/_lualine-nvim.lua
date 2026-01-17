local v_one_dark = require("lualine.themes.onedark")

local main_bg_color = "#353f4b"
local main_fg_color = "#2095f7"

local secondary_bg_color = "#323942"
local secondary_fg_color = "#8f8d8d"

local lsp_fg_color = "#51db44"

v_one_dark.normal = {
    a = {
        fg = main_fg_color,
        bg = main_bg_color,
    },
    b = {
        fg = secondary_fg_color,
        bg = secondary_bg_color,
    },
    c = {
        fg = "#FFFFFF",
        bg = secondary_bg_color,
    },
    x = {
        fg = lsp_fg_color,
        bg = secondary_bg_color,
    },
    y = {
        fg = secondary_fg_color,
        bg = secondary_bg_color,
    },
    z = {
        fg = "#2095f7",
        bg = "#353f4b",
    },
}
local visual_bg = "#61d14d"
local visual_fg = "282c34"

v_one_dark.visual = {
    a = {
        fg = visual_fg,
        bg = visual_bg,
    },
    b = {
        fg = secondary_fg_color,
        bg = secondary_bg_color,
    },
    c = {
        fg = secondary_fg_color,
        bg = secondary_bg_color,
    },
    x = {
        fg = lsp_fg_color,
        bg = secondary_bg_color,
    },
    y = {
        fg = secondary_fg_color,
        bg = secondary_bg_color,
    },
    z = {
        fg = visual_fg,
        bg = visual_bg,
    },
}

local insert_fg = "282c34"
local insert_bg = "#FFFFFF"

v_one_dark.insert = {
    a = {
        fg = insert_fg,
        bg = insert_bg,
    },
    b = {
        fg = secondary_fg_color,
        bg = secondary_bg_color,
    },
    c = {
        fg = secondary_fg_color,
        bg = secondary_bg_color,
    },
    x = {
        fg = lsp_fg_color,
        bg = secondary_bg_color,
    },
    y = {
        fg = secondary_fg_color,
        bg = secondary_bg_color,
    },
    z = {
        fg = insert_fg,
        bg = insert_bg,
    },
}

local command_fg = "282c34"
local command_bg = "e5c07b"

v_one_dark.command = {
    a = {
        fg = command_fg,
        bg = command_bg,
    },
    b = {
        fg = secondary_fg_color,
        bg = secondary_bg_color,
    },
    c = {
        fg = secondary_fg_color,
        bg = secondary_bg_color,
    },
    x = {
        fg = lsp_fg_color,
        bg = secondary_bg_color,
    },
    y = {
        fg = secondary_fg_color,
        bg = secondary_bg_color,
    },
    z = {
        fg = command_fg,
        bg = command_bg,
    },
}
require("lualine").setup({
    options = {
        icons_enabled = true,
        theme = v_one_dark,
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
            tabline = 100, -- TODO disable
            winbar = 1000, -- TODO disable
        },
    },
    sections = {
        lualine_a = {
            function()
                return VIM_MODE_MAP[vim.api.nvim_get_mode().mode] or "_?"
            end,
        },
        lualine_b = {
            { "branch", icon = GIT_ICONS.branch },
            {
                "diff",
                symbols = {
                    added = GIT_ICONS.added .. " ",
                    modified = GIT_ICONS.modified .. " ",
                    removed = GIT_ICONS.removed .. " ",
                },
            },
            -- { "diff", symbols = { added = " ", modified = " ", removed = " " } },
        },
        lualine_c = {
            { "filename", file_status = false },
            function()
                if vim.bo.modified then
                    -- syntax for inline highlights = "%#<hl_name>#"
                    return "%#CustomVLualineGreen#" .. LUALINE_ICONS.file_modified
                elseif vim.bo.modifiable == false or vim.bo.readonly == true then
                    return "%#CustomVLualineYellow#" .. LUALINE_ICONS.file_immutable
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
                    error = LSP_SYMBOLS.ERROR .. " ",
                    warn = LSP_SYMBOLS.WARN .. " ",
                    info = LSP_SYMBOLS.INFO .. " ",
                    hint = LSP_SYMBOLS.HINT .. " ",
                },
            },
            function()
                local has_lsp = vim.g.current_attached_lsp ~= nil and vim.g.current_attached_lsp ~= "No LSP"
                local str = ""

                local is_in_nix_shell = vim.env.IN_NIX_SHELL ~= nil

                -- Override the v_one_dark theme color if there is no LSP
                -- NOTE: lualine does not recompute v_one_dark after setup, so changing it at runtime does not modify the color
                if has_lsp then
                    str = string.format("%s %s", LUALINE_ICONS.lsp_server, vim.g.current_attached_lsp)
                    if is_in_nix_shell then
                        str = "%#CustomVLualineGreenLsp#" .. str
                    end
                else
                    str = "%#CustomVLualineLspRed#" .. string.format("%s %s", LUALINE_ICONS.lsp_server_fail, "None")
                end

                if is_in_nix_shell then
                    local icon = "󰊕"
                    if vim.env.IN_NIX_SHELL == "impure" then
                        icon = "!󰊕"
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
                return string.format("%s %s", LUALINE_ICONS.directory, vim.fn.fnamemodify(vim.fn.getcwd(), ":t"))
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
})

--["n"] = { "NORMAL", "Normal" },
--["no"] = { "NORMAL (no)", "Normal" },
--["nov"] = { "NORMAL (nov)", "Normal" },
--["noV"] = { "NORMAL (noV)", "Normal" },
--["noCTRL-V"] = { "NORMAL", "Normal" },
--["niI"] = { "NORMAL i", "Normal" },
--["niR"] = { "NORMAL r", "Normal" },
--["niV"] = { "NORMAL v", "Normal" },
--["nt"] = { "NTERMINAL", "NTerminal" },
--["ntT"] = { "NTERMINAL (ntT)", "NTerminal" },
--
--["v"] = { "VISUAL", "Visual" },
--["vs"] = { "V-CHAR (Ctrl O)", "Visual" },
--["V"] = { "V-LINE", "Visual" },
--["Vs"] = { "V-LINE", "Visual" },
--[""] = { "V-BLOCK", "Visual" },
--
--["i"] = { "INSERT", "Insert" },
--["ic"] = { "INSERT (completion)", "Insert" },
--["ix"] = { "INSERT completion", "Insert" },
--
--["t"] = { "TERMINAL", "Terminal" },
--
--["R"] = { "REPLACE", "Replace" },
--["Rc"] = { "REPLACE (Rc)", "Replace" },
--["Rx"] = { "REPLACEa (Rx)", "Replace" },
--["Rv"] = { "V-REPLACE", "Replace" },
--["Rvc"] = { "V-REPLACE (Rvc)", "Replace" },
--["Rvx"] = { "V-REPLACE (Rvx)", "Replace" },
--
--["s"] = { "SELECT", "Select" },
--["S"] = { "S-LINE", "Select" },
--[""] = { "S-BLOCK", "Select" },
--["c"] = { "COMMAND", "Command" },
--["cv"] = { "COMMAND", "Command" },
--["ce"] = { "COMMAND", "Command" },
--["cr"] = { "COMMAND", "Command" },
--["r"] = { "PROMPT", "Confirm" },
--["rm"] = { "MORE", "Confirm" },
--["r?"] = { "CONFIRM", "Confirm" },
--["x"] = { "CONFIRM", "Confirm" },
--["!"] = { "SHELL", "Terminal" },
-- local mode_map = {
--     --  
--     --  󰉖
--     ["n"] = " NORMAL",
--     ["no"] = " O-PENDING",
--     ["nov"] = " O-PENDING",
--     ["noV"] = " O-PENDING",
--     ["no�"] = " O-PENDING",
--     ["niI"] = " NORMAL",
--     ["niR"] = " NORMAL",
--     ["niV"] = " NORMAL",
--     ["nt"] = " NORMAL",
--     ["v"] = " VISUAL",
--     ["vs"] = " VISUAL",
--     ["V"] = " V-LINE",
--     ["Vs"] = " V-LINE",
--     ["�s"] = " V-BLOCK",
--     ["s"] = " SELECT",
--     ["S"] = " S-LINE",
--     ["�"] = " S-BLOCK",
--     ["i"] = " INSERT",
--     ["ic"] = " INSERT",
--     ["ix"] = " INSERT",
--     ["R"] = " REPLACE",
--     ["Rc"] = " REPLACE",
--     ["Rx"] = " REPLACE",
--     ["Rv"] = " V-REPLACE",
--     ["Rvc"] = " V-REPLACE",
--     ["Rvx"] = " V-REPLACE",
--     ["c"] = " COMMAND",
--     ["cv"] = " EX",
--     ["ce"] = " EX",
--     ["r"] = " REPLACE",
--     ["rm"] = " MORE",
--     ["r?"] = " CONFIRM",
--     ["!"] = " SHELL",
--     ["t"] = " TERMINAL",
-- }
