vim.cmd [[


"代码折叠映射
" nnoremap <tab> za
" vnoremap <tab> zf

" 自动保存折叠
" augroup _saveview
" autocmd!
" autocmd BufWinLeave *.c, *.lua, *.sol mkview
" autocmd BufWinEnter *.c, *.lua, *.sol loadview
" " autocmd BufWinLeave,FileType c,lua,javascript,css,solidtiy,python,html silent mkview
" " autocmd BufWinEnter,FileType c,lua,javascript,css,solidtiy,python,html silent loadview
" augroup end

" 自动打开树
augroup _open_nvim_tree
autocmd! * <buffer>
autocmd sessionloadpost * NeoTreeReveal
augroup end

]]
-- 将文件设置为jsonc，才能显示注释
vim.cmd([[
augroup jsoncFtdetect
    autocmd!
    autocmd BufNewFile,BufRead *.json set filetype=jsonc
    autocmd BufNewFile,BufRead *.wxss set filetype=css
    autocmd BufNewFile,BufRead *.wxml set filetype=html
augroup END]])

-- Don't auto commenting new lines
-- 不要回车自动加注释
-- vim.api.nvim_create_autocmd("BufEnter", {
--     pattern = "",
--     command = "set fo-=c fo-=r fo-=o",
-- })

