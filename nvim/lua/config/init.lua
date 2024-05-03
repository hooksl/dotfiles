-- local M = {}
--
-- function M.info()
--     vim.print('hello!')
-- end
-- return M

-- local pkg = require('initf')
-- pkg.info()
-- return {}
require('config.options')
require('config.keymaps')
require('config.lsp')
require('config.nvim-cmp')
require('config.autocmd')
require('config.toggleterm')
require('config.floatwin').mappings()
require('config.colorscheme')

vim.opt.laststatus = 3
