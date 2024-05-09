return {
    "kevinhwang91/nvim-ufo",
    dependencies = { 'kevinhwang91/promise-async' },
    enabled = false,
    config = function()
        -- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
        -- vim.opt.foldenable = false

        vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
        vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
        vim.api.nvim_set_keymap("n", "<TAB>", "za", { noremap = true, silent = true })

        local handler = function(virtText, lnum, endLnum, width, truncate)
            local newVirtText = {}
            local suffix = (' 󰇘 󰁂 %d '):format(endLnum - lnum)
            local sufWidth = vim.fn.strdisplaywidth(suffix)
            local targetWidth = width - sufWidth
            local curWidth = 0
            for _, chunk in ipairs(virtText) do
                local chunkText = chunk[1]
                local chunkWidth = vim.fn.strdisplaywidth(chunkText)
                if targetWidth > curWidth + chunkWidth then
                    table.insert(newVirtText, chunk)
                else
                    chunkText = truncate(chunkText, targetWidth - curWidth)
                    local hlGroup = chunk[2]
                    table.insert(newVirtText, { chunkText, hlGroup })
                    chunkWidth = vim.fn.strdisplaywidth(chunkText)
                    -- str width returned from truncate() may less than 2nd argument, need padding
                    if curWidth + chunkWidth < targetWidth then
                        suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
                    end
                    break
                end
                curWidth = curWidth + chunkWidth
            end
            table.insert(newVirtText, { suffix, 'MoreMsg' })
            return newVirtText
        end
        -- Option 2: nvim lsp as LSP client
        -- Tell the server the capability of foldingRange,
        -- Neovim hasn't added foldingRange to default capabilities, users must add it manually
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities.textDocument.foldingRange = {
            dynamicRegistration = false,
            lineFoldingOnly = true
        }
        local language_servers = require("lspconfig").util.available_servers() -- or list servers manually like {'gopls', 'clangd'}
        for _, ls in ipairs(language_servers) do
            require('lspconfig')[ls].setup({
                capabilities = capabilities
                -- you can add other fields for setting up lsp server in this table
            })
        end
        -- require('ufo').setup({
        --     fold_virt_text_handler = handler,
        -- })

        --
        -- Option 3: treesitter as a main provider instead
        -- (Note: the `nvim-treesitter` plugin is *not* needed.)
        -- ufo uses the same query files for folding (queries/<lang>/folds.scm)
        -- performance and stability are better than `foldmethod=nvim_treesitter#foldexpr()`
        require('ufo').setup({
            provider_selector = function(bufnr, filetype, buftype)
                return { 'treesitter', 'indent' }
            end,
            fold_virt_text_handler = handler,
        })
    end
}
