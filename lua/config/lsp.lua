vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = { globals = { "vim" } },
			telemetry = { enable = false },
		},
	},
})
vim.lsp.config('ty', {})
vim.lsp.config("ruff", {})
vim.lsp.config("bashls", {})
vim.lsp.config("jsonls", {})
vim.lsp.config("terraformls", {})
vim.lsp.config("terraform", {})
vim.lsp.config("cssls", {})
vim.lsp.config("tailwindcss", {})

vim.lsp.enable({
	"lua_ls",
    "ty",
    "ruff",
	"bashls",
    "jsonls",
    "terraformls",
    "terraform",
    "cssls",
    "tailwindcss",
})
