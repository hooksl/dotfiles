return {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
        require('dashboard').setup {
            theme = 'hyper',
            config = {
                week_header = {
                    enable = true,
                },
                shortcut = {
                    { desc = '󰚰 Update', group = '@property', action = 'Lazy update', key = 'u' },
                    {
                        desc = ' Files',
                        group = '@label',
                        action = 'Telescope find_files',
                        key = 'f',
                    },
                    {
                        desc = ' Docker',
                        group = 'DiagnosticHint',
                        action = 'lua require("telescope.builtin").find_files({cwd="/hdd/work/docker/docker-compose/"})',
                        key = 'd',
                    },
                    {
                        desc = ' Nvim',
                        group = 'Number',
                        action = 'lua require("telescope.builtin").find_files({cwd="/hdd/work/dotfiles/nvim/"})',
                        key = 'n',
                    },
                },
                footer = {}, -- footer
            },
        }
    end,
    dependencies = { { 'nvim-tree/nvim-web-devicons' } }
};
