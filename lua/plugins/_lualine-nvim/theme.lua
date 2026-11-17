local lualine_theme = require("lualine.themes.onedark")

local main_bg_color = "#353f4b"
local main_fg_color = "#2095f7"

local secondary_bg_color = "#323942"
local secondary_fg_color = "#8f8d8d"

local lsp_fg_color = "#51db44"

lualine_theme.normal = {
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
local visual_fg = "#282c34"

lualine_theme.visual = {
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

local insert_fg = "#282c34"
local insert_bg = "#FFFFFF"

lualine_theme.insert = {
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

local command_fg = "#282c34"
local command_bg = "#e5c07b"

lualine_theme.command = {
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

return lualine_theme
