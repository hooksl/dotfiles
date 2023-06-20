return {
    'lewis6991/gitsigns.nvim',
    config = function()
        require("gitsigns").setup({

            signs = {

                add = { text = '+' },
                change = { text = '~' },
                delete = { text = '_' },
                topdelet = { text = '='},
                changeddelete = { text = '~' },
            },
        })
    end,
}
