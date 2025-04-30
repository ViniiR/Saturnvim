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

local sign = vim.fn.sign_define

sign("DapBreakpoint", {
    text = DAP_SYMBOLS.DAP_BREAKPOINT,
    texthl = "DapBreakpoint",
})
sign("DapBreakpointCondition", {
    text = DAP_SYMBOLS.DAP_BREAKPOINT_CONDITION,
    texthl = "DapBreakpointCondition",
})
sign("DapLogPoint", {
    text = DAP_SYMBOLS.DAP_LOG_POINT,
    texthl = "DapLogPoint",
})
sign("DapStopped", {
    text = DAP_SYMBOLS.DAP_STOPPED,
    texthl = "DapStopped",
})
sign("DapBreakpointRejected", {
    text = DAP_SYMBOLS.DAP_BREAKPOINT_REJECTED,
    texthl = "DapBreakpointRejected",
})

require("mappings.setup._dap")()
