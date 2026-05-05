vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = { globals = { "vim" } },
			telemetry = { enable = false },
		},
	},
})
vim.lsp.config("ty", {})
vim.lsp.config("bashls", {})
vim.lsp.config("ts_ls", {})

vim.lsp.enable({
	"lua_ls",
	"ty",
	"bashls",
	"ts_ls",
})
