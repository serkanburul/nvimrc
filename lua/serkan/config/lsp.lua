vim.lsp.enable({
    "lua_ls",
    "gopls",
    "clangd"
})

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("my.lua", {}),
    callback = function(args)
        opts = { buffer = args.buf, silent = true }
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'grn', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', 'ga', function()
            vim.lsp.buf.code_action({
                apply = true,
                context = { only = { 'quickfix' } }
            })
        end)
        vim.keymap.set('n', 'gk', function()
            vim.diagnostic.open_float({
                focusable = false, scope = "cursor",
                close_events = { "CursorMoved", "CursorMovedI" }
            })
        end)
    end,
})

vim.lsp.inlay_hint.enable(true)
