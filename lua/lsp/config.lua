local lsp_icons = require("lsp.icons")

local enable_native_virtual_text = true

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem = {
    documentationFormat = { "markdown", "plaintext" },
    snippetSupport = true,
    preselectSupport = true,
    insertReplaceSupport = true,
    labelDetailsSupport = true,
    deprecatedSupport = true,
    commitCharactersSupport = true,
    tagSupport = {
        valueSet = {
            1,
        },
    },
    resolveSupport = {
        properties = {
            "documentation",
            "detail",
            "additionalTextEdits",
        },
    },
}

return {
    capabilities = capabilities,
    hover_window_config = {
        title = string.format(" %s Info ", lsp_icons.info),
        border = BORDER_KIND,
        max_width = nil, -- TODO:
        max_height = nil,
    },
    --- @type vim.diagnostic.Opts
    diagnostic_config = {
        virtual_text = enable_native_virtual_text and {
            prefix = function(diagnostic)
                local vim_diagnostic = vim.diagnostic.severity
                local severity = diagnostic.severity
                if severity == vim_diagnostic.ERROR then
                    return " " .. lsp_icons.error
                elseif severity == vim_diagnostic.WARN then
                    return " " .. lsp_icons.warn
                elseif severity == vim_diagnostic.INFO then
                    return " " .. lsp_icons.info
                elseif severity == vim_diagnostic.HINT then
                    return " " .. lsp_icons.hint
                else
                    return lsp_icons.virtual_text.prefix
                end
            end,
        } or false,
        virtual_lines = false, -- cool feature maybe add later
        signs = {
            text = {
                [vim.diagnostic.severity.ERROR] = lsp_icons.error,
                [vim.diagnostic.severity.WARN] = lsp_icons.warn,
                [vim.diagnostic.severity.INFO] = lsp_icons.info,
                [vim.diagnostic.severity.HINT] = lsp_icons.hint,
            },
        },
        underline = true,
        float = {
            title = string.format(" %s Diagnostics ", lsp_icons.diagnostics),
            border = BORDER_KIND,
            header = " ",
            prefix = function(_, i, _)
                return " " .. i .. ": "
            end,
            suffix = function(diagnostic, i, total)
                local str = " "
                if diagnostic.code ~= nil then
                    str = " [" .. diagnostic.code .. "] "
                end
                if i == total then
                    str = str .. "\n   "
                end
                return str
            end,
            focusable = true,
            severity_sort = true,
        },
        severity_sort = true,
        update_in_insert = false,
    },
}
