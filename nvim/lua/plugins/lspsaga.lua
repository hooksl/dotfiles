return {
    'nvimdev/lspsaga.nvim',
    config = function()
        require('lspsaga').setup({
            symbol_in_winbar = {    -- 顶部条
                enable = false
            },
            outline ={
                auto_preview = false
            }
        })
    end,
    dependencies = {
        'nvim-treesitter/nvim-treesitter', -- optional
        'nvim-tree/nvim-web-devicons',     -- optional
    }
}
