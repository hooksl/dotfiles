return {
    -- Auto-completion engine
    "hrsh7th/nvim-cmp",
    dependencies = {
        -- "lspkind.nvim",
        -- Vscode-like pictograms
        {
            "onsails/lspkind.nvim",
            event = { "VimEnter" },
        },
        -- Code snippet engine
        {
            "L3MON4D3/LuaSnip",
            'saadparwaiz1/cmp_luasnip',
            "rafamadriz/friendly-snippets", --代码段合集
            "f3fora/cmp-spell",             --nvim-cmp 的拼写源基于 vim 的拼写建议
        },
        "hrsh7th/cmp-nvim-lsp",             -- lsp auto-completion
        "hrsh7th/cmp-buffer",               -- buffer auto-completion
        "hrsh7th/cmp-path",                 -- path auto-completion
        "hrsh7th/cmp-cmdline",              -- cmdline auto-completion
    },
    config = function()
        local has_words_before = function()
            unpack = unpack or table.unpack
            local line, col = unpack(vim.api.nvim_win_get_cursor(0))
            return col ~= 0 and
                vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
        end

        vim.opt.spell = true
        vim.opt.spelllang = { "en_us" }
        local luasnip = require("luasnip")
        local cmp = require("cmp")
        local lspkind = require("lspkind")
        -- load vscode snippet (friendly-snippet)
        require("luasnip.loaders.from_vscode").lazy_load()

        cmp.setup({
            snippet = {
                -- REQUIRED - you must specify a snippet engine
                expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                end,
            },
            -- 自动选中第一项
            completion = {
                completeopt = 'menu,menuone,noinsert', -- sudgeseted in issue #209
            },
            window = {
                completion = cmp.config.window.bordered({
                }),
                documentation = cmp.config.window.bordered({
                }),
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                ['<C-d>'] = cmp.mapping.scroll_docs(4),
                -- ['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
                -- ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
                ['<esc>'] = cmp.mapping({
                    i = cmp.mapping.abort(),
                    c = cmp.mapping.close(),
                }),
                -- Use <C-k/j> to switch in items
                -- ['<C-k>'] = cmp.mapping.select_prev_item(),
                -- ['<C-j>'] = cmp.mapping.select_next_item(),
                -- Use <CR>(Enter) to confirm selection
                -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                ['<CR>'] = cmp.mapping.confirm({ select = true }),

                -- A super tab
                -- sourc: https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings#luasnip
                ["<Tab>"] = cmp.mapping(function(fallback)
                    -- Hint: if the completion menu is visible select next one
                    -- cmp.complete() 弹出补全
                    if cmp.visible() then
                        cmp.select_next_item()
                        -- elseif has_words_before() then
                        --     cmp.complete()
                    elseif luasnip.jumpable(1) then
                        luasnip.jump(1)
                    else
                        fallback()
                    end
                end, { "i", "s" }), -- i - insert mode; s - select mode
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            }),

            -- Let's configure the item's appearance
            -- source: https://github.com/hrsh7th/nvim-cmp/wiki/Menu-Appearance
            formatting = {
                format = lspkind.cmp_format({
                    with_text = true,         -- do not show text alongside icons
                    maxwidth = 50,            -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
                    maxheight = 10,
                    ellipsis_char = '...',    -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
                    show_labelDetails = true, -- show labelDetails in menu. Disabled by default

                    before = function(entry, vim_item)
                        -- Source 显示提示来源
                        vim_item.menu = "[" .. string.upper(entry.source.name) .. "]"
                        return vim_item
                    end
                })
            },

            -- Set source precedence
            sources = cmp.config.sources({
                    { name = 'luasnip' }, -- 优先使用luasnip，没有匹配到的话才用下面的源
                },
                {
                    -- { name = 'nvim_lsp', keyword_length = 2 },
                    { name = 'nvim_lsp' },
                    {
                        name = 'buffer',
                        option = {
                            get_bufnrs = function()
                                return vim.api.nvim_list_bufs()
                            end
                        }
                    },
                    { name = 'path' },
                    {
                        name = "spell",
                        option = {
                            keep_all_entries = false,
                            enable_in_context = function()
                                return true
                            end,
                            preselect_correct_word = true,
                        },
                    },
                })
        })
        cmp.setup.cmdline({ '/', '?' }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = 'buffer' }
            },
        })
        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = 'path' }
            }, {
                { name = 'cmdline' }
            }),
        })
    end
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

    -- config = function()
    --     require("config.nvim-cmp")
    -- end,
}
