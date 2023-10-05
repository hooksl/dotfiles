return {
    "nvim-treesitter/nvim-treesitter",
    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })
    end,
    config = function()
        require 'nvim-treesitter.configs'.setup {
            ensure_installed = { "vim", "bash", "c", "cpp", "javascript", "json", "lua", "python", "rust", "solidity",
                "html", "css", "markdown", "markdown_inline", "regex" },
            highlight = { enable = true },
            indent = { enable = true },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<CR>", -- set to `false` to disable one of the mappings
                    node_incremental = "<CR>",
                    scope_incremental = "<TAB>",
                    node_decremental = "<BS>",
                },
            },

        }
    end,
}
