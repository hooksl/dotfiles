-- 布局窗口
return {
    "folke/edgy.nvim",
    event = "VeryLazy",
    opts = {
        bottom = {
            -- toggleterm / lazyterm at the bottom with a height of 40% of the screen
            {
                ft = "toggleterm",
                size = { height = 0.3 },
                -- exclude floating windows
                filter = function(buf, win)
                    return vim.api.nvim_win_get_config(win).relative == ""
                end,
            },
            "Trouble",
            { ft = "qf",            title = "QuickFix" },
            {
                ft = "help",
                size = { height = 20 },
                -- only show help buffers
                filter = function(buf)
                    return vim.bo[buf].buftype == "help"
                end,
            },
            { ft = "spectre_panel", size = { height = 0.4 } },
        },
        left = {
            -- Neo-tree filesystem always takes half the screen height
            {
                title = "Neo-Tree",
                ft = "neo-tree",
                filter = function(buf)
                    return vim.b[buf].neo_tree_source == "filesystem"
                end,
                size = { height = 0.5 },
            },
            -- {
            --     title = "Neo-Tree Git",
            --     ft = "neo-tree",
            --     filter = function(buf)
            --         return vim.b[buf].neo_tree_source == "git_status"
            --     end,
            --     pinned = true,
            --     open = "Neotree position=right git_status",
            -- },
            -- any other neo-tree windows
            "neo-tree",
        },
        -- edgebar animations
        animate = {
            enabled = false,
            fps = 100, -- frames per second
            cps = 120, -- cells per second
            on_begin = function()
                vim.g.minianimate_disable = true
            end,
            on_end = function()
                vim.g.minianimate_disable = false
            end,
            -- Spinner for pinned views that are loading.
            -- if you have noice.nvim installed, you can use any spinner from it, like:
            -- spinner = require("noice.util.spinners").spinners.circleFull,
            spinner = {
                frames = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
                interval = 80,
            },
        },
        -- enable this to exit Neovim when only edgy windows are left
        exit_when_last = false,
        -- close edgy when all windows are hidden instead of opening one of them
        -- disable to always keep at least one edgy split visible in each open section
        close_when_all_hidden = true,
        -- global window options for edgebar windows
        -- -@type vim.wo
        wo = {
            -- Setting to `true`, will add an edgy winbar.
            -- Setting to `false`, won't set any winbar.
            -- Setting to a string, will set the winbar to that string.
            winbar = true,
            winfixwidth = true,
            winfixheight = false,
            winhighlight = "WinBar:EdgyWinBar,Normal:EdgyNormal",
            spell = false,
            signcolumn = "no",
        },
        -- buffer-local keymaps to be added to edgebar buffers.
        -- Existing buffer-local keymaps will never be overridden.
        -- Set to false to disable a builtin.
        -- -@type table<string, fun(win:Edgy.Window)|false>
        keys = {
            -- increase width
            ["<c-Right>"] = function(win)
                win:resize("width", 2)
            end,
            -- decrease width
            ["<c-Left>"] = function(win)
                win:resize("width", -2)
            end,
            -- increase height
            ["<c-Up>"] = function(win)
                win:resize("height", 2)
            end,
            -- decrease height
            ["<c-Down>"] = function(win)
                win:resize("height", -2)
            end,
        },
        icons = {
            closed = " ",
            open = " ",
        },
        -- enable this on Neovim <= 0.10.0 to properly fold edgebar windows.
        -- Not needed on a nightly build >= June 5, 2023.
        fix_win_height = vim.fn.has("nvim-0.10.0") == 0,
    },
}
