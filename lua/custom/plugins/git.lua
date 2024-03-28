return{
  -- Git related plugins
  'tpope/vim-fugitive',

  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",         -- required
      "sindrets/diffview.nvim",        -- optional - Diff integration

      -- Only one of these is needed, not both.
      "nvim-telescope/telescope.nvim", -- optional
      -- "ibhagwan/fzf-lua",              -- optional
    },
    config = true
  },

  {
    -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      -- See `:help gitsigns.txt`
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      on_attach = function(bufnr)
        vim.keymap.set('n', 'hp', require('gitsigns').prev_hunk, { buffer = bufnr, desc = 'Go to Previous Hunk' })
        vim.keymap.set('n', 'hn', require('gitsigns').next_hunk, { buffer = bufnr, desc = 'Go to Next Hunk' })
        vim.keymap.set('n', 'hb', require('gitsigns').blame_line, { buffer = bufnr, desc = 'Git blame' })
        vim.keymap.set('n', 'hv', require('gitsigns').preview_hunk, { buffer = bufnr, desc = 'PreView Hunk' })
        vim.keymap.set('n', 'hr', require('gitsigns').reset_hunk, { buffer = bufnr, desc = 'Reset Hunk' })
      end,
    },
  },
}
