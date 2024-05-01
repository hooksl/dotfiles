return {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    build = ":MasonUpdate", -- :MasonUpdate updates registry contents
    -- config = function()
    --     require("mason-lspconfig").setup({
    --         ensure_installed = { "lua_ls", "rust_analyzer" },
    --     })
    -- end,
}
