return {
    {
        'saghen/blink.cmp',
        dependencies = 'jon-martin/friendly-snippets',

        version = 'v0.*',

        opts = {
            keymap = {
                preset = 'default',

                ['<tab>'] = { 'accept', 'fallback' },
            },

            appearance = {
                use_nvim_cmp_as_default = true,
                nerd_font_variant = 'mono'
            },

            signature = { enabled = true },
        },
    },
}
