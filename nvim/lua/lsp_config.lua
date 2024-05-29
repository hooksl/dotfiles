local lspconfig = require("lspconfig")

local on_attach = function(client, bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }
	local keymap = vim.keymap.set
	keymap("n", "gh", "<cmd>Lspsaga finder<CR>", opts)
	keymap({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
	keymap("n", "gr", "<cmd>Lspsaga rename<CR>", opts)
	keymap("n", "gp", "<cmd>Lspsaga peek_definition<CR>", opts)
	keymap("n", "gd", "<cmd>Lspsaga goto_definition<CR>", opts)
	-- keymap("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
	keymap("n", "gsl", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
	keymap("n", "gsb", "<cmd>Lspsaga show_buf_diagnostics<CR>", opts)
	keymap("n", "gsw", "<cmd>Lspsaga show_workspace_diagnostics<CR>", opts)
	keymap("n", "gsc", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
	keymap("n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
	keymap("n", "gj", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
	keymap("n", "<leader>o", "<cmd>Lspsaga outline<CR>", opts)
	keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
	keymap("n", "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>", opts)
	keymap("n", "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>", opts)
	-- keymap("n", "<c-s>", function()
	--     vim.lsp.buf.format({ async = true })
	-- end, opts)
end

-- Configure each language
-- How to add LSP for a specific language?
-- 1. use `:Mason` to install corresponding LSP
-- 2. add configuration below

local capabilities = require("cmp_nvim_lsp").default_capabilities()
lspconfig.lua_ls.setup({
	on_attach = on_attach,
	on_init = function(client)
		local path = client.workspace_folders[1].name
		if vim.loop.fs_stat(path .. "/.luarc.json") or vim.loop.fs_stat(path .. "/.luarc.jsonc") then
			return
		end

		client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
			runtime = {
				-- Tell the language server which version of Lua you're using
				-- (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
			},
			-- Make the server aware of Neovim runtime files
			workspace = {
				checkThirdParty = false,
				library = {
					vim.env.VIMRUNTIME,
					-- Depending on the usage, you might want to add additional paths here.
					-- "${3rd}/luv/library"
					-- "${3rd}/busted/library",
				},
				-- or pull in all of 'runtimepath'. NOTE this is a lot slower
				-- library = vim.api.nvim_get_runtime_file("", true)
			},
		})
	end,
	settings = {
		Lua = {
			-- 解决提示 undefined global `vim`
			-- diagnostics = { globals = { 'vim' } }
		},
	},
	capabilities = capabilities,
})
lspconfig.marksman.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "markdown", "markdown.mdx" },
})
lspconfig.tsserver.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
lspconfig.pyright.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
lspconfig.ruff.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
lspconfig.bashls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
lspconfig.tailwindcss.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
lspconfig.volar.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	-- filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
	filetypes = { "vue" },
	init_options = {
		typescript = {
			-- tsdk = '/path/to/.npm/lib/node_modules/typescript/lib'
			-- Alternative location if installed as root:
			tsdk = "/usr/local/lib/node_modules/typescript/lib",
		},
		vue = {
			hybridMode = false,
		},
	},
})
local config = {
	-- 禁止使用文本提示
	virtual_text = false,
	underline = true,
	signs = {
		text = {
			[vim.diagnostic.severity.HINT] = "",
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.INFO] = "",
			[vim.diagnostic.severity.WARN] = "",
		},
	},
}
vim.diagnostic.config(config)
