-- NOTE: name is used to create the nvim highlights

-- Setup override does not create new icons
return {
    override = {
        i3conf = {
            icon = "",
            name = "i3conf",
            color = "#e06c75",
        },
    },
    override_by_extension = {
        js = {
            icon = "",
            name = "Js",
            color = "#f0db4f",
        },
        ts = {
            icon = "",
            name = "Ts",
            color = "#3178c6",
        },
        lua = {
            icon = "",
            name = "Lua",
            color = "#51A0CF", -- The official logo color looks weird on small icons
        },
        nix = {
            icon = "󱄅",
            name = "Nix",
            color = "#77b6e1",
        },
        -- json = {
        --     icon = "",
        --     name = "Json",
        --     color = "#f0db4f",
        -- },
    },
    override_by_filename = {
        ["README.md"] = {
            icon = "",
            name = "CustomReadme",
            color = "#58b1b6",
        },
        ["LICENSE"] = {
            icon = "󰿃",
            name = "CustomLicense",
            color = "#fc5722",
        },
        ["init.lua"] = {
            icon = "",
            name = "InitLua",
            color = "#6f51cf",
        },
        ["default.nix"] = {
            icon = "󱄅",
            name = "DefaultNix",
            color = "#4d6fb7",
        },
        ["flake.nix"] = {
            icon = "󱄅",
            name = "FlakeNix",
            color = "#7e62ef",
        },
    },
}

-- Old highlights, not sure if they're needed or not
-- has conflicts with set colors up above
--
-- highlights["DevIconc"] = { fg = theme.colors.blue }
-- highlights["DevIconcss"] = { fg = theme.colors.blue }
-- highlights["DevIcondeb"] = { fg = theme.colors.cyan }
-- highlights["DevIconDockerfile"] = { fg = theme.colors.cyan }
-- highlights["DevIconhtml"] = { fg = theme.colors.baby_pink }
-- highlights["DevIconjpeg"] = { fg = theme.colors.dark_purple }
-- highlights["DevIconjpg"] = { fg = theme.colors.dark_purple }
-- highlights["DevIconjs"] = { fg = theme.colors.sun }
-- highlights["DevIconkt"] = { fg = theme.colors.orange }
-- highlights["DevIconlock"] = { fg = theme.colors.red }
-- highlights["DevIconlua"] = { fg = theme.colors.blue }
-- highlights["DevIconmp3"] = { fg = theme.colors.white }
-- highlights["DevIconmp4"] = { fg = theme.colors.white }
-- highlights["DevIconout"] = { fg = theme.colors.white }
-- highlights["DevIconpng"] = { fg = theme.colors.dark_purple }
-- highlights["DevIconpy"] = { fg = theme.colors.cyan }
-- highlights["DevIcontoml"] = { fg = theme.colors.blue }
-- highlights["DevIconts"] = { fg = theme.colors.teal }
-- highlights["DevIconttf"] = { fg = theme.colors.white }
-- highlights["DevIconrb"] = { fg = theme.colors.pink }
-- highlights["DevIconrpm"] = { fg = theme.colors.orange }
-- highlights["DevIconvue"] = { fg = theme.colors.vibrant_green }
-- highlights["DevIconwoff"] = { fg = theme.colors.white }
-- highlights["DevIconwoff2"] = { fg = theme.colors.white }
-- highlights["DevIconxz"] = { fg = theme.colors.sun }
-- highlights["DevIconzip"] = { fg = theme.colors.sun }
-- highlights["DevIconZig"] = { fg = theme.colors.orange }
-- highlights["DevIconMd"] = { fg = theme.colors.blue }
-- highlights["DevIconTSX"] = { fg = theme.colors.ts_fg }
-- highlights["DevIconJSX"] = { fg = theme.colors.blue }
-- highlights["DevIconSvelte"] = { fg = theme.colors.red }
-- highlights["DevIconJava"] = { fg = theme.colors.orange }
-- highlights["DevIconDart"] = { fg = theme.colors.cyan }
