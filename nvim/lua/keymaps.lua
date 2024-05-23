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

-- tab
vim.keymap.set('n', 'tn', '<cmd>tabn<CR>', opts)
vim.keymap.set('n', 'tp', '<cmd>tabp<CR>', opts)
vim.keymap.set('n', 'tc', '<cmd>tabc<CR>', opts)

-- save
vim.keymap.set('n', '<c-s>', '<cmd>w<CR>', opts)
vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function(args)
        vim.lsp.buf.format({ async = false })
    end,
})

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
vim.keymap.set('n', '<c-w>', '<cmd>buffer #<cr>', opts)
vim.keymap.set('n', 'n', '<cmd>set hlsearch<cr>n', opts)
vim.keymap.set('n', 'N', '<cmd>set hlsearch<cr>N', opts)
vim.keymap.set('n', '/', '<cmd>set hlsearch<cr>/', { silent = false })
vim.keymap.set('n', '?', '<cmd>set hlsearch<cr>?', { silent = false })
vim.keymap.set('n', '<leader>w', '*<cmd>set hlsearch<cr>', opts)
vim.keymap.set('n', '<esc>', '<cmd>nohl<cr>', opts)

vim.cmd([[
set nohlsearch

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
