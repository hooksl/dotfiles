return {
    "nvim-treesitter/nvim-treesitter",
    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })
    end,
    config = function()
        require 'nvim-treesitter.configs'.setup {
            ensure_installed = { "vue", "html", "css",
                "vim", "bash", "c", "cpp",
                "json", "lua", "python", "rust", "solidity",
                "markdown", "markdown_inline",
                "javascript", "typescript"
            },
            -- ensure_installed = {},
            highlight = { enable = true },
            indent = { enable = true },
            -- incremental_selection = {
            --     enable = true,
            --     keymaps = {
            --         init_selection = "<TAB>", -- set to `false` to disable one of the mappings
            --         node_incremental = "<TAB>",
            --         scope_incremental = "<CR>",
            --         node_decremental = "<BS>",
            --     },
            -- },

        }
    end,
}
