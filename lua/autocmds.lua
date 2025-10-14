local autocmd = vim.api.nvim_create_autocmd

autocmd("LspAttach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client == nil then
            return
        end

        if client then
            vim.g.current_attached_lsp = client.name or "No LSP"
        end

        -- disable semantic tokens? (possibly unnecessary)
        -- if client == "rust_analyzer" then client.server_capabilities.semanticTokensProvider = nil end
    end,
})

autocmd("BufEnter", {
    callback = function ()
        -- Overrides gdscript.vim's use of Tabs instead of Spaces
        if vim.bo.filetype == "gdscript" then
            vim.defer_fn(function()
                vim.opt.expandtab = true
            end, 10)
        end
    end
})
-- TODO: possibly doesn't work in rust
-- seems to use too much cpu
-- autocmd("LspAttach", {
--     pattern = "*",
--     callback = function(_)
--         vim.keymap.set("n", "<leader>lo", function()
--             local filetype = vim.bo.filetype
--             local is_ecma = filetype == "typescript"
--                 or filetype == "typescriptreact"
--                 or filetype == "javascript"
--                 or filetype == "javascriptreact"
--             local is_rust = filetype == "rust"
--
--             if is_ecma then
--                 vim.lsp.buf.execute_command({
--                     command = "_typescript.organizeImports",
--                     arguments = { vim.api.nvim_buf_get_name(0) },
--                 })
--             elseif is_rust then
--                 vim.lsp.buf.code_action({
--                     context = { diagnostics = {}, only = { "source.organizeImports" } },
--                     apply = true,
--                 })
--             end
--         end, { desc = "LSP Organize imports", silent = true, noremap = true })
--     end,
-- })
