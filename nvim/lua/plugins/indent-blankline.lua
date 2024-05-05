return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
    config = function()
        require("ibl").setup {
            indent = {
                char = "▏",
            },
            scope = {
                -- 关掉函数上的横线
                enabled = false
            }
            -- for example, context is off by default, use this to turn it on
            -- show_current_context = true,
            -- show_current_context_start = true,
        }
    end,
}
