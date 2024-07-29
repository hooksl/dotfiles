return {
    'akinsho/bufferline.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        require("bufferline").setup({
            highlights = {
                fill = {
                    -- bg = {
                    --     attribute = "#202334",
                    --     highlight = "#202334"
                    -- }
                    bg = "#1b1e2b"
                },
                -- separator = { bg = "#62b3b2" },
                -- separator_selected = { fg = "cyan", bg = "#142832" },
                -- separator_visible = { bg = "cyan" },
            },
            options = {
                diagnostics = "nvim_lsp",
                offsets = { {
                    filetype = "neo-tree",
                    text = "File Explorer",
                    highlight = "Directory",
                    text_align = "left",
                } },
                -- numbers = function(opts)
                --     return string.format('%s', opts.ordinal)
                -- end,
                -- slant padded_slant slope padded_slope thick
                separator_style ={"",""}
            },
        })
        local opts = {
            noremap = true, -- non-recursive
            silent = true,  -- do not show message
        }
        vim.keymap.set('n', 'q', ':BufferLineCyclePrev<CR>:bd #<CR>', opts)
        vim.keymap.set('n', '<leader>bp', ':BufferLineTogglePin<CR>', opts)
        vim.keymap.set('n', '<leader>bdl', ':BufferLineCloseRight<CR>', opts)
        vim.keymap.set('n', '<leader>bdh', ':BufferLineCloseLeft<CR>', opts)
        vim.keymap.set('n', '<leader><leader>', ':BufferLinePick<CR>', opts)
        vim.keymap.set('n', '<leader>bdd', ':BufferLineCloseOthers<CR>', opts)
        -- vim.keymap.set('n', '<leader>h', ':bp<cr>', opts)
        -- vim.keymap.set('n', '<leader>l', ':bn<cr>', opts)

        vim.keymap.set('n', '<leader>1', ':BufferLineGoToBuffer 1<CR>', opts)
        vim.keymap.set('n', '<leader>2', ':BufferLineGoToBuffer 2<CR>', opts)
        vim.keymap.set('n', '<leader>3', ':BufferLineGoToBuffer 3<CR>', opts)
        vim.keymap.set('n', '<leader>4', ':BufferLineGoToBuffer 4<CR>', opts)
        vim.keymap.set('n', '<leader>5', ':BufferLineGoToBuffer 5<CR>', opts)
        vim.keymap.set('n', '<leader>6', ':BufferLineGoToBuffer 6<CR>', opts)
        vim.keymap.set('n', '<leader>7', ':BufferLineGoToBuffer 7<CR>', opts)
        vim.keymap.set('n', '<leader>8', ':BufferLineGoToBuffer 8<CR>', opts)
        vim.keymap.set('n', '<leader>9', ':BufferLineGoToBuffer 9<CR>', opts)
        vim.keymap.set('n', '<leader>$', ':BufferLineGoToBuffer -1<CR>', opts)
    end,
}
