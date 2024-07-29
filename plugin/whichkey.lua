-- Whichkey register
local zoom = false
function Zoomfun()
  if zoom then
    zoom = false
    vim.api.nvim_feedkeys(':wincmd =\n', 'n', true)
  else
    zoom = true
    vim.api.nvim_feedkeys(':wincmd |\n', 'n', true)
    vim.api.nvim_feedkeys(':wincmd _\n', 'n', true)
  end
end

local wk = require('which-key')
wk.register({
  ['h'] = { name = '+Custom' },
  ['l'] = { name = '+Custom' },
  ['<leader>m'] = { name = '+Macros' },
  ['<leader>f'] = { name = '+Format' },
  ['<leader>s'] = { name = '+Search' },
  ['<leader>g'] = { name = '+Git' },
  ['<leader>d'] = { name = '+Document' },
})
-- Kickstart defaults
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = 'find recently opened files' })
vim.keymap.set('n', '<leader>/', require('telescope.builtin').current_buffer_fuzzy_find, { desc = 'fuzzily search in current buffer' })

-- Linux keybinds
vim.keymap.set('n', '<m-y>', ':vsplit<cr>:wincmd l<cr>:bnext<cr>', { desc = 'vertical split' })
vim.keymap.set('n', '<m-l>', ':split<cr>:wincmd j<cr>:bnext<cr>', { desc = 'horizontal split' })
vim.keymap.set('n', '<m-f>', ':tabnew<cr>', { desc = 'create new tab' })
vim.keymap.set('n', '<m-r>', 'gT', { desc = 'move to left tab' })
vim.keymap.set('n', '<m-t>', 'gt', { desc = 'move to right tab' })
vim.keymap.set('n', '<m-n>', ':wincmd h<cr>', { desc = 'move Left' })
vim.keymap.set('n', '<m-u>', ':wincmd k<cr>', { desc = 'move Up' })
vim.keymap.set('n', '<m-e>', ':wincmd j<cr>', { desc = 'move Down' })
vim.keymap.set('n', '<m-i>', ':wincmd l<cr>', { desc = 'move Right' })
vim.keymap.set('t', '<m-n>', '<c-\\><c-n>:wincmd h<cr>', { desc = 'move Left' })
vim.keymap.set('t', '<m-u>', '<c-\\><c-n>:wincmd k<cr>', { desc = 'move Up' })
vim.keymap.set('t', '<m-e>', '<c-\\><c-n>:wincmd j<cr>', { desc = 'move Down' })
vim.keymap.set('t', '<m-i>', '<c-\\><c-n>:wincmd l<cr>', { desc = 'move Right' })
vim.keymap.set('n', '<m-1>', '1gt', { desc = 'select tab 1' })
vim.keymap.set('n', '<m-2>', '2gt', { desc = 'select tab 2' })
vim.keymap.set('n', '<m-3>', '3gt', { desc = 'select tab 3' })
vim.keymap.set('n', '<m-4>', '4gt', { desc = 'select tab 4' })
vim.keymap.set('n', '<m-5>', '5gt', { desc = 'select tab 5' })
vim.keymap.set('t', '<m-1>', '<c-\\><c-n>1gt', { desc = 'select tab 1' })
vim.keymap.set('t', '<m-2>', '<c-\\><c-n>2gt', { desc = 'select tab 2' })
vim.keymap.set('t', '<m-3>', '<c-\\><c-n>3gt', { desc = 'select tab 3' })
vim.keymap.set('t', '<m-4>', '<c-\\><c-n>4gt', { desc = 'select tab 4' })
vim.keymap.set('t', '<m-5>', '<c-\\><c-n>5gt', { desc = 'select tab 5' })
vim.keymap.set('n', '<m-z>', ':lua Zoomfun()<cr>', { desc = 'resize' })
-- Mac keybinds
-- vim.keymap.set('n', '<c-b>%', ':vsplit<cr>:wincmd l<cr>:bnext<cr>', { desc = 'vertical split' })
-- vim.keymap.set('n', '<c-b>"', ':split<cr>:wincmd j<cr>:bnext<cr>', { desc = 'horizontal split' })
-- vim.keymap.set('n', '<c-b><left>', ':wincmd h<cr>', { desc = 'move Left' })
-- vim.keymap.set('n', '<c-b><up>', ':wincmd k<cr>', { desc = 'move Up' })
-- vim.keymap.set('n', '<c-b><down>', ':wincmd j<cr>', { desc = 'move Down' })
-- vim.keymap.set('n', '<c-b><right>', ':wincmd l<cr>', { desc = 'move Right' })
-- vim.keymap.set('t', '<c-b><left>', '<c-\\><c-n>:wincmd h<cr>', { desc = 'move Left' })
-- vim.keymap.set('t', '<c-b><up>', '<c-\\><c-n>:wincmd k<cr>', { desc = 'move Up' })
-- vim.keymap.set('t', '<c-b><down>', '<c-\\><c-n>:wincmd j<cr>', { desc = 'move Down' })
-- vim.keymap.set('t', '<c-b><right>', '<c-\\><c-n>:wincmd l<cr>', { desc = 'move Right' })
-- vim.keymap.set('n', '<c-b>1', '1gt', { desc = 'select tab 1' })
-- vim.keymap.set('n', '<c-b>2', '2gt', { desc = 'select tab 2' })
-- vim.keymap.set('n', '<c-b>3', '3gt', { desc = 'select tab 3' })
-- vim.keymap.set('n', '<c-b>4', '4gt', { desc = 'select tab 4' })
-- vim.keymap.set('n', '<c-b>5', '5gt', { desc = 'select tab 5' })
-- vim.keymap.set('t', '<c-b>1', '<c-\\><c-n>1gt', { desc = 'select tab 1' })
-- vim.keymap.set('t', '<c-b>2', '<c-\\><c-n>2gt', { desc = 'select tab 2' })
-- vim.keymap.set('t', '<c-b>3', '<c-\\><c-n>3gt', { desc = 'select tab 3' })
-- vim.keymap.set('t', '<c-b>4', '<c-\\><c-n>4gt', { desc = 'select tab 4' })
-- vim.keymap.set('t', '<c-b>5', '<c-\\><c-n>5gt', { desc = 'select tab 5' })
-- vim.keymap.set('n', '<c-b>z', ':lua Zoomfun()<cr>', { desc = 'resize' })
-- vim.keymap.set('n', '<m-a>', 'ggVG', { desc = 'copy to clipboard' })

-- Window management
vim.keymap.set('n', '<leader>,', ':only<cr>', { desc = 'close other windows' })
vim.keymap.set('n', '<leader>b', require('telescope.builtin').buffers, { desc = 'find existing Buffers' })
vim.keymap.set('n', '<leader>N', ':Oil ~/Documents/notes/<cr>:sleep 100m<cr>G:put=strftime(\'%Y%m%d\')<cr>', { desc = 'New note' })
vim.keymap.set('n', '<leader>n', ':enew<cr>', { desc = 'New buffer' })
vim.keymap.set('n', '<leader>x', ':bdelete<cr>', { desc = 'delete buffer' })
vim.keymap.set('n', '<leader>w', ':Easypick new_window<cr>', { desc = 'new Window' })
vim.keymap.set('n', '<leader>t', ':tabnew<cr>', { desc = 'new Tab' })

-- Misc
vim.keymap.set('n', '<m-x>', '"+yydd', { desc = 'copy to clipboard' })
vim.keymap.set('n', '<m-c>', '"+yyj', { desc = 'copy to clipboard' })
vim.keymap.set('v', '<m-c>', '"+y', { desc = 'copy to clipboard' })
vim.keymap.set('n', '<m-v>', '"+po<esc>', { desc = 'paste from clipboard' })
vim.keymap.set('v', '<m-v>', '"+p', { desc = 'paste from clipboard' })
vim.keymap.set('n', '<esc>', ':nohlsearch<cr>', { noremap = true, silent = true, desc = 'Remove search highlights' })
vim.keymap.set('i', '<c-e>', '<c-o>e<right>', { desc = 'ea-move' })
vim.keymap.set('i', '<c-b>', '<c-o>b', { desc = 'b-move' })

-- Terminal
vim.keymap.set( 'n', '<leader>z', ':terminal<cr>', { noremap = true, silent = true, desc = 'Terminal' })
vim.keymap.set( 't', '<esc>', '<c-\\><c-n>', { noremap = true, silent = true })

-- Oil keymap
vim.keymap.set("n", "-", ":Oil<cr>", { desc = "Open parent directory" })

-- Formatting
vim.keymap.set('n', '<leader>fs', ':%s/^.*$/\'&\',/g<CR>G$xgg0vG$"+y', { desc = 'SQLify' })
vim.keymap.set('n', '<leader>fx', ':%! xmllint --format -<cr>', { desc = 'XML prettyprint' })
vim.keymap.set('n', '<leader>fj', ':%! jq .<cr>', { desc = 'Json prettyprint' })
vim.keymap.set('n', '<leader>ft', ':%! tr -s " " | column -t', { desc = 'Table prettyprint' })
vim.keymap.set('n', '<leader>fc', 'ggI|<esc>A|<esc>:s/\\s\\+/\\|\\|/g<cr>:%s/\\s\\+/\\|/g<cr>:%s/^/\\|/g<cr>:%s/$/\\|/g<cr>', { desc = 'Confluence prettyprint' })
vim.keymap.set('n', '<leader>fd', ':%s/\\(\\d\\{2}:\\d\\{2}\\):\\d\\{2}\\.\\d\\{3}/\\1/g<cr>', { desc = 'Dateformat' })
-- Macros
vim.keymap.set('n', '<leader>ms', ':set lazyredraw<cr>', { desc = 'Silence macros' })
vim.keymap.set('n', '<leader>mu', '/version<cr>$F.<c-a>', { desc = 'Update version' })
vim.keymap.set('n', '<leader>mc', ':%!', { desc = 'Run command on buffer' })
vim.keymap.set('n', '<leader>mC', ':%!', { desc = 'Run command get output' })
vim.keymap.set('n', '<leader>mg', 'yiw:%g/<C-r>"/d<Left><Left>', { desc = 'G-remove template' })
vim.keymap.set('n', '<leader>mG', 'yiw:%g!/<C-r>"/d<Left><Left>', { desc = 'G-invert-remove template' })
vim.keymap.set('n', '<leader>mr', 'yiw:%s/<C-r>"//g<Left><Left>', { desc = 'search-Replace template' })
vim.keymap.set('n', '<leader>mR', 'yiw:windo%s/<C-r>"//g<Left><Left>', { desc = 'search-Replace template across windows' })
vim.keymap.set('n', '<leader>me', 'yy!!bash<CR>Po<Esc><Up>', { desc = 'Execute line as command' })
vim.keymap.set('n', '<leader>md', ':windo diffthis<cr>', { desc = 'Diffthis' })
vim.keymap.set('n', '<leader>mo', ':windo diffoff<cr>', { desc = 'Diff Off' })
-- Search commands
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = 'search Files' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = 'search Help' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = 'search current Word' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = 'search by Grep' })
vim.keymap.set('n', '<leader>se', require('telescope.builtin').diagnostics, { desc = 'search diagnostics' })
vim.keymap.set('n', '<leader>sj', require('telescope.builtin').jumplist, { desc = 'search Jumplist' })
vim.keymap.set('n', '<leader>sd', ':Easypick change_directory<cr>', { desc = 'search Directory' })
vim.keymap.set('n', '<leader>s"', require('telescope.builtin').registers, { desc = 'search registers' })
vim.keymap.set('n', '<leader>sm', require('telescope.builtin').marks, { desc = 'search Marks' })
vim.keymap.set('n', '<leader>ss', require('telescope.builtin').git_status, { desc = 'search Git Status' })
vim.keymap.set('n', '<leader>sS', require('telescope.builtin').git_stash, { desc = 'search Git Stash' })
vim.keymap.set('n', '<leader>sb', require('telescope.builtin').git_bcommits, { desc = 'search Git Buffer commits' })
vim.keymap.set('n', '<leader>sc', require('telescope.builtin').git_commits, { desc = 'search Git Commits' })
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').git_branches, { desc = 'search Git bRanches' })
-- Git commands
vim.keymap.set('n', '<leader>gd', ':Gvdiffsplit<cr>', { desc = 'Git Diffsplit' })
vim.keymap.set('n', '<leader>gt', ':diffget //2', { desc = 'diffget left'})
vim.keymap.set('n', '<leader>gn', ':diffget //3', { desc = 'diffget right'})
vim.keymap.set('n', '<leader>gg', ':Neogit  cwd=%:p:h<cr>', { desc = 'Neogit' })
-- Quickfix
vim.keymap.set('n', 'lo', ':copen<CR>', { desc = 'Open quickfix list' })
vim.keymap.set('n', 'lc', ':cclose<CR>', { desc = 'Close quickfix list' })
vim.keymap.set('n', 'ln', ':cnext<CR>', { desc = 'Next quickfix item' })
vim.keymap.set('n', 'lN', ':cprev<CR>', { desc = 'previous quickfix item' })
vim.keymap.set('n', 'lgg', ':cfirst<CR>', { desc = 'first quickfix item' })
vim.keymap.set('n', 'lG', ':clast<CR>', { desc = 'last quickfix item' })
vim.keymap.set('n', 'll', '@q', { desc = 'run q-macro' })
vim.keymap.set('n', 'lu', '@w', { desc = 'run w-macro' })
vim.keymap.set('n', 'ly', '@f', { desc = 'run f-macro' })
