local enable_native_virtual_text = true
local x = vim.diagnostic.severity

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
        title = string.format(" %s Info ", INFO_ICON),
        border = BORDER_KIND,
        max_width = nil, -- TODO
        max_height = nil,
    },
    --- @type vim.diagnostic.Opts
    diagnostic_config = {
        virtual_text = enable_native_virtual_text and {
            prefix = function(diagnostic)
                local vim_diagnostic = vim.diagnostic.severity
                local severity = diagnostic.severity
                if severity == vim_diagnostic.ERROR then
                    return " " .. LSP_SYMBOLS.ERROR
                elseif severity == vim_diagnostic.WARN then
                    return " " .. LSP_SYMBOLS.WARN
                elseif severity == vim_diagnostic.INFO then
                    return " " .. LSP_SYMBOLS.INFO
                elseif severity == vim_diagnostic.HINT then
                    return " " .. LSP_SYMBOLS.HINT
                else
                    return VIRTUAL_TEXT_PREFIX
                end
            end,
        } or false,
        virtual_lines = false, -- cool feature maybe add later
        signs = {
            text = {
                [x.ERROR] = LSP_SYMBOLS.ERROR,
                [x.WARN] = LSP_SYMBOLS.WARN,
                [x.INFO] = LSP_SYMBOLS.INFO,
                [x.HINT] = LSP_SYMBOLS.HINT,
            },
        },
        underline = true,
        float = {
            title = string.format(" %s Diagnostics ", DIAGNOSTICS_ICON),
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
