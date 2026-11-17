return {
    'nvim-telescope/telescope.nvim',
    version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    config = function()
        local builtin = require("telescope.builtin")

--      "-" for Parent Dir
        local telescope = require("telescope")
        local actions = require("telescope.actions")
        local action_state = require("telescope.actions.state")
        local function goto_parent_dir(prompt_bufnr)
            local current_picker = action_state.get_current_picker(prompt_bufnr)
            local cwd = current_picker.cwd or vim.loop.cwd()
            local parent_dir = vim.fn.fnamemodify(cwd, ":h")

            if parent_dir == cwd then
                return
            end

            actions.close(prompt_bufnr)
            builtin.find_files({
                cwd = parent_dir,
                prompt_title = "Find Files (" .. vim.fn.fnamemodify(parent_dir, ":t") .. ")",
            })
        end
--      done

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
                        ["<C-v>"] = false,

                        ["-"] = goto_parent_dir,
                    }
                }
            }
        })
    end
}
