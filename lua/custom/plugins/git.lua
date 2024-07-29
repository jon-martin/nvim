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
        vim.keymap.set('n', 'hB', ':Git blame<cr>', { desc = 'Git Blame' })
        vim.keymap.set('n', 'hc', ':Git commit -am ""<left>', { desc = 'git Commit'})
        vim.keymap.set('n', 'hp', ':Git pull<cr>', { desc = 'git Get'})
        vim.keymap.set('n', 'hP', ':Git push<cr>', { desc = 'git Push'})
        vim.keymap.set('n', 'hs', ':Git stash<cr>', { desc = 'git stash'})
        vim.keymap.set('n', 'hS', ':Git stash pop<cr>', { desc = 'git stash pop'})
        vim.keymap.set('n', 'hb', require('gitsigns').blame_line, { buffer = bufnr, desc = 'git Blame' })
        vim.keymap.set('n', 'hN', require('gitsigns').prev_hunk, { buffer = bufnr, desc = 'go to Previous Hunk' })
        vim.keymap.set('n', 'hn', require('gitsigns').next_hunk, { buffer = bufnr, desc = 'go to Next Hunk' })
        vim.keymap.set('n', 'hr', require('gitsigns').reset_hunk, { buffer = bufnr, desc = 'reset Hunk' })
        vim.keymap.set('n', 'hv', require('gitsigns').preview_hunk, { buffer = bufnr, desc = 'preView Hunk' })
      end,
    },
  },
}
