-- Setup language servers.
local lspconfig = require('lspconfig')
-- local vue_language_server_path = '/path/to/@vue/language-server'
-- local mason_registry = require('mason-registry')
-- local vue_language_server_path = mason_registry.get_package('vue-language-server'):get_install_path() ..
--     '/node_modules/@vue/language-server'
-- lspconfig.pyright.setup {}
-- lspconfig.tsserver.setup {
--     -- init_options = {
--     --     plugins = {
--     --         {
--     --             name = '@vue/typescript-plugin',
--     --             location = vue_language_server_path,
--     --             languages = { 'vue' },
--     --         },
--     --     },
--     -- },
--     -- filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
-- }
-- -- lspconfig.volar.setup {}
-- lspconfig.lua_ls.setup {}
-- -- lspconfig.vue_language_server.setup {}
-- -- lspconfig.rome.setup {}
-- -- lspconfig.rome.setup {}
-- -- lspconfig.solc.setup {}
-- lspconfig.html.setup {}
-- lspconfig.cssls.setup {}
-- -- lspconfig.solidity_ls.setup {}
-- lspconfig.prettier.setup {}
-- require 'lspconfig'.html.setup {}
-- require 'lspconfig'.solidity_ls.setup {}
-- require 'lspconfig'.cssls.setup {}
require 'lspconfig'.prettier.setup {}

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set('n', '<space>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<space>f', function()
            vim.lsp.buf.format { async = true }
        end, opts)
    end,
})
