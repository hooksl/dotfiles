require('lazyvim')
require('my_plugins.floatwin').mappings()
require('options')
require('keymaps')
require("lsp_config")

vim.opt.runtimepath:append("/hdd/work/dotfiles/nvim/lua/my_plugins")
local pkg = require("fanyi")
vim.print(pkg.info)
-- pkg.setup({
--     color = "None",
-- })
