return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
    config = function()
        -- LSP clients attached to buffer
        local clients_lsp = function()
            local bufnr = vim.api.nvim_get_current_buf()

            -- local clients = vim.lsp.buf_get_clients(bufnr)
            local clients = vim.lsp.get_clients(bufnr)
            if next(clients) == nil then
                return ''
                -- return 'no lsp'
            end

            local c = {}
            for _, client in pairs(clients) do
                table.insert(c, client.name)
            end
            return '\u{f085} ' .. table.concat(c, '|')
        end
        require('lualine').setup {
            options = {
                icons_enabled = true,
                theme = 'tokyonight',
                component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
                disabled_filetypes = {
                    statusline = { 'neo-tree' },
                    winbar = {},
                },
                ignore_focus = {},
                always_divide_middle = true,
                globalstatus = false,
                refresh = {
                    statusline = 1000,
                    tabline = 1000,
                    winbar = 1000,
                }
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = { 'branch', 'diff', 'diagnostics' },
                lualine_c = { 'filename' },
                lualine_x = {
                    -- { "diagnostics", sources = { "nvim_lsp" }, symbols = { error = " ", warn = " ", info = " ", hint = " " } },
                    "%S",
                    clients_lsp,
                    'encoding',
                    'fileformat',
                    'filetype',
                },
                lualine_y = { 'progress' },
                lualine_z = { 'location' }
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { 'filename' },
                lualine_x = { 'location' },
                lualine_y = {},
                lualine_z = {}
            },
            tabline = {},
            winbar = {},
            inactive_winbar = {},
            extensions = {}
        }
    end,
}
