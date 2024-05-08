return {
    'stevearc/aerial.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons"
    },
    config = function()
        require("aerial").setup({
            -- optionally use on_attach to set keymaps when aerial has attached to a buffer
            on_attach = function(bufnr)
                -- Jump forwards/backwards with '{' and '}'
                vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
                vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
            end,
            keymaps = {
                ["?"] = "actions.show_help",
                ["g?"] = "actions.show_help",
                ["<CR>"] = "actions.jump",
                ["<2-LeftMouse>"] = "actions.jump",
                ["<C-v>"] = "actions.jump_vsplit",
                ["<C-s>"] = "actions.jump_split",
                ["p"] = "actions.scroll",
                ["<C-j>"] = "actions.down_and_scroll",
                ["<C-k>"] = "actions.up_and_scroll",
                ["{"] = "actions.prev",
                ["}"] = "actions.next",
                ["[["] = "actions.prev_up",
                ["]]"] = "actions.next_up",
                ["q"] = "actions.close",
                ["o"] = "actions.tree_toggle",
                ["za"] = "actions.tree_toggle",
                ["O"] = "actions.tree_toggle_recursive",
                ["zA"] = "actions.tree_toggle_recursive",
                ["l"] = "actions.tree_open",
                ["zo"] = "actions.tree_open",
                ["L"] = "actions.tree_open_recursive",
                ["zO"] = "actions.tree_open_recursive",
                ["h"] = "actions.tree_close",
                ["zc"] = "actions.tree_close",
                ["H"] = "actions.tree_close_recursive",
                ["zC"] = "actions.tree_close_recursive",
                ["zr"] = "actions.tree_increase_fold_level",
                ["zR"] = "actions.tree_open_all",
                ["zm"] = "actions.tree_decrease_fold_level",
                ["zM"] = "actions.tree_close_all",
                ["zx"] = "actions.tree_sync_folds",
                ["zX"] = "actions.tree_sync_folds",
            },
            layout = {
                -- These control the width of the aerial window.
                -- They can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
                -- min_width and max_width can be a list of mixed types.
                -- max_width = {40, 0.2} means "the lesser of 40 columns or 20% of total"
                max_width = { 40, 0.2 },
                width = nil,
                min_width = 25,
                -- Use symbol tree for folding. Set to true or false to enable/disable
                -- Set to "auto" to manage folds if your previous foldmethod was 'manual'
                -- This can be a filetype map (see :help aerial-filetype-map)
                manage_folds = true,

                -- When you fold code with za, zo, or zc, update the aerial tree as well.
                -- Only works when manage_folds = true
                link_folds_to_tree = true,

                -- Fold code when you open/collapse symbols in the tree.
                -- Only works when manage_folds = true
                link_tree_to_folds = true,

                -- key-value pairs of window-local options for aerial window (e.g. winhl)
                win_opts = {},

                -- Determines the default direction to open the aerial window. The 'prefer'
                -- options will open the window in the other direction *if* there is a
                -- different buffer in the way of the preferred direction
                -- Enum: prefer_right, prefer_left, right, left, float
                default_direction = "prefer_right",

                -- Determines where the aerial window will be opened
                --   edge   - open aerial at the far right/left of the editor
                --   window - open aerial to the right/left of the current window
                placement = "window",

                -- When the symbols change, resize the aerial window (within min/max constraints) to fit
                resize_to_content = true,

                -- Preserve window size equality with (:help CTRL-W_=)
                preserve_equality = false,
            },
        })
        -- You probably also want to set a keymap to toggle aerial
        vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>")
    end,
}
