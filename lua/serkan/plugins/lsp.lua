local servers = { "lua_ls", "clangd", "gopls", "html", "ts_ls", }

return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "neovim/nvim-lspconfig" },
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            require("mason-lspconfig").setup({
                ensure_installed = servers,
                automatic_enable = false,
            })
            local on_attach = function(client, bufnr)
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = bufnr })
                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = bufnr })
                vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { buffer = bufnr })
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = bufnr })
                vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = bufnr })

                vim.keymap.set('n', 'ga', function()
                    vim.lsp.buf.code_action({
                        apply = true,
                        context = {
                            only = { 'quickfix' }
                        }
                    })
                end, { desc = "Run code action" })

                vim.keymap.set('n', 'gk', function()
                    vim.diagnostic.open_float({
                        focusable = false,
                        scope = "cursor",
                        close_events = { "CursorMoved", "CursorMovedI" }
                    })
                end, { desc = "Show diagnostic" })

            end

            for _, server in ipairs(servers) do
                local server_opts = {
                    capabilities = capabilities,
                    on_attach = on_attach,
                }
                lspconfig[server].setup(server_opts)
            end
        end
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "rafamadriz/friendly-snippets",
        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")

            require("luasnip.loaders.from_vscode").lazy_load()
            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
                    ["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                    ["<C-Space>"] = cmp.mapping.complete(),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "buffer" },
                    { name = "path" },
                }),
            })
        end
    },
}
