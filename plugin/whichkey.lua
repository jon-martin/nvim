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

-- Kickstart defaults
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = 'find recently opened files' })
vim.keymap.set('n', '<leader>/', require('telescope.builtin').current_buffer_fuzzy_find, { desc = 'fuzzily search in current buffer' })

-- Custom leader-keymaps
vim.keymap.set('n', '<M-y>', ':vsplit<cr>:wincmd l<cr>:bnext<cr>', { desc = 'vertical split' })
vim.keymap.set('n', '<M-Y>', ':vertical resize +20<cr>', { desc = 'vertical resize' })
vim.keymap.set('n', '<M-l>', ':split<cr>:wincmd j<cr>:bnext<cr>', { desc = 'horizontal split' })
vim.keymap.set('n', '<M-L>', ':resize +20<cr>', { desc = 'resize' })
vim.keymap.set('n', '<M-n>', ':wincmd h<cr>', { desc = 'move Left' })
vim.keymap.set('n', '<M-u>', ':wincmd k<cr>', { desc = 'move Up' })
vim.keymap.set('n', '<M-e>', ':wincmd j<cr>', { desc = 'move Down' })
vim.keymap.set('n', '<M-i>', ':wincmd l<cr>', { desc = 'move Right' })
vim.keymap.set('n', '<leader>.', ':vert sba<cr>', { desc = 'split buffers' })
vim.keymap.set('n', '<leader>,', ':only<cr>', { desc = 'close other windows' })
vim.keymap.set('n', '<leader>b', require('telescope.builtin').buffers, { desc = 'find existing Buffers' })
vim.keymap.set('n', '<leader>x', ':bdelete<cr>', { desc = 'delete buffer' })

-- Arrow bindings
vim.keymap.set( 'n', '<M-up>', 'ddkP', { noremap = true, silent = true })
vim.keymap.set( 'n', '<M-down>', 'ddp', { noremap = true, silent = true })
vim.keymap.set( { 'n', 'v' }, '<M-left>', 'b', { noremap = true, silent = true })
vim.keymap.set( { 'n', 'v' }, '<M-right>', 'w', { noremap = true, silent = true })
-- Misc
vim.keymap.set( 'n', '<esc>', ':nohlsearch<cr>', { noremap = true, silent = true, desc = 'Remove search highlights' })
vim.keymap.set( 'n', '<tab>w', '@', { noremap = true, silent = true, desc = 'run macro' })
vim.keymap.set( 'n', '<tab>a', 'maggVG"+y\'a', { noremap = true, silent = true, desc = 'copy All' })
vim.keymap.set( 'n', '<tab>d', 'ggdG', { noremap = true, silent = true, desc = 'Delete all' })
vim.keymap.set( 'n', '<tab>r', ':e!<cr>', { noremap = true, silent = true, desc = 'Reload file' })
vim.keymap.set( 'n', '<tab>s', ':wa<cr>', { noremap = true, silent = true, desc = 'Save all' })
-- Quickfix
vim.keymap.set( 'n', '<tab>t', ':cnext<cr>', { noremap = true, silent = true, desc = 'quickfix next' })
vim.keymap.set( 'n', '<tab>p', ':cprev<cr>', { noremap = true, silent = true, desc = 'quickfix previous' })
-- Copy/paste
vim.keymap.set( 'n', '<tab>x', '"+dd', { noremap = true, silent = true, desc = 'cut' })
vim.keymap.set( 'n', '<tab>c', '"+yy<down>', { noremap = true, silent = true, desc = 'Copy' })
vim.keymap.set( 'n', '<tab>v', '"+P', { noremap = true, silent = true, desc = 'Paste' })
vim.keymap.set( 'n', '<tab>b', ':bnext<cr>', { desc = 'next buffer' })
-- Terminal
vim.keymap.set( 'n', '<leader>z', ':terminal<cr>', { noremap = true, silent = true, desc = 'Terminal' })
vim.keymap.set( 't', '<esc>', '<c-\\><c-n>', { noremap = true, silent = true })

-- Oil keymap
vim.keymap.set("n", "-", ":vsplit<cr>:vert resize 40<cr>:Oil<cr>", { desc = "Open parent directory" })

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
