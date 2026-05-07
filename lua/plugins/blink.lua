local group = vim.api.nvim_create_augroup("BlinkCmpLazyLoad", { clear = true })

vim.api.nvim_create_autocmd("InsertEnter", {
	pattern = "*",
	group = group,
	once = true,
	callback = function()
		require("blink.cmp").setup({
			keymap = {
				preset = "default",
                ["<Tab>"] = {
                    function(cmp)
                        if require("luasnip").expand_or_jumpable() then
                            require("luasnip").expand_or_jump()
                            return true
                        end
                    end,
                    "select_and_accept",
                    "fallback",
                },
                ['<c-y>'] = { 'select_and_accept', 'fallback' },
				["<C-n>"] = { "select_next", "fallback" },
				["<C-p>"] = { "select_prev", "fallback" },
				["<C-space>"] = { "show_documentation", "hide_documentation" },
			},
			appearance = {
                use_nvim_cmp_as_default = true,
                nerd_font_variant = 'mono'
            },
			completion = { menu = { auto_show = true } },
			sources = { default = { "lsp", "snippets", "path", "buffer" } },
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
