return {
    {
        'saghen/blink.cmp',
        dependencies = 'jon-martin/friendly-snippets',

        version = 'v0.*',

        opts = {
            keymap = {
                preset = 'default',
                ['<c-e>'] = { 'cancel', 'fallback' },
                ['<tab>'] = {
                    'snippet_forward',
                    'accept',
                    'fallback',
                },
                ['<c-y>'] = { 'select_and_accept', 'fallback' },
                ['<c-k>'] = { 'select_prev', 'fallback' },
                ['<up>'] = { 'select_prev', 'fallback' },
                ['<c-j>'] = { 'select_next', 'fallback' },
                ['<down>'] = { 'select_next', 'fallback' },
            },

            appearance = {
                use_nvim_cmp_as_default = true,
                nerd_font_variant = 'mono'
            },
            sources = {
                default = { "lsp", "path", "snippets", "buffer" },
                per_filetype = {
                    sql = { 'dadbod', 'buffer' },
                },
                -- add vim-dadbod-completion to your completion providers
                providers = {
                    dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
                },
            },

            signature = { enabled = true },
        },
    },
}
