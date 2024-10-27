return{
  -- Git related plugins
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",         -- required
      "sindrets/diffview.nvim",        -- optional - Diff integration
      "nvim-telescope/telescope.nvim",
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
        vim.keymap.set('n', 'hB', '<cmd>Gitsigns blame<cr>', { desc = 'git Blame' })
        vim.keymap.set('n', 'ha', '<cmd>!git add %<cr>', { desc = 'git Add'})
        vim.keymap.set('n', 'hg', '<cmd>Neogit<cr>', { desc = 'Neogit'})
        vim.keymap.set('n', 'hd', '<cmd>DiffviewOpen<cr>', { desc = 'Diffview'})
        vim.keymap.set('n', 'hc', ':!git commit -am ""<left>', { desc = 'git Get'})
        vim.keymap.set('n', 'hp', '<cmd>!git pull<cr>', { desc = 'git Get'})
        vim.keymap.set('n', 'hP', '<cmd>!git push<cr>', { desc = 'git Push'})
        vim.keymap.set('n', 'hs', '<cmd>Neogit stash<cr>', { desc = 'git Stash'})
        vim.keymap.set('n', 'hb', require('gitsigns').blame_line, { buffer = bufnr, desc = 'git Blame' })
        vim.keymap.set('n', 'hN', require('gitsigns').prev_hunk, { buffer = bufnr, desc = 'go to Previous Hunk' })
        vim.keymap.set('n', 'hn', require('gitsigns').next_hunk, { buffer = bufnr, desc = 'go to Next Hunk' })
        vim.keymap.set('n', 'hr', require('gitsigns').reset_hunk, { buffer = bufnr, desc = 'reset Hunk' })
        vim.keymap.set('n', 'hv', require('gitsigns').preview_hunk, { buffer = bufnr, desc = 'preView Hunk' })
      end,
    },
  },
}
