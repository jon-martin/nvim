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
-- Kickstart defaults
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = 'find recently opened files' })
vim.keymap.set('n', '<leader>/', require('telescope.builtin').current_buffer_fuzzy_find, { desc = 'fuzzily search in current buffer' })

-- Linux keybinds
vim.keymap.set('n', '<m-y>', '<cmd>vsplit<cr><cmd>wincmd l<cr><cmd>bnext<cr>', { desc = 'vertical split' })
vim.keymap.set('n', '<m-l>', '<cmd>split<cr><cmd>wincmd j<cr><cmd>bnext<cr>', { desc = 'horizontal split' })
vim.keymap.set('n', '<m-f>', '<cmd>tabnew<cr>', { desc = 'create new tab' })
vim.keymap.set('n', '<m-s>', ':Tabby rename_tab ', { desc = 'rename tab' })
vim.keymap.set('n', '<m-r>', 'gT', { desc = 'move to left tab' })
vim.keymap.set('n', '<m-t>', 'gt', { desc = 'move to right tab' })
vim.keymap.set('n', '<m-n>', '<cmd>wincmd h<cr>', { desc = 'move Left' })
vim.keymap.set('n', '<m-u>', '<cmd>wincmd k<cr>', { desc = 'move Up' })
vim.keymap.set('n', '<m-e>', '<cmd>wincmd j<cr>', { desc = 'move Down' })
vim.keymap.set('n', '<m-i>', '<cmd>wincmd l<cr>', { desc = 'move Right' })
vim.keymap.set('t', '<m-n>', '<c-\\><c-n><cmd>wincmd h<cr>', { desc = 'move Left' })
vim.keymap.set('t', '<m-u>', '<c-\\><c-n><cmd>wincmd k<cr>', { desc = 'move Up' })
vim.keymap.set('t', '<m-e>', '<c-\\><c-n><cmd>wincmd j<cr>', { desc = 'move Down' })
vim.keymap.set('t', '<m-i>', '<c-\\><c-n><cmd>wincmd l<cr>', { desc = 'move Right' })
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
vim.keymap.set('n', '<m-z>', '<cmd>lua Zoomfun()<cr>', { desc = 'resize' })
-- Mac keybinds
-- vim.keymap.set('n', '<esc><up>', '<cmd>tabnew<cr>', { desc = 'create new tab' })
-- vim.keymap.set('n', '<esc><down>', '<cmd>Tabby rename_tab ', { desc = 'rename tab' })
-- vim.keymap.set('n', '<esc><left>', 'gT', { desc = 'move to left tab' })
-- vim.keymap.set('n', '<esc><right>', 'gt', { desc = 'move to right tab' })
-- vim.keymap.set('n', '<c-b>%', '<cmd>vsplit<cr><cmd>wincmd l<cr><cmd>bnext<cr>', { desc = 'vertical split' })
-- vim.keymap.set('n', '<c-b>"', '<cmd>split<cr><cmd>wincmd j<cr><cmd>bnext<cr>', { desc = 'horizontal split' })
-- vim.keymap.set('n', '<c-b>c', '<cmd>tabnew<cr>', { desc = 'create new tab' })
-- vim.keymap.set('n', '<c-b><left>', '<cmd>wincmd h<cr>', { desc = 'move Left' })
-- vim.keymap.set('n', '<c-b><up>', '<cmd>wincmd k<cr>', { desc = 'move Up' })
-- vim.keymap.set('n', '<c-b><down>', '<cmd>wincmd j<cr>', { desc = 'move Down' })
-- vim.keymap.set('n', '<c-b><right>', '<cmd>wincmd l<cr>', { desc = 'move Right' })
-- vim.keymap.set('t', '<c-b><left>', '<c-\\><c-n><cmd>wincmd h<cr>', { desc = 'move Left' })
-- vim.keymap.set('t', '<c-b><up>', '<c-\\><c-n><cmd>wincmd k<cr>', { desc = 'move Up' })
-- vim.keymap.set('t', '<c-b><down>', '<c-\\><c-n><cmd>wincmd j<cr>', { desc = 'move Down' })
-- vim.keymap.set('t', '<c-b><right>', '<c-\\><c-n><cmd>wincmd l<cr>', { desc = 'move Right' })
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
-- vim.keymap.set('n', '<c-b>z', '<cmd>lua Zoomfun()<cr>', { desc = 'resize' })
-- vim.keymap.set('n', '<m-a>', 'ggVG', { desc = 'copy to clipboard' })


-- Misc
vim.keymap.set('n', '<m-x>', '"+yydd', { desc = 'copy to clipboard' })
vim.keymap.set('n', '<m-c>', '"+yyj', { desc = 'copy to clipboard' })
vim.keymap.set('v', '<m-c>', '"+y', { desc = 'copy to clipboard' })
vim.keymap.set('n', '<m-v>', '"+P<down>', { desc = 'paste from clipboard' })
vim.keymap.set('v', '<m-v>', '"+p', { desc = 'paste from clipboard' })
vim.keymap.set('n', '<esc>', '<cmd>nohlsearch<cr>', { noremap = true, silent = true, desc = 'Remove search highlights' })
vim.keymap.set('i', '<c-e>', '<c-o>e<right>', { desc = 'ea-move' })
vim.keymap.set('i', '<c-b>', '<c-o>b', { desc = 'b-move' })
vim.keymap.set('n', '<c-d>', '<cmd>bdelete!<cr>', { desc = 'delete buffer' })

-- Terminal
vim.keymap.set( 'n', '<leader>z', '<cmd>terminal<cr>a', { noremap = true, silent = true, desc = 'Terminal' })
vim.keymap.set( 't', '<esc>', '<c-\\><c-n>', { noremap = true, silent = true })

-- MiniFiles keymap
vim.keymap.set("n", "-", "<cmd>lua MiniFiles.open()<cr>", { desc = "Open parent directory" })

wk.add({
-- Window management
  { '<leader>,', '<cmd>only<cr>', desc = 'close other windows' },
  { '<leader>b', require('telescope.builtin').buffers, desc = 'find existing Buffers' },
  { '<leader>N', '<cmd>lua MiniFiles.open(\'~/Documents/notes/\')<CR><cmd>put=strftime(\'%Y-%m-%d\')<CR>A-.md<left><left><left>', desc = 'New note' },
  { '<leader>n', '<cmd>enew<cr>', desc = 'New buffer' },
  -- { '<leader>x', '<cmd>bdelete!<cr>', desc = 'delete buffer' },
  { '<leader>w', '<cmd>Easypick new_window<cr>', desc = 'new Window' },
-- Formatting
  { '<leader>f', group = "Format" },
  { '<leader>fs', '<cmd>%s/^.*$/\'&\',/g<CR>G$xgg0vG$"+y', desc = 'SQLify' },
  { '<leader>fx', '<cmd>%! xmllint --format -<cr>', desc = 'XML prettyprint' },
  { '<leader>fj', '<cmd>%! jq .<cr>', desc = 'Json prettyprint' },
  { '<leader>fc', 'ggI|<esc>A|<esc>:s/\\s\\+/\\|\\|/g<cr>:%s/\\s\\+/\\|/g<cr>:%s/^/\\|/g<cr>:%s/$/\\|/g<cr>', desc = 'Confluence prettyprint' },
  { '<leader>fd', ':%s/\\(\\d\\{2}:\\d\\{2}\\):\\d\\{2}\\.\\d\\{3}/\\1/g<cr>', desc = 'Dateformat' },
-- Macros
  { '<leader>m', group = "Macros" },
  { '<leader>ms', '<cmd>set lazyredraw<cr>', desc = 'Silence macros' },
  { '<leader>mu', '/version<cr>$F.<c-a>', desc = 'Update version' },
  { '<leader>me', 'yy!!bash<CR>Po<Esc><Up>', desc = 'Execute line as command' },
  { '<leader>md', '<cmd>windo diffthis<cr>', desc = 'Diffthis' },
  { '<leader>mo', '<cmd>windo diffoff<cr>', desc = 'Diff Off' },
-- Search commands
  { '<leader>s', group = "Search commands" },
  { '<leader>sf', require('telescope.builtin').find_files, desc = 'search Files' },
  { '<leader>sh', require('telescope.builtin').help_tags, desc = 'search Help' },
  { '<leader>sw', require('telescope.builtin').grep_string, desc = 'search current Word' },
  { '<leader>sg', '<cmd>Telescope live_grep_args<cr>', desc = 'search by Grep' },
  { '<leader>se', require('telescope.builtin').diagnostics, desc = 'search diagnostics' },
  { '<leader>sj', require('telescope.builtin').jumplist, desc = 'search Jumplist' },
  { '<leader>sd', '<cmd>Easypick change_directory<cr>', desc = 'search Directory' },
  { '<leader>s"', require('telescope.builtin').registers, desc = 'search registers' },
  { '<leader>sm', require('telescope.builtin').marks, desc = 'search Marks' },
  { '<leader>sn', '<cmd>Telescope live_grep search_dirs={"~/Documents/notes/"}<cr>', desc = 'search Notes' },
  { '<leader>sN', '<cmd>Telescope find_files search_dirs={"~/Documents/notes/"}<cr>', desc = 'search Notefiles' },
  { '<leader>ss', require('telescope.builtin').git_status, desc = 'search Git Status' },
  { '<leader>sS', require('telescope.builtin').git_stash, desc = 'search Git Stash' },
  { '<leader>sb', require('telescope.builtin').git_bcommits, desc = 'search Git Buffer commits' },
  { '<leader>sc', require('telescope.builtin').git_commits, desc = 'search Git Commits' },
  { '<leader>sr', require('telescope.builtin').git_branches, desc = 'search Git bRanches' },
-- Git commands
  { '<leader>g', group = "Git commands" },
  { '<leader>gd', '<cmd>Gvdiffsplit<cr>', desc = 'Git Diffsplit' },
  { '<leader>gt', ':diffget //2', desc = 'diffget left'},
  { '<leader>gn', ':diffget //3', desc = 'diffget right'},
-- Quickfix (not working, neither is git-stuff)
  { 'l', group = "Quickfix" },
  { 'lo', '<cmd>copen<CR>', desc = 'Open quickfix list' },
  { 'lq', '<cmd>cclose<CR>', desc = 'Quit quickfix list' },
  { 'ln', '<cmd>cnext<CR>', desc = 'Next quickfix item' },
  { 'lN', '<cmd>cprev<CR>', desc = 'previous quickfix item' },
  { 'lgg', '<cmd>cfirst<CR>', desc = 'first quickfix item' },
  { 'lG', '<cmd>clast<CR>', desc = 'last quickfix item' },
  { 'lc', 'o- [ ] ', desc = 'create markdown Checkbox' },
  { 'lx', '0/\\[ \\]<CR><right>rx', desc = 'mark checkbox done' },
  { 'lt', 'V<cmd>s/\\%V / | /g<CR>I| <esc>A |<esc><down>', desc = 'markdown Table line' },
  { 'lh', 'yyV<cmd>s/\\%V / | /g<CR>I| <esc>A |<esc>pV<cmd>s/\\%V\\w*/ | --- /g<CR>A |<esc><down>', desc = 'markdown table Header' },
  { 'll', '@q', desc = 'run q-macro' },
  { 'lu', '@w', desc = 'run w-macro' },
  { 'ly', '@f', desc = 'run f-macro' },
  { 'lv', '<cmd>vsplit<cr><cmd>cnext<cr>', desc = 'open next quickfix-item in Vertical split' },
  { 'ls', '<cmd>split<cr><cmd>cnext<cr>', desc = 'open next quickfix-item in Split' },
-- Git
  { 'h', group = "Git" },
})
