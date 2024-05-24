return {
    "nvim-treesitter/nvim-treesitter",
    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })
    end,
    config = function()
        require 'nvim-treesitter.configs'.setup {
            ensure_installed = { "vue",
                "html",
                "css",
                "vim",
                "bash",
                "c",
                "cpp",
                "json",
                "lua",
                "python",
                "rust",
                "solidity",
                "markdown",
                "markdown_inline",
                "javascript",
                "typescript",
                "vimdoc",
                "comment",
                "regex",
                "tsx"
            },
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false
            },
            -- -- indent = { enable = true },
            -- -- fold={
            -- --     enable =true,
            -- --     foldmethod = "expr",
            -- --     foldexpr='nvim_treesitter#foldexpr()'
            -- -- },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<CR>", -- set to `false` to disable one of the mappings
                    node_incremental = "<CR>",
                    -- scope_incremental = "<CR>",
                    node_decremental = "<BS>",
                },
            },
        }
    end,
}
