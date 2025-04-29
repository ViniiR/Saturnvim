local dap = require("dap")
local dapui = require("dapui")

-- dap should work by default with rustaceanvim
-- vscode-extensions.vadimcn.vscode-lldb.adapter
-- dap.adapters.lldb = {
--     type = "executable",
--     command = "/etc/profiles/per-user/vinii/bin/rust-lldb", -- adjust as needed, must be absolute path
--     name = "lldb",
-- }
-- dap.configurations.rust = {
--     {
--         name = "Launch",
--         type = "lldb",
--         request = "launch",
--         program = function() return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file") end,
--         cwd = "${workspaceFolder}",
--         stopOnEntry = false,
--         args = {},
--     },
-- }

dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end

-- `DapBreakpoint` for breakpoints (default: `B`)
vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DapBreakpoint", linehl = "", numhl = "" })
-- `DapBreakpointCondition` for conditional breakpoints (default: `C`)
vim.fn.sign_define("DapBreakpointCondition", {
    text = "",
    texthl = "DapBreakpointCondition",
    linehl = "",
    numhl = "",
})
-- `DapLogPoint` for log points (default: `L`)
vim.fn.sign_define("DapLogPoint", { text = "", texthl = "DapLogPoint", linehl = "", numhl = "" })
-- `DapStopped` to indicate where the debugee is stopped (default: `→`)
vim.fn.sign_define("DapStopped", { text = "󰓛", texthl = "DapStopped", linehl = "", numhl = "" })
-- `DapBreakpointRejected` to indicate breakpoints rejected by the debug adapter (default: `R`)
vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "DapBreakpointRejected", linehl = "", numhl = "" })

local maps = require("mappings2")
maps:setup_dap()

-- vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, {
--     desc = "Debugger toggle breakpoint",
--     noremap = true,
--     silent = true,
-- })
-- vim.keymap.set("n", "<leader>dc", dap.continue, {
--     desc = "Debugger continue",
--     noremap = true,
--     silent = true,
-- })
-- vim.keymap.set("n", "<leader>dx", dap.clear_breakpoints, {
--     desc = "Debugger clear breakpoints",
--     noremap = true,
--     silent = true,
-- })
