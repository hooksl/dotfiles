return {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    -- version = "<CurrentMajor>.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
        require('lualine').setup {
            options = {
                -- ... your lualine config
                theme = 'tokyonight'
                -- ... your lualine config
            }
        }
    end,

}
