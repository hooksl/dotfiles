return {
    "luukvbaal/statuscol.nvim",
    enabled = true,
    dependencies = {
        "lewis6991/gitsigns.nvim",
    },
    config = function()
        local builtin = require("statuscol.builtin")
        vim.o.foldcolumn = '1' -- '0' is not bad
        vim.o.fillchars = [[foldopen:,foldsep: ,foldclose:,]]

        -- 不显示折叠行高亮
        vim.cmd([[
            augroup MyGroup
            autocmd ColorScheme * hi Folded ctermbg=15 guibg=None
            augroup END
        ]])

        require("statuscol").setup({
            -- configuration goes here, for example:
            relculright = true,
            ft_ignore = { "help", "neo-tree", "toggleterm" },
            segments = {
                {
                    sign = { name = { ".*" }, maxwidth = 1, colwidth = 1, auto = true, wrap = true },
                    click = "v:lua.ScSa"
                },
                {
                    sign = { namespace = { "diagnostic" }, maxwidth = 1,auto=false},
                    click = "v:lua.ScSa"
                },
                {
                    sign = { namespace = { 'gitsigns*' }, maxwidth = 1, colwidth = 2, auto = false },
                    click = 'v:lua.ScSa',
                },
                { text = { builtin.lnumfunc }, click = "v:lua.ScLa", },
                { text = { builtin.foldfunc," " }, click = "v:lua.ScFa" },
            }

            -- segments = {
            --     -- { sign = { name = { 'Dap' }, maxwidth = 1, auto = false }, click = 'v:lua.ScSa' },
            --     { sign = { name = { 'todo*' }, maxwidth = 1 } },
            --     {
            --         sign = { namespace = { 'diagnostic' }, maxwidth = 1, auto = false },
            --         click = 'v:lua.ScSa',
            --     },
            --     {
            --         sign = { namespace = { 'gitsigns*' }, maxwidth = 1, colwidth = 2, auto = false },
            --         click = 'v:lua.ScSa',
            --     },
            --     { text = { builtin.lnumfunc, ' ' }, click = 'v:lua.ScLa' },
            --     { text = { builtin.foldfunc, ' ' },  click = 'v:lua.ScFa' },
            -- },
        })
    end,
}
