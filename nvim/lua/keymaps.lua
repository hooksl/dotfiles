-- define common options
local opts = {
    noremap = true, -- non-recursive
    silent = true,  -- do not show message
}

-- Normal mode --
-----------------
-- Hint: see `:h vim.map.set()`
-- Better window navigation
vim.keymap.set('i', '<C-h>', '<Left>', opts)
vim.keymap.set('i', '<C-j>', '<Down>', opts)
vim.keymap.set('i', '<C-k>', '<Up>', opts)
vim.keymap.set('i', '<C-l>', '<Right>', opts)

-- Resize with arrows
-- delta: 2 lines
vim.keymap.set('n', '<c-Down>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<c-Up>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<c-Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<c-Right>', ':vertical resize +2<CR>', opts)

-- exit
-- save
-- TODO:opts属性silent=true noice会报错
vim.keymap.set('n', '<c-s>', ':w<CR>')

-- 刷新文件
vim.keymap.set('n', 'R', ':e!<CR>', opts)
-- 切换窗口
vim.keymap.set('n', '<c-x>', '<c-w>x', opts)
-- buffers
vim.keymap.set('n', '<leader>h', ':bp<cr>', opts)
vim.keymap.set('n', '<leader>l', ':bn<cr>', opts)
-- 移除lsp里面的映射，加速切换c-w
vim.cmd([[
unmap <c-w><c-d>
unmap <c-w>d
]])
vim.keymap.set('n', '<c-w>', ':buffer #<cr>', opts)

vim.cmd([[
set nohlsearch
nnoremap <silent> <esc> :nohl<cr>
noremap <silent> n :set hlsearch<cr>n
noremap <silent> N :set hlsearch<cr>N
noremap / :set hlsearch<cr>/
noremap ? :set hlsearch<cr>?
" noremap <silent> * *:set hlsearch<cr>
noremap <silent> <leader>w *:set hlsearch<cr>

nnoremap <expr><leader>r Sh()

function! Sh()
let wordUnderCursor =  expand("<cword>")
set hlsearch
" return ":%s/" .. wordUnderCursor .. "/"
return ":%s/" .. wordUnderCursor

endfunc
]])


vim.keymap.set('v', 'u', '<esc>', opts)
vim.keymap.set('n', '<c-q>', ':q<cr>', opts)
vim.keymap.set('n', '<leader>q', ':qa<cr>', opts)
vim.keymap.set({ 'n', 'v', 'o' }, 'H', '^', opts)
vim.keymap.set({ 'n', 'v', 'o' }, 'L', '$', opts)

-- Hint: start visual mode with the same area as the previous area and the same mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)


--格式化
vim.keymap.set('n', '<leader>=', 'mwggvG=`w', opts)

vim.keymap.set('v', 'v', 'vggVG', opts)
