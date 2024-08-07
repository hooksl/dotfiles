return {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
        require('toggleterm').setup {
            -- open_mapping = [[<c-g>]],
            -- 打开新终端后自动进入插入模式
            -- start_in_insert = true,
            -- 在当前buffer的下方打开新终端
            -- direction = 'float',
            float_opts = {
                -- 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
                border = 'curved', -- 边框
                -- width = 200,
                -- height = 100,
                -- winblend = 1, -- 透明度
                -- zindex = 80,
            },
            shade_terminals = false
        }
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


        local T_ter    = require('toggleterm.terminal').Terminal
        local ter_opt  = T_ter:new({
            -- dir = "git_dir",
            -- autochdir = true, -- when neovim changes it current directory the terminal will change it's own when next it's opened

            -- cmd = "echo %",
            -- direction = 'horizontal',
            -- function to run on opening the terminal
            on_open = function(term)
                -- vim.cmd("startinsert!")
                vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
                vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<esc>", [[<C-\><C-n>]], { noremap = true, silent = true })
                vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<C-h>", [[<Cmd>wincmd h<CR>]],
                    { noremap = true, silent = true })
                vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<C-j>", [[<Cmd>wincmd j<CR>]],
                    { noremap = true, silent = true })
                vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<C-k>", [[<Cmd>wincmd k<CR>]],
                    { noremap = true, silent = true })
                vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<C-l>", [[<Cmd>wincmd h<CR>]],
                    { noremap = true, silent = true })
                -- vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<C-w>", [[<C-\><C-n><C-w>]], { noremap = true, silent = true })
            end,
            -- function to run on closing the terminal
            on_close = function(term)
                -- vim.cmd("startinsert!")
            end,

        })

        local T_ter1   = require('toggleterm.terminal').Terminal
        local ter_opt1 = T_ter1:new({
            -- dir = "git_dir",
            -- autochdir = true, -- when neovim changes it current directory the terminal will change it's own when next it's opened

            -- cmd = "echo %",
            -- direction = 'horizontal',
            -- function to run on opening the terminal
            on_open = function(term)
                -- vim.cmd("startinsert!")
                vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
                vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<esc>", [[<C-\><C-n>]], { noremap = true, silent = true })
                vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<C-h>", [[<Cmd>wincmd h<CR>]],
                    { noremap = true, silent = true })
                vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<C-j>", [[<Cmd>wincmd j<CR>]],
                    { noremap = true, silent = true })
                vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<C-k>", [[<Cmd>wincmd k<CR>]],
                    { noremap = true, silent = true })
                vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<C-l>", [[<Cmd>wincmd h<CR>]],
                    { noremap = true, silent = true })
                -- vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<C-w>", [[<C-\><C-n><C-w>]], { noremap = true, silent = true })
            end,
            -- function to run on closing the terminal
            on_close = function(term)
                -- vim.cmd("startinsert!")
            end,

        })
        function ter_toggle()
            ter_opt:toggle()
        end

        function ter_toggle1()
            ter_opt1:toggle()
        end

        vim.api.nvim_set_keymap("n", "<c-t>", "<Cmd>lua ter_toggle()<CR>", { noremap = true, silent = true })
        vim.api.nvim_set_keymap("t", "<c-t>", "<Cmd>lua ter_toggle()<CR>", { noremap = true, silent = true })

        vim.api.nvim_set_keymap("n", "<c-f>", "<Cmd>lua ter_toggle1()<CR>", { noremap = true, silent = true })
        vim.api.nvim_set_keymap("t", "<c-f>", "<Cmd>lua ter_toggle1()<CR>", { noremap = true, silent = true })
    end,
}
