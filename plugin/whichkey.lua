-- Custom leader-keymaps
vim.keymap.set('n', '<leader>y', ':vsplit<cr>', { desc = 'vertical split' })
vim.keymap.set('n', '<leader>l', ':split<cr>', { desc = 'horizontal split' })
vim.keymap.set('n', '<leader>n', ':wincmd h<cr>', { desc = 'move Left' })
vim.keymap.set('n', '<leader>u', ':wincmd k<cr>', { desc = 'move Up' })
vim.keymap.set('n', '<leader>e', ':wincmd j<cr>', { desc = 'move Down' })
vim.keymap.set('n', '<leader>i', ':wincmd l<cr>', { desc = 'move Right' })
vim.keymap.set('n', '<leader>.', ':vert sba<cr>', { desc = 'split buffers' })
vim.keymap.set('n', '<leader>,', ':only<cr>', { desc = 'close other windows' })
vim.keymap.set('n', '<leader>b', ':bnext<cr>', { desc = 'next Buffer' })
vim.keymap.set('n', '<leader>x', ':bdelete<cr>', { desc = 'delete buffer' })

-- Whichkey register
local wk = require('which-key')
wk.register({
  ['h'] = { name = '+Custom' },
  ['<leader>m'] = { name = '+Macros' },
  ['<leader>s'] = { name = '+Search' },
  ['<leader>g'] = { name = '+Git' },
  ['<leader>d'] = { name = '+Document' },
  ['<leader>t'] = { name = '+quickfix/Todo' },
})

-- Macros
vim.keymap.set('n', '<leader>mu', '/version<CR>2fl<C-A>', { desc = 'Update version' })
vim.keymap.set('n', '<leader>mc', ':%!', { desc = 'Run command on file' })
vim.keymap.set('n', '<leader>mg', 'yiw:%g/<C-r>"/d<Left><Left>', { desc = 'G-remove template' })
vim.keymap.set('n', '<leader>mr', 'yiw:%s/<C-r>"//g<Left><Left>', { desc = 'Searh-replace template' })
vim.keymap.set('n', '<leader>ms', ':%s/^.*$/\'&\',/g<CR>G$xgg0vG$"+y', { desc = 'SQLify' })
vim.keymap.set('n', '<leader>me', 'yy!!bash<CR>Po<Esc><Up>', { desc = 'Execute line as command' })
vim.keymap.set('n', '<leader>mn', ':enew<CR>', { desc = 'New buffer' })
vim.keymap.set('n', '<leader>md', ':windo diffthis<cr>', { desc = 'Diffthis' })
vim.keymap.set('n', '<leader>mo', ':windo diffoff<cr>', { desc = 'Diff Off' })
-- Search commands
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = 'Search Files' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = 'Search Help' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = 'Search current Word' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = 'Search by Grep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = 'Search Diagnostics' })
-- Git commands
vim.keymap.set('n', '<leader>gs', require('telescope.builtin').git_status, { desc = 'search Git Status' })
vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'search Git Files' })
vim.keymap.set('n', '<leader>gu', require('telescope.builtin').git_bcommits, { desc = 'search Git bUffer commits' })
vim.keymap.set('n', '<leader>gc', require('telescope.builtin').git_commits, { desc = 'search Git Commits' })
vim.keymap.set('n', '<leader>gr', require('telescope.builtin').git_branches, { desc = 'search Git bRanches' })
vim.keymap.set('n', '<leader>gb', ':Git blame<cr>', { desc = 'Git Blame' })
vim.keymap.set('n', '<leader>gd', ':Gvdiffsplit<cr>', { desc = 'Git Diffsplit' })
vim.keymap.set('n', '<leader>gp', ':Git pull', { desc = 'Git pull'})
vim.keymap.set('n', '<leader>gC', ':Git commit -am ""<Left>', { desc = 'Git Commit'})
vim.keymap.set('n', '<leader>gP', ':Git push', { desc = 'Git Push'})
vim.keymap.set('n', '<leader>gt', ':diffget //2', { desc = 'diffget left'})
vim.keymap.set('n', '<leader>gn', ':diffget //2', { desc = 'diffget right'})
-- Quickfix
vim.keymap.set('n', '<leader>to', ':copen<CR>', { desc = 'Open quickfix list' })
vim.keymap.set('n', '<leader>tq', ':cclose<CR>', { desc = 'close Quickfix list' })
vim.keymap.set('n', '<leader>tn', ':cnext<CR>', { desc = 'Next quickfix item' })
vim.keymap.set('n', '<leader>tp', ':cprev<CR>', { desc = 'Previous quickfix item' })
vim.keymap.set('n', '<leader>tl', ':clast<CR>', { desc = 'go to Last quickfix item' })
vim.keymap.set('n', '<leader>tf', ':cfirst<CR>', { desc = 'go to First quickfix item' })
