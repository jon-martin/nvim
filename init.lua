vim.cmd("packadd nvim.undotree")

vim.pack.add {
    'https://github.com/neovim/nvim-lspconfig',
    'https://github.com/mason-org/mason.nvim',
    'https://github.com/saghen/blink.lib',
    'https://github.com/saghen/blink.cmp',
    'https://github.com/catppuccin/nvim',
    'https://github.com/ibhagwan/fzf-lua',
    'https://github.com/lewis6991/gitsigns.nvim',
    'https://github.com/folke/which-key.nvim',
    'https://github.com/folke/flash.nvim',
    'https://github.com/MeanderingProgrammer/render-markdown.nvim',
    'https://github.com/nvim-tree/nvim-web-devicons',
    'https://github.com/nvim-tree/nvim-tree.lua',
    'https://github.com/nvim-lualine/lualine.nvim',
    'https://github.com/jon-martin/friendly-snippets',
    'https://github.com/L3MON4D3/LuaSnip',
}

require("mason").setup({})

require("plugins.fzf-lua")
require("plugins.blink")
require("plugins.nvim-tree")
require("plugins.lualine")
require("plugins.flash")
require("plugins.catppuccin")
require("config.parameters")
require("config.keybinds")
require("config.lsp")
require("config.autocmds")

local uname = vim.uv.os_uname()
local is_mac = uname.sysname == "Darwin"
if is_mac then
    local cmp = require('blink.cmp')
    cmp.build():wait(60000)
    cmp.setup()
end
