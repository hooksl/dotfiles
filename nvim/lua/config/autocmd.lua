vim.cmd [[

augroup _format autocmd!
autocmd!
autocmd BufWritePre * normal! magg=G`a
augroup end

"代码折叠映射
nnoremap <tab> za 
vnoremap <tab> zf

" 自动保存折叠
augroup _saveview autocmd!
autocmd!
autocmd BufWinLeave FileType c,lua,javascript,css,solidtiy,python :mkview<cr>
autocmd bufwinenter FileType c,lua,javascript,css,solidtiy,python :silent loadview<cr> 
augroup end

]]

