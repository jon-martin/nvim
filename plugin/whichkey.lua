-- Custom keymaps
vim.keymap.set('n', '<leader>y', ":vsplit<cr>", { desc = 'vertical split' })
vim.keymap.set('n', '<leader>l', ":split<cr>", { desc = 'horizontal split' })
vim.keymap.set('n', '<leader>n', ":wincmd h<cr>", { desc = 'move Left' })
vim.keymap.set('n', '<leader>u', ":wincmd k<cr>", { desc = 'move Up' })
vim.keymap.set('n', '<leader>e', ":wincmd j<cr>", { desc = 'move Down' })
vim.keymap.set('n', '<leader>i', ":wincmd l<cr>", { desc = 'move Right' })
vim.keymap.set('n', '<leader>.', ":vert sba<cr>", { desc = 'split buffers' })
vim.keymap.set('n', '<leader>,', ":only<cr>", { desc = 'close other windows' })
vim.keymap.set('n', '<leader>h', ":windo diffthis<cr>", { desc = 'difftHis' })
vim.keymap.set('n', '<leader>k', ":windo diffoff<cr>", { desc = 'diffoff' })
vim.keymap.set('n', '<leader>b', ":bnext<cr>", { desc = 'next Buffer' })

local wk = require("which-key")
wk.register({
  ["<leader>g"] = { name = "+Git" },
  ["<leader>s"] = { name = "+Search" },
  ["<leader>d"] = { name = "+Document" },
  -- Quickfix commands
  ["<leader>t"] = {
    name = "+quickfix/Todo",
    o = { ":copen<CR>", "Open quickfix list" },
    q = { ":cclose<CR>", "close Quickfix list" },
    n = { ":cnext<CR>", "Next quickfix item" },
    p = { ":cprev<CR>", "Previous quickfix item" },
    l = { ":clast<CR>", "go to Last quickfix item" },
    f = { ":cfirst<CR>", "go to First quickfix item" }
  },
  -- Macros are contained in separate file in plugin-directory
  ["<leader>m"] = {
    name = "+Macros",
    a = { ":normal @a<CR>", "Aacro" },
  },
})
-- Git commands
vim.keymap.set('n', '<leader>gs', require('telescope.builtin').git_status, { desc = 'search Git Status' })
vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'search Git Files' })
vim.keymap.set('n', '<leader>gu', require('telescope.builtin').git_bcommits, { desc = 'search Git bUffer commits' })
vim.keymap.set('n', '<leader>gc', require('telescope.builtin').git_commits, { desc = 'search Git Commits' })
vim.keymap.set('n', '<leader>gr', require('telescope.builtin').git_branches, { desc = 'search Git bRanches' })
vim.keymap.set('n', '<leader>gB', ":Git blame<cr>", { desc = 'Git Blame' })
-- Search commands
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = 'Search Files' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = 'Search Help' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = 'Search current Word' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = 'Search by Grep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = 'Search Diagnostics' })


