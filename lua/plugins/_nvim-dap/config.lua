-- WARNING:
-- any issues with the config check on Lazar Nikolov's video
local dap = require("dap")
local dapui = require("dapui")

local dap_icons = require("plugins._nvim-dap.icons")

-- dap should work by default with rustaceanvim
-- vscode-extensions.vadimcn.vscode-lldb.adapter
-- dap.adapters = {
    -- ["lldb"] = {
    --     type = "executable",
    --     command = "/etc/profiles/per-user/vinii/bin/rust-lldb", -- adjust as needed, must be absolute path
    --     name = "lldb",
    -- },
    -- ["pwa-node"] = {
    --     type = "server",
    --     host = "localhost",
    --     port = 8279,
    --     executable = {
    --         command = "js-debug",
    --         args = {
    --             "--server=8279",
    --         },
    --     },
    -- },
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

dap.configurations.javascript = {
    {
        -- Debug single nodejs file
        name = "Launch File",
        type = "pwa-node",
        request = "launch",
        program = "${file}",
        cwd = "${workspaceFolder}",
        sourceMaps = true,
    },
    -- {
    --     -- Debug nodejs processes
    --     name = "Attach",
    --     type = "pwa-node",
    --     request = "attach",
    --     program = "${file}",
    --     cwd = "${workspaceFolder}",
    --     sourceMaps = true,
    --     processId = require("dap.utils").pick_process,
    -- },
    {
        -- Debug web application (frontend)
        name = "Launch & Debug Chrome",
        type = "pwa-chrome",
        request = "launch",
        program = "${file}",
        cwd = "${workspaceFolder}",
        sourceMaps = true,
        webRoot = "${workspaceFolder}",
        skipFiles = { "<node_internals>/**/*.js" },
        protocol = "inspector",
        useDataDir = true,
        url = function()
            local co = coroutine.running()
            return coroutine.create(function()
                vim.ui.input({
                    prompt = "Enter URL: ",
                    default = "http://localhost:5000",
                }, function(url)
                    if url == nil or url == "" then
                        return
                    else
                        coroutine.resume(co, url)
                    end
                end)
            end)
        end,
    },
}
dap.configurations.typescript = dap.configurations.javascript
dap.configurations.javascriptreact = dap.configurations.javascript
dap.configurations.typescriptreact = dap.configurations.javascript
dap.configurations.vue = dap.configurations.javascript

dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end

local sign = vim.fn.sign_define

sign("DapBreakpoint", {
    text = dap_icons.breakpoint,
    texthl = "DapBreakpoint",
})
sign("DapBreakpointCondition", {
    text = dap_icons.breakpoint_condition,
    texthl = "DapBreakpointCondition",
})
sign("DapLogPoint", {
    text = dap_icons.log_point,
    texthl = "DapLogPoint",
})
sign("DapStopped", {
    text = dap_icons.stopped,
    texthl = "DapStopped",
})
sign("DapBreakpointRejected", {
    text = dap_icons.breakpoint_rejected,
    texthl = "DapBreakpointRejected",
})

require("plugins._nvim-dap.mappings"):setup()
