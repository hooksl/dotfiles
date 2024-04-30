local on_attach = function(_, bufnr)
    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions

    local signs = {
        { name = "DiagnosticSignError", text = "" },
        { name = "DiagnosticSignWarn", text = "" },
        { name = "DiagnosticSignHint", text = "" },
        { name = "DiagnosticSignInfo", text = "" },
    }

    for _, sign in ipairs(signs) do
        vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
    end

    local config = {
        -- disable virtual text
        virtual_text = false,
        -- show signs
        signs = {
            active = signs,
        },
        update_in_insert = true,
        underline = true,
        severity_sort = true,
        float = {
            focusable = false,
            style = "minimal",
            border = "rounded",
            source = "always",
            header = "",
            prefix = "",
        },
    }
    vim.diagnostic.config(config)

    local opts = { noremap = true, silent = true, buffer = bufnr }
    local keymap = vim.keymap.set
    keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", opts)
    keymap({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
    keymap("n", "gr", "<cmd>Lspsaga rename<CR>", opts)
    keymap("n", "gp", "<cmd>Lspsaga peek_definition<CR>", opts)
    keymap("n", "gd", "<cmd>Lspsaga goto_definition<CR>", opts)
    keymap("n", "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
    keymap("n", "<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>", opts)
    keymap("n", "<leader>sw", "<cmd>Lspsaga show_workspace_diagnostics<CR>", opts)
    keymap("n", "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
    keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
    keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
    keymap("n", "<leader>o", "<cmd>Lspsaga outline<CR>", opts)
    keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
    keymap("n", "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>", opts)
    keymap("n", "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>", opts)
    keymap("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local lspconfig = require('lspconfig')
-- lsp server setting
local servers = {
    'lua_ls',
    -- 'cssls',
    -- -- 'emmet_ls', 'clangd', 'gopls', 'bashls',
    -- -- 'solidity_ls',
    -- 'pyright',
    -- -- 'solidity_ls_nomicfoundation',
    -- -- 'solang',
    -- 'tsserver',
    -- 'rome',
    -- 'solc',
    -- 'solidity',
    -- 'vue',
    -- 'vue_language_server',
    -- 'solc',
    'prettier'
}
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
        -- on_attach = require("config.handlers").on_attach,
        -- capabilities = require("config.handlers").capabilities,
    }
end
