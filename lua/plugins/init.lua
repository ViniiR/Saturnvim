--- @class LazyCustom
--- @field branch? string | "master" | "main"
--- @field version? string | boolean | "*"

-- INFO: consult https://lazy.folke.io/spec

--- @type LazySpec[]
local spec = {}

local exclude_plugins = {
    -- Just to be sure :)
    ["_lazy-nvim"] = true,
    ["init.lua"] = true,
    --
    ["_nvim-dap"] = true,
}

local plugins_path = vim.fn.stdpath("config") .. "/lua/plugins"
for name, type in vim.fs.dir(plugins_path) do
    if exclude_plugins[name] or type ~= "directory" then
        goto continue
    end
    local item = require("plugins." .. name)
    table.insert(spec, item)

    ::continue::
end

-- NOTE: auto loaded by lua/plugins/_lazy-nvim.lua
return spec
