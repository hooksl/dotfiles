--require('lua.plugins')
--
---- 插件
--require('plugins.colorscheme')
--require('plugins.lualine')
--require('plugins.nvim-tree')
--require('plugins.nvim-web-devicons')
--require('plugins.telescope')
--require('plugins.Comment')
--require('plugins.indent-blankline')

--TODO:dssss
vim.g.mapleader = " "
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
    { import = "plugins" },
    { import = "plugins.lsp" }
})

-- require('config.options')
-- require('config.keymaps')
require('config')
-- local pkg = require('config')
-- pkg.info()
