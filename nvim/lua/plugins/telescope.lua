return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.7',
    -- or                              , branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local actions = require("telescope.actions")
        require("telescope").setup {
            defaults = {
                mappings = {
                    i = {
                        ["<esc>"] = actions.close,
                        ["<C-j>"] = {
                            actions.move_selection_next, type = "action",
                            opts = { nowait = true, silent = true }
                        },
                        ["<C-k>"] = {
                            actions.move_selection_previous, type = "action",
                            opts = { nowait = true, silent = true }
                        },

                    },
                },
            }
        }
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
    end
}
