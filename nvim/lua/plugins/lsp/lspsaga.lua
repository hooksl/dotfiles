return {
    'nvimdev/lspsaga.nvim',
    dependencies = {
        'nvim-treesitter/nvim-treesitter', -- optional
        'nvim-tree/nvim-web-devicons',     -- optional
        "neovim/nvim-lspconfig",
    },
    config = function()
        require('lspsaga').setup({
            symbol_in_winbar = { -- 顶部条
                enable = false
            },
            outline = {
                auto_preview = false
            },
            lightbulb = {
                enable = false, -- 关闭灯塔
                enable_in_insert = true,
                sign = true,
                sign_priority = 40,
                virtual_text = true,
            },
            -- rename = {
            --     quit = "<C-c>",
            --     exec = "<CR>",
            --     mark = "x",
            --     confirm = "<CR>",
            --     in_select = true,
            -- },
            ui = {
                -- code_action =
            }
        })
    end,
}
