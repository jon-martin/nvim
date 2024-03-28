return{
  -- Animations for cursor, windows and scrolling
  {
    'karb94/neoscroll.nvim',
    -- version = false,
  },

  -- Fade inactive windows
  {
    'TaDaa/vimade',
    event = "VeryLazy",
  },

  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim', opts = {} },

  -- Theme inspired by Atom
  {
    'cocopon/iceberg.vim',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'iceberg'
    end,
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

  -- Add indentation guides even on blank lines
  {
    'lukas-reineke/indent-blankline.nvim',
  },
}
