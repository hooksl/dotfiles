return {
    "williamboman/mason.nvim",
    build = ":MasonUpdate", -- :MasonUpdate updates registry contents
    -- config = function()
    --     require("mason").setup({
    --         ui = {
    --             icons = {
    --                 package_installed = "✓",
    --                 package_pending = "➜",
    --                 package_uninstalled = "✗"
    --             }
    --         }
    --     })
    --
    -- end,
}
