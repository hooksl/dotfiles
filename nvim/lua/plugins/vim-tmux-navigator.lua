return {
    "christoomey/vim-tmux-navigator",
    config = function()
        local opts = {
            noremap = true, -- non-recursive
            silent = true, -- do not show message
        }
        vim.keymap.set('n', '<C-h>', ':<C-U>TmuxNavigateLeft<cr>', opts)
        vim.keymap.set('n', '<C-j>', ':<C-U>TmuxNavigateDown<cr>', opts)
        vim.keymap.set('n', '<C-k>', ':<C-U>TmuxNavigateUp<cr>', opts)
        vim.keymap.set('n', '<C-l>', ':<C-U>TmuxNavigateRight<cr>', opts)
        -- vim.keymap.set('n', '<C-w>', ':<C-U>TmuxNavigatePrevious<cr>', opts)
    end
}
