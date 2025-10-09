return {
    "nvim-tree/nvim-tree.lua",
    config = function()
        require("nvim-tree").setup({
            actions = {
                change_dir = {
                    enable = true,
                    global = false,
                    restrict_above_cwd = true,
                },
                open_file = { quit_on_open = true }
            },
            on_attach = function (bufnr)
                local api = require "nvim-tree.api"
                local function opts(desc)
                    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
                end
                api.config.mappings.default_on_attach(bufnr)
                vim.keymap.set('n', '<C-t>',api.tree.change_root_to_parent,        opts('Up'))
                vim.keymap.set('n', 't',    api.node.open.tab_drop,                opts("Open: New Tab"))
                vim.keymap.set('n', '?',    api.tree.toggle_help,                  opts('Help'))
            end,
            hijack_netrw = false,
            open_on_tab = false,
            view = {
                width = 30,
                side = "right",
            },
            renderer = {
                icons = {
                    glyphs = {
                        folder = {
                            arrow_closed= "▶",
                            arrow_open  = "▼",
                        }
                    },
                    show = {
                        file = false,
                        folder = false,
                    },
                },
            },
        })
        vim.keymap.set("n", "<leader>t", ":NvimTreeToggle<CR>", { silent = true, noremap = true })
    end
}
