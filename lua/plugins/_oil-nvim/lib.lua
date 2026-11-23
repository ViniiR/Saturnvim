local oil_columns = require("oil.columns")
local constants = require("oil.constants")

local original_icon = oil_columns.get_column(nil, "icon")

---@type { [string]: { hl_name: string?, hl_color: {}?, icon: string? } }
local directories = {
    [".."] = {
        hl_name = "OilParentDir",
        hl_color = {
            fg = "#546e7a",
        },
        icon = "",
    },
    [".git"] = {
        hl_name = "OilGitDir",
        hl_color = {
            fg = "#ff7043",
        },
    },
    -- Dev
    ["src"] = {
        hl_name = "OilSrcDir",
        hl_color = {
            fg = "#4caf50",
        },
    },
    ["assets"] = {
        hl_name = "OilAssetsDir",
        hl_color = {
            fg = "#ef5350",
        },
    },
    ["style"] = {
        hl_name = "OilStyleDir",
        hl_color = {
            fg = "#ab47bc",
        },
    },
    ["ui"] = {
        hl_name = "OilUiDir",
        hl_color = {
            fg = "#ab47bc",
        },
    },
    ["components"] = {
        hl_name = "OilComponentsDir",
        hl_color = {
            fg = "#c0ca33",
        },
    },
    --
    ["lib"] = {
        hl_name = "OilLibDir",
        hl_color = {
            fg = "#a9bacd",
        },
    },
    ["include"] = {
        hl_name = "OilIncludeDir",
        hl_color = {
            fg = "#039be5",
        },
    },
    --
    ["test"] = {
        hl_name = "OilTestDir",
        hl_color = {
            fg = "#ff9800",
        },
    },
    ["build"] = {
        hl_name = "OilBuildDir",
        hl_color = {
            fg = "#8d6e63",
        },
    },
    ["target"] = {
        hl_name = "OilTargetDir",
        hl_color = {
            fg = "#ffc107",
        },
    },
    ["plugins"] = {
        hl_name = "OilPluginsDir",
        hl_color = {
            fg = "#5b6abf",
        },
    },
    ["addons"] = {
        hl_name = "OilAddonsDir",
        hl_color = {
            fg = "#5b6abf",
        },
    },
    --
    -- Misc
    ["nvim"] = {
        hl_name = "OilNvimDir",
        hl_color = {
            fg = "#7bb662",
        },
    },
    ["lua"] = {
        hl_name = "OilLuaDir",
        hl_color = {
            fg = "#7e57c2",
        },
    },
}
for _, value in pairs(directories) do
    if value.hl_name and value.hl_color then
        vim.api.nvim_set_hl(0, value.hl_name, value.hl_color)
    end
end

local m = {}

function m.render_custom_dir_icons()
    oil_columns.register("icon", {
        render = function(entry, conf, bufnr)
            local chunk = original_icon.render(entry, conf, bufnr)
            if type(chunk) ~= "table" then
                return chunk
            end

            ---@type string
            local name = entry[constants.FIELD_NAME]
            local field_type = entry[constants.FIELD_TYPE]
            local meta = entry[constants.FIELD_META]

            if field_type == "link" and meta and meta.link_stat then
                field_type = meta.link_stat.type
            end

            if field_type == "directory" then
                local override = directories[name]
                if override == nil then
                    goto quit
                end

                if override.hl_name and override.hl_color then
                    chunk[2] = override.hl_name
                end
                if override.icon then
                    chunk[1] = override.icon .. " "
                end
            end
            ::quit::

            return chunk
        end,
        parse = original_icon.parse,
    })
end

return m
