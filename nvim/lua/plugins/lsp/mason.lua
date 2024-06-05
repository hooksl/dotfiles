return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		require("mason").setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})
		require("mason-lspconfig").setup({
			-- A list of servers to automatically install if they're not already installed
			-- 自动安装服务
			-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
			automatic_installation = true,
			ensure_installed = {
				"lua_ls",
				"volar",
				"tailwindcss",
				"tsserver",
				"marksman",
				"pyright",
				"ruff",
				"bashls",
				"rust_analyzer",
			},
		})
	end,
}
