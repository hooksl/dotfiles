-- vim.opt.termguicolors = true
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1
-- vim.opt.termguicolors = true
return {
    'akinsho/bufferline.nvim', 
    dependencies = 'nvim-tree/nvim-web-devicons',
    event = "VeryLazy",
    config = function()
        require("bufferline").setup({

            options = {

                diagnostics = "nvim_lsp",

                offsets = {{
                    filetype = "neo-tree",
                    text = "File Explorer",
                    highlight = "Directory",
                    text_align = "left",
                }},
                -- numbers = function(opts)
                --     return string.format('%s', opts.ordinal)
                -- end,
                -- separator_style = "slant"
            },
        })
    end,
}
