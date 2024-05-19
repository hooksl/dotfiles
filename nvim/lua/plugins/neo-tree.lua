return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    config = function()
        require("neo-tree").setup({
            -- close_if_last_window = false, -- Close Neo-tree if it is the last window left in the tab
            -- -- popup_border_style = "rounded",
            enable_git_status = false,
            enable_diagnostics = false,
            -- enable_normal_mode_for_inputs = false,                             -- Enable normal mode for input dialogs.
            -- open_files_do_not_replace_types = { "terminal", "trouble", "qf" }, -- when opening files, do not use windows containing these filetypes or buftypes
            -- sort_case_insensitive = false,                                     -- used when sorting files and directories in the tree
            -- sort_function = nil,                                               -- use a custom function for sorting files and directories in the tree
        })
        vim.api.nvim_set_keymap("n", "<leader>E", "<Cmd>Neotree toggle<CR>", { noremap = true, silent = true })
        vim.api.nvim_set_keymap("n", "<leader>e", "<Cmd>Neotree reveal<CR>", { noremap = true, silent = true })
    end
}
