return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
    config = function()
        require("ibl").setup {
            indent = {
                -- char = { "┊" },
                char = { " ", "┊", "┊", "┊", "┊" },
                -- tab_char = { "a", "b", "c", "d", "e" },
            },
            scope = {
                -- 关掉函数上的横线
                enabled = false,
            },
            whitespace = {
                -- highlight = { "Function", "Label" },
                highlight = { "Function" },
                remove_blankline_trail = true,
            },
        }
        -- 特定文件类型不显示缩进线
        require "ibl".overwrite {
            exclude = {
                filetypes = {
                    "dashboard",
                    "help",
                }
            }
        }
    end,
}
