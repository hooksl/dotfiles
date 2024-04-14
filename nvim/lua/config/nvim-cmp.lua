local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
    return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
    return
end

require("luasnip.loaders.from_vscode").lazy_load()

-- 下面会用到这个函数
local check_backspace = function()
    local col = vim.fn.col "." - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

cmp.setup({
    formatting = {
        fields = { 'abbr', 'kind', 'menu' },
        format = function(entry, item)
            local menu_icon = {
                nvim_lsp = '[nvim_lsp]',
                luasnip = '[luasnip]',
                buffer = '[buffer]',
                path = '[path]',
            }
            item.menu = menu_icon[entry.source.name]

            local kind_icon = {
                Text = "󰉿",
                Method = "󰆧",
                Function = "󰊕",
                Constructor = "",
                Field = "",
                Variable = "󰀫",
                Class = "󰠱",
                Interface = "",
                Module = "",
                Property = " ",
                Unit = "󰑭",
                Value = "󰎠",
                Enum = "",
                Keyword = "󰌋",
                Snippet = "",
                Color = "󰏘",
                File = "󰈙",
                Reference = "󰈇",
                Folder = "󰉋",
                EnumMember = "",
                Constant = "󰏿",
                Struct = "󰙅",
                Event = "",
                Operator = "󰆕",
                TypeParameter = "",
            }
            item.kind = kind_icon[item.kind]
            -- item.kind = kind_icon[item.kind] .. ' ' .. item.kind
            return item
        end,
    },
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    experimental = {
        ghost_text = true,
        native_menu = false,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-e>'] = cmp.mapping.abort(), -- 取消补全，esc也可以退出
        ['<CR>'] = cmp.mapping.confirm({ select = true }),

        ["<Tab>"] = cmp.mapping(
            function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif luasnip.expandable() then
                    luasnip.expand()
                elseif luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                elseif check_backspace() then
                    fallback()
                else
                    fallback()
                end
            end,
            { "i", "s", }),

        ["<S-Tab>"] = cmp.mapping(
            function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                end
            end,
            { "i", "s", }),
    }),
    sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            -- { name = 'vsnip' }, -- For vsnip users.
            -- { name = 'luasnip' }, -- For luasnip users. 暂时不用，太多提示
            -- { name = 'ultisnips' }, -- For ultisnips users.
            -- { name = 'snippy' }, -- For snippy users.
        },
        {
            { name = 'buffer' },
            { name = 'path' },
        })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    },
    formatting = {
        fields = { 'abbr', 'kind', 'menu' },
        format = function(entry, item)
            local menu_icon = {
                buffer = '[buffer]',
            }

            item.menu = menu_icon[entry.source.name]
            local kind_icon = {
                Text = "󰉿",
                Method = "󰆧",
                Function = "󰊕",
                Constructor = "",
                Field = " ",
                Variable = "󰀫",
                Class = "󰠱",
                Interface = "",
                Module = "",
                Property = " ",
                Unit = "󰑭",
                Value = "󰎠",
                Enum = "",
                Keyword = "󰌋",
                Snippet = " ",
                Color = "󰏘",
                File = "󰈙",
                Reference = "󰈇",
                Folder = "󰉋",
                EnumMember = "",
                Constant = "󰏿",
                Struct = "󰙅",
                Event = "",
                Operator = "󰆕",
                TypeParameter = "",
            }
            item.kind = kind_icon[item.kind] .. ' ' .. item.kind

            return item
        end,
    },

})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    }),
    formatting = {
        fields = { 'abbr', 'kind', 'menu' },
        format = function(entry, item)
            local menu_icon = {
                path = '[path]',
                cmdline = '[cmd]'
            }

            item.menu = menu_icon[entry.source.name]
            local kind_icon = {
                Text = "󰉿",
                Method = "󰆧",
                Function = "󰊕",
                Constructor = "",
                Field = " ",
                Variable = "󰀫",
                Class = "󰠱",
                Interface = "",
                Module = "",
                Property = " ",
                Unit = "󰑭",
                Value = "󰎠",
                Enum = "",
                Keyword = "󰌋",
                Snippet = " ",
                Color = "󰏘",
                File = "󰈙",
                Reference = "󰈇",
                Folder = "󰉋",
                EnumMember = "",
                Constant = "󰏿",
                Struct = "󰙅",
                Event = "",
                Operator = "󰆕",
                TypeParameter = "",
            }
            item.kind = kind_icon[item.kind] .. ' ' .. item.kind

            return item
        end,
    },
})
