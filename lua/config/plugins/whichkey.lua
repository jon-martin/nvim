return {
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
            triggers = {
                { "<auto>", mode = "nixsotc" },
                { "<leader>", mode = { "n", "v" } },
                { "h", mode = { "n" }, desc = 'git commands' },
                { "l", mode = { "n" }, desc = 'quickfix and markup hotkeys' }
            },
        },
        -- keys = {
        --     {
        --         "<leader>?",
        --         function()
        --             require("which-key").show({ global = false })
        --         end,
        --         desc = "Buffer Local Keymaps (which-key)",
        --     },
        -- },
    },
}
