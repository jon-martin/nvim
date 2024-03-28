-- Kickstart defaults
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = 'find recently opened files' })
vim.keymap.set('n', '<leader>k', require('telescope.builtin').buffers, { desc = 'find existing Buffers' })
vim.keymap.set('n', '<leader>/', require('telescope.builtin').current_buffer_fuzzy_find, { desc = 'fuzzily search in current buffer' })

-- Custom leader-keymaps
vim.keymap.set('n', '<leader>y', ':vsplit<cr>:wincmd l<cr>:Telescope buffers<cr>', { desc = 'vertical split' })
vim.keymap.set('n', '<leader>Y', ':vertical resize +10<cr>', { desc = 'vertical resize' })
vim.keymap.set('n', '<leader>l', ':split<cr>:wincmd j<cr>:Telescope find_files<cr>', { desc = 'horizontal split' })
vim.keymap.set('n', '<leader>L', ':resize +10<cr>', { desc = 'resize' })
vim.keymap.set('n', '<leader>n', ':wincmd h<cr>', { desc = 'move Left' })
vim.keymap.set('n', '<leader>u', ':wincmd k<cr>', { desc = 'move Up' })
vim.keymap.set('n', '<leader>e', ':wincmd j<cr>', { desc = 'move Down' })
vim.keymap.set('n', '<leader>i', ':wincmd l<cr>', { desc = 'move Right' })
vim.keymap.set('n', '<leader>.', ':vert sba<cr>', { desc = 'split buffers' })
vim.keymap.set('n', '<leader>,', ':only<cr>', { desc = 'close other windows' })
vim.keymap.set('n', '<leader>b', ':bnext<cr>', { desc = 'next buffer' })
vim.keymap.set('n', '<leader>x', ':bdelete<cr>', { desc = 'delete buffer' })

-- Whichkey register
local wk = require('which-key')
wk.register({
  ['h'] = { name = '+Custom' },
  ['<leader>m'] = { name = '+Macros' },
  ['<leader>f'] = { name = '+Format' },
  ['<leader>s'] = { name = '+Search' },
  ['<leader>g'] = { name = '+Git' },
  ['<leader>d'] = { name = '+Document' },
  ['<leader>t'] = { name = '+quickfix/Todo' },
})

-- Formatting
vim.keymap.set('n', '<leader>fs', ':%s/^.*$/\'&\',/g<CR>G$xgg0vG$"+y', { desc = 'SQLify' })
vim.keymap.set('n', '<leader>fx', ':%! xmllint --format -<cr>', { desc = 'XML prettyprint' })
vim.keymap.set('n', '<leader>fj', ':%! jq .<cr>', { desc = 'Json prettyprint' })
vim.keymap.set('n', '<leader>ft', ':%! tr -s " " | column -t', { desc = 'Table prettyprint' })
vim.keymap.set('n', '<leader>fc', 'ggI|<esc>A|<esc>:s/\\s\\+/\\|\\|/g<cr>:%s/\\s\\+/\\|/g<cr>:%s/^/\\|/g<cr>:%s/$/\\|/g<cr>', { desc = 'Confluence prettyprint' })
vim.keymap.set('n', '<leader>fd', ':%s/\\(\\d\\{2}:\\d\\{2}\\):\\d\\{2}\\.\\d\\{3}/\\1/g<cr>', { desc = 'Dateformat' })
-- Macros
vim.keymap.set('n', '<leader>ms', ':silent<cr>', { desc = 'Silence macros' })
vim.keymap.set('n', '<leader>mu', '/version<cr>$F.<c-a>', { desc = 'Update version' })
vim.keymap.set('n', '<leader>mc', ':%!', { desc = 'Run command on file' })
vim.keymap.set('n', '<leader>mg', 'yiw:%g/<C-r>"/d<Left><Left>', { desc = 'G-remove template' })
vim.keymap.set('n', '<leader>mr', 'yiw:%s/<C-r>"//g<Left><Left>', { desc = 'search-Replace template' })
vim.keymap.set('n', '<leader>mR', 'yiw:windo%s/<C-r>"//g<Left><Left>', { desc = 'search-Replace template across windows' })
vim.keymap.set('n', '<leader>me', 'yy!!bash<CR>Po<Esc><Up>', { desc = 'Execute line as command' })
vim.keymap.set('n', '<leader>mn', ':enew<CR>', { desc = 'New buffer' })
vim.keymap.set('n', '<leader>md', ':windo diffthis<cr>', { desc = 'Diffthis' })
vim.keymap.set('n', '<leader>mo', ':windo diffoff<cr>', { desc = 'Diff Off' })
vim.keymap.set('n', '<leader>ma', ':s/\\d\\+/\\=submatch(0)', { desc = 'Arithmetic operation' })
-- Search commands
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = 'Search Files' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = 'Search Help' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = 'Search current Word' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = 'Search by Grep' })
vim.keymap.set('n', '<leader>se', require('telescope.builtin').diagnostics, { desc = 'Search diagnostics' })
vim.keymap.set('n', '<leader>sj', require('telescope.builtin').jumplist, { desc = 'Search Jumplist' })
vim.keymap.set('n', '<leader>sd', ':Easypick change_directory<cr>', { desc = 'Search Directory' })
vim.keymap.set('n', '<leader>sm', require('telescope.builtin').marks, { desc = 'Search Marks' })
-- Git commands
vim.keymap.set('n', '<leader>gs', require('telescope.builtin').git_status, { desc = 'search Git Status' })
vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'search Git Files' })
vim.keymap.set('n', '<leader>gu', require('telescope.builtin').git_bcommits, { desc = 'search Git bUffer commits' })
vim.keymap.set('n', '<leader>gc', require('telescope.builtin').git_commits, { desc = 'search Git Commits' })
vim.keymap.set('n', '<leader>gr', require('telescope.builtin').git_branches, { desc = 'search Git bRanches' })
vim.keymap.set('n', '<leader>gg', ':Neogit<cr>', { desc = 'Neogit' })
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
