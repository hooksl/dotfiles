return {
    -- Vscode-like pictograms
    {
        "onsails/lspkind.nvim",
        event = { "VimEnter" },
    },
    -- Auto-completion engine
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "lspkind.nvim",
            "hrsh7th/cmp-nvim-lsp", -- lsp auto-completion
            "hrsh7th/cmp-buffer",   -- buffer auto-completion
            "hrsh7th/cmp-path",     -- path auto-completion
            "hrsh7th/cmp-cmdline",  -- cmdline auto-completion
        },
        config = function()
            require("config.nvim-cmp")
        end,
    },
    -- Code snippet engine
    {
        "L3MON4D3/LuaSnip",
        'saadparwaiz1/cmp_luasnip',
    }
    -- 'neovim/nvim-lspconfig',
    -- 'hrsh7th/cmp-nvim-lsp',
    -- 'hrsh7th/cmp-buffer',
    -- 'hrsh7th/cmp-path',
    -- 'hrsh7th/cmp-cmdline',
    -- 'hrsh7th/nvim-cmp',
    --
    -- --For vsnip users.,-- 代码片段
    -- 'hrsh7th/cmp-vsnip',
    -- 'hrsh7th/vim-vsnip',
    --
    -- --For luasnip users.,
    -- 'L3MON4D3/LuaSnip',
    -- 'saadparwaiz1/cmp_luasnip',
    -- --
    -- -- --For ultisnips users.,
    -- -- 'SirVer/ultisnips',
    -- -- 'quangnguyen30192/cmp-nvim-ultisnips',
    -- --
    -- -- --For snippy users.,
    -- -- 'dcampos/nvim-snippy',
    -- -- 'dcampos/cmp-snippy',
}
