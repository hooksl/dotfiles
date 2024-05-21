-- 自动完成html标签闭合
return {
    "windwp/nvim-ts-autotag",
    -- dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
        require('nvim-ts-autotag').setup()
    end
}
