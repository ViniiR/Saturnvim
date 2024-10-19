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

local mode_map = {
    --  
    --  󰉖
    ["n"] = " NORMAL",
    ["no"] = " O-PENDING",
    ["nov"] = " O-PENDING",
    ["noV"] = " O-PENDING",
    ["no�"] = " O-PENDING",
    ["niI"] = " NORMAL",
    ["niR"] = " NORMAL",
    ["niV"] = " NORMAL",
    ["nt"] = " NORMAL",
    ["v"] = " VISUAL",
    ["vs"] = " VISUAL",
    ["V"] = " V-LINE",
    ["Vs"] = " V-LINE",
    ["�s"] = " V-BLOCK",
    ["s"] = " SELECT",
    ["S"] = " S-LINE",
    ["�"] = " S-BLOCK",
    ["i"] = " INSERT",
    ["ic"] = " INSERT",
    ["ix"] = " INSERT",
    ["R"] = " REPLACE",
    ["Rc"] = " REPLACE",
    ["Rx"] = " REPLACE",
    ["Rv"] = " V-REPLACE",
    ["Rvc"] = " V-REPLACE",
    ["Rvx"] = " V-REPLACE",
    ["c"] = " COMMAND",
    ["cv"] = " EX",
    ["ce"] = " EX",
    ["r"] = " REPLACE",
    ["rm"] = " MORE",
    ["r?"] = " CONFIRM",
    ["!"] = " SHELL",
    ["t"] = " TERMINAL",
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
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        },
    },
    sections = {
        lualine_a = { function() return mode_map[vim.api.nvim_get_mode().mode] or "__" end },
        lualine_b = { "branch", "diff" },
        lualine_c = { "filename", { "filetype", icon_only = true } },
        lualine_x = {
            "diagnostics",
            function() return "󰒋 " .. vim.g.current_attached_lsp end,
        },
        lualine_y = {
            "encoding",
            "fileformat",
            function()
                local tablen = vim.bo.tabstop
                if string.len(tablen) == 0 then return "" end
                return "Tabs: " .. tablen .. ","
            end,
            function() return "Ln " .. vim.fn.line(".") .. ", " .. "Col " .. vim.fn.charcol(".") end,
        },
        lualine_z = {
            function() return "󰉖 " .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t") end,
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
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {},
})
