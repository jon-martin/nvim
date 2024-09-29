return{
  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim', opts = {
      triggers = {
        { "<leader>", mode = { "n", "v" } },
        { "h", mode = { "n"}, desc = 'git commands' },
        { "l", mode = { "n"}, desc = 'quickfix and markup hotkeys' }
      }
    }
  },

  -- Theme inspired by Atom
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
  },

  -- Set lualine as statusline
  {
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
      options = {
        path = 1,
        icons_enabled = true,
        theme = 'iceberg',
        component_separators = '|',
        section_separators = '',
      },
    },
  },

  {
  'nanozuki/tabby.nvim',
  -- event = 'VimEnter', -- if you want lazy load, see below
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    -- configs...
  end,
  },

  -- Add indentation guides even on blank lines
  {
    'lukas-reineke/indent-blankline.nvim',
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    opts = {},
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
}
}
