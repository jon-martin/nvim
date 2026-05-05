local group = vim.api.nvim_create_augroup("BlinkCmpLazyLoad", { clear = true })

vim.api.nvim_create_autocmd("InsertEnter", {
	pattern = "*",
	group = group,
	once = true,
	callback = function()
		require("blink.cmp").setup({
			keymap = {
				preset = "none",
				["<C-Space>"] = { "show", "hide" },
				["<Tab>"] = { "accept", "fallback" },
				["<C-n>"] = { "select_next", "fallback" },
				["<C-p>"] = { "select_prev", "fallback" },
				-- ["<C-n>"] = { "snippet_forward", "fallback" },
				-- ["<C-e>"] = { "snippet_backward", "fallback" },
				["<C-d>"] = { "show_documentation", "hide_documentation" },
			},
			appearance = { nerd_font_variant = "mono" },
			completion = { menu = { auto_show = true } },
			sources = { default = { "lsp", "path", "buffer", "snippets" } },
			snippets = {
				expand = function(snippet)
					require("luasnip").lsp_expand(snippet)
				end,
			},

			fuzzy = {
				implementation = "prefer_rust",
				prebuilt_binaries = { download = true },
			},
		})
	end
})

vim.lsp.config["*"] = {
	capabilities = require("blink.cmp").get_lsp_capabilities(),
}
