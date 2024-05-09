-- Hint: use `:h <option>` to figure out the meaning if needed
-- bufferline
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- 外观
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"

vim.opt.clipboard = 'unnamedplus' -- use system clipboard
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
vim.opt.mouse = 'a'               -- allow the mouse to be used in Nvim

-- Tab
vim.opt.tabstop = 4      -- number of visual spaces per TAB
vim.opt.softtabstop = 4  -- number of spacesin tab when editing
vim.opt.shiftwidth = 4   -- insert 4 spaces on a tab
vim.opt.expandtab = true -- tabs are spaces, mainly because of python

-- UI config
-- 显示左侧图标指示列
vim.opt.number = true         -- show absolute number
vim.opt.relativenumber = true -- add numbers to each line on the left side
vim.opt.cursorline = true     -- highlight cursor line underneath the cursor horizontally
vim.opt.splitbelow = false    -- open new vertical split bottom
vim.opt.splitright = false    -- open new horizontal splits right
-- vim.opt.showmode = false      -- we are experienced, wo don't need the "-- INSERT --" mode hint
--vim.opt.nowrap = true
vim.wo.wrap = false
-- Searching
vim.opt.incsearch = true  -- search as characters are entered
vim.opt.hlsearch = false  -- do not highlight matches
vim.opt.ignorecase = true -- ignore case in searches by default
vim.opt.smartcase = true  -- but make it case sensitive if an uppercase is entered

-- TODO:命令行高为0时，普通模式下输入的命令被隐藏了，需要移到状态栏中显示
vim.opt.cmdheight = 1

-- vim.cmd([[ set nofoldenable]])
-- folding
-- vim.opt.foldenable = true
-- vim.opt.foldmethod = 'expr'
-- vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
-- vim.opt.foldlevel = 99

-- vim.cmd([[ set nofoldenable]])
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
-- vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
-- vim.o.foldlevelstart = 99
