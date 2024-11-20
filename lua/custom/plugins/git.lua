return{
  -- Git related plugins
  "tpope/vim-fugitive",
  {
    "rbong/vim-flog",
    lazy = true,
    cmd = { "Flog", "Flogsplit", "Floggit" },
    dependencies = {
      "tpope/vim-fugitive",
    },
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
        vim.keymap.set('n', 'hB', '<cmd>Gitsigns blame<cr>', { desc = 'Blame' })
        vim.keymap.set('n', 'ha', '<cmd>!git add %<cr>', { desc = 'Add'})
        vim.keymap.set('n', 'hc', ':wa<cr>:Git commit -am ""<left>', { desc = 'Commit'})
        vim.keymap.set('n', 'hC', '<cmd>Gvdiffsplit!<cr>', { desc = 'resolve Conflict'})
        vim.keymap.set('n', 'he', '<cmd>diffget //2<cr>', { desc = 'get lEft'})
        vim.keymap.set('n', 'hi', '<cmd>diffget //3<cr>', { desc = 'get rIght'})
        vim.keymap.set('n', 'hp', '<cmd>Git pull<cr>', { desc = 'pull'})
        vim.keymap.set('n', 'hP', '<cmd>Git push<cr>', { desc = 'Push'})
        vim.keymap.set('n', 'hs', '<cmd>Git stash<cr>', { desc = 'Stash'})
        vim.keymap.set('n', 'hS', '<cmd>Git stash pop<cr>', { desc = 'Stash pop'})
        vim.keymap.set('n', 'hf', '<cmd>Flog<cr>', { desc = 'Flog commit history'})
        vim.keymap.set('n', 'hb', require('gitsigns').blame_line, { buffer = bufnr, desc = 'blame' })
        vim.keymap.set('n', 'hN', require('gitsigns').prev_hunk, { buffer = bufnr, desc = 'go to Previous Hunk' })
        vim.keymap.set('n', 'hn', require('gitsigns').next_hunk, { buffer = bufnr, desc = 'go to Next Hunk' })
        vim.keymap.set('n', 'hr', require('gitsigns').reset_hunk, { buffer = bufnr, desc = 'reset Hunk' })
        vim.keymap.set('n', 'hv', require('gitsigns').preview_hunk, { buffer = bufnr, desc = 'preView Hunk' })
      end,
    },
  },
}
