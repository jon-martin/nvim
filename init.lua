vim.pack.add {
    'https://github.com/neovim/nvim-lspconfig',
    'https://github.com/mason-org/mason.nvim',
    'https://github.com/saghen/blink.cmp',
    'https://github.com/catppuccin/nvim',
    'https://github.com/ibhagwan/fzf-lua',
    'https://github.com/lewis6991/gitsigns.nvim',
    'https://github.com/folke/which-key.nvim',
    'https://codeberg.org/andyg/leap.nvim',
    'https://github.com/MeanderingProgrammer/render-markdown.nvim',
    'https://github.com/nvim-tree/nvim-web-devicons',
    'https://github.com/nvim-tree/nvim-tree.lua',
    'https://github.com/nvim-lualine/lualine.nvim',
}

require("mason").setup({})

require("plugins.blink")
require("plugins.nvim-tree")
require("plugins.lualine")
require("config.parameters")
require("config.keybinds")
require("config.lsp")
require("config.autocmds")

vim.keymap.set({ 'n', 'x', 'o' }, 's', '<Plug>(leap)')
