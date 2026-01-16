--NOTE: godot engine must be already on

local port = os.getenv("GDScript_Port") or "6005"
local cmd = vim.lsp.rpc.connect("127.0.0.1", tonumber(port))

--- @type vim.lsp.Config
return {
    cmd = cmd,
    filetypes = FILETYPES.godot,
    root_markers = { "project.godot", ".git" },
}
