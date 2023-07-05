local T_git   = require('toggleterm.terminal').Terminal
local git_opt = T_git:new({
    cmd = 'lazygit',
    direction = 'float'
})

function git_toggle()
    git_opt:toggle()
end

vim.api.nvim_set_keymap("n", "<c-g>", "<Cmd>lua git_toggle()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<c-g>", "<Cmd>lua git_toggle()<CR>", { noremap = true, silent = true })


local T_ter   = require('toggleterm.terminal').Terminal
local ter_opt = T_ter:new({
    -- cmd = '',
    direction = 'float',
    -- function to run on opening the terminal
    on_open = function(term)
        vim.cmd("startinsert!")
        vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
        vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<esc>", [[<C-\><C-n>]], { noremap = true, silent = true })
    end,
    -- function to run on closing the terminal
    on_close = function(term)
        vim.cmd("startinsert!")
    end,

})

function ter_toggle()
    ter_opt:toggle()
end

vim.api.nvim_set_keymap("n", "<c-t>", "<Cmd>lua ter_toggle()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<c-t>", "<Cmd>lua ter_toggle()<CR>", { noremap = true, silent = true })

-- function _G.set_terminal_keymaps()
--     local opts = { buffer = 0 }
--     vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
-- end
--
-- -- if you only want these mappings for toggle term use term://*toggleterm#* instead
-- vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
