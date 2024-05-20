return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        {
            's1n7ax/nvim-window-picker',
            version = '2.*',
            config = function()
                require 'window-picker'.setup({
                    filter_rules = {
                        include_current_win = false,
                        autoselect_one = true,
                        -- filter using buffer options
                        bo = {
                            -- if the file type is one of following, the window will be ignored
                            filetype = { 'neo-tree', "neo-tree-popup", "notify" },
                            -- if the buffer type is one of following, the window will be ignored
                            buftype = { 'terminal', "quickfix" },
                        },
                    },
                })
            end,
        },
    },
    config = function()
        require("neo-tree").setup({
            -- close_if_last_window = false, -- Close Neo-tree if it is the last window left in the tab
            popup_border_style = "rounded",
            enable_git_status = true,
            enable_diagnostics = false,
            enable_normal_mode_for_inputs = false, -- Enable normal mode for input dialogs.
            -- open_files_do_not_replace_types = { "terminal", "trouble", "qf" }, -- when opening files, do not use windows containing these filetypes or buftypes
            sort_case_insensitive = false,         -- used when sorting files and directories in the tree
            sort_function = nil,                   -- use a custom function for sorting files and directories in the tree
        })
        -- vim.api.nvim_set_hl(0, 'NeoTreeFloatTitle', { fg='#29a4bd', bg ='None' })
        vim.api.nvim_set_hl(0, 'NeoTreeFloatTitle', { bg ='None' })
        vim.api.nvim_set_keymap("n", "<leader>E", "<Cmd>Neotree toggle<CR>", { noremap = true, silent = true })
        vim.api.nvim_set_keymap("n", "<leader>e", "<Cmd>Neotree reveal<CR>", { noremap = true, silent = true })
    end
}
