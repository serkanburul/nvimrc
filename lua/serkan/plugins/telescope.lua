return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.9',
    dependencies = {
        'nvim-lua/plenary.nvim'
    },
    config = function()
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>fn', builtin.find_files, { desc = 'Telescope find files' })
        vim.keymap.set('n', '<leader>fl', builtin.live_grep, { desc = 'Telescope live grep' })
        vim.keymap.set('n', '<leader>fs', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)
        vim.keymap.set('n', '<leader>fr', builtin.registers, { desc = 'Telescope registers' })
        vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

        require("telescope").setup({
            defaults = {
                mappings = {
                    n = {
                        ["t"] = require("telescope.actions").select_tab,
                        ["v"] = require("telescope.actions").file_vsplit,
                        ["<C-t>"] = false,
                        ["<C-v>"] = false
                    }
                }
            }
        })
    end,
}
