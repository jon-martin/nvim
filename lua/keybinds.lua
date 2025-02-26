if jit.os == "Linux" then
    -- Linux keybinds
    vim.keymap.set('n', '<m-f>', '<cmd>tablast<cr><cmd>tabnew<cr>', { desc = 'create new tab' })
    vim.keymap.set('n', '<m-s>', ':Tabby rename_tab ', { desc = 'rename tab' })
    vim.keymap.set('n', '<m-r>', 'gT', { desc = 'move to left tab' })
    vim.keymap.set('n', '<m-t>', 'gt', { desc = 'move to right tab' })
    vim.keymap.set('n', '<m-y>', '<cmd>vsplit<cr><cmd>wincmd l<cr>', { desc = 'vertical split' })
    vim.keymap.set('n', '<m-l>', '<cmd>split<cr><cmd>wincmd j<cr>', { desc = 'horizontal split' })
    vim.keymap.set('n', '<m-n>', '<cmd>wincmd h<cr>', { desc = 'move Left' })
    vim.keymap.set('n', '<m-u>', '<cmd>wincmd k<cr>', { desc = 'move Up' })
    vim.keymap.set('n', '<m-e>', '<cmd>wincmd j<cr>', { desc = 'move Down' })
    vim.keymap.set('n', '<m-i>', '<cmd>wincmd l<cr>', { desc = 'move Right' })
    vim.keymap.set('n', '<m-1>', '1gt', { desc = 'select tab 1' })
    vim.keymap.set('n', '<m-2>', '2gt', { desc = 'select tab 2' })
    vim.keymap.set('n', '<m-3>', '3gt', { desc = 'select tab 3' })
    vim.keymap.set('n', '<m-4>', '4gt', { desc = 'select tab 4' })
    vim.keymap.set('n', '<m-5>', '5gt', { desc = 'select tab 5' })
    vim.keymap.set('n', '<m-6>', '6gt', { desc = 'select tab 6' })
    vim.keymap.set('n', '<m-7>', '7gt', { desc = 'select tab 7' })
    vim.keymap.set('n', '<m-8>', '8gt', { desc = 'select tab 8' })
    vim.keymap.set('n', '<m-9>', '9gt', { desc = 'select tab 9' })
    vim.keymap.set('n', '<m-z>', '<cmd>lua Snacks.zen.zoom()<cr>', { desc = 'resize' })
else
    -- Mac keybinds
    vim.keymap.set('n', '<esc><up>', '<cmd>tablast<cr><cmd>tabnew<cr>', { desc = 'create new tab' })
    vim.keymap.set('n', '<esc><down>', ':Tabby rename_tab ', { desc = 'rename tab' })
    vim.keymap.set('n', '<esc><left>', 'gT', { desc = 'move to left tab' })
    vim.keymap.set('n', '<esc><right>', 'gt', { desc = 'move to right tab' })
    vim.keymap.set('n', '<c-b>%', '<cmd>vsplit<cr><cmd>wincmd l<cr>', { desc = 'vertical split' })
    vim.keymap.set('n', '<c-b>"', '<cmd>split<cr><cmd>wincmd j<cr>', { desc = 'horizontal split' })
    vim.keymap.set('n', '<c-b><left>', '<cmd>wincmd h<cr>', { desc = 'move Left' })
    vim.keymap.set('n', '<c-b><up>', '<cmd>wincmd k<cr>', { desc = 'move Up' })
    vim.keymap.set('n', '<c-b><down>', '<cmd>wincmd j<cr>', { desc = 'move Down' })
    vim.keymap.set('n', '<c-b><right>', '<cmd>wincmd l<cr>', { desc = 'move Right' })
    vim.keymap.set('n', '<c-b>1', '1gt', { desc = 'select tab 1' })
    vim.keymap.set('n', '<c-b>2', '2gt', { desc = 'select tab 2' })
    vim.keymap.set('n', '<c-b>3', '3gt', { desc = 'select tab 3' })
    vim.keymap.set('n', '<c-b>4', '4gt', { desc = 'select tab 4' })
    vim.keymap.set('n', '<c-b>5', '5gt', { desc = 'select tab 5' })
    vim.keymap.set('n', '<c-b>6', '6gt', { desc = 'select tab 6' })
    vim.keymap.set('n', '<c-b>7', '7gt', { desc = 'select tab 7' })
    vim.keymap.set('n', '<c-b>8', '8gt', { desc = 'select tab 8' })
    vim.keymap.set('n', '<c-b>9', '9gt', { desc = 'select tab 9' })
    vim.keymap.set('n', '<c-b>z', '<cmd>lua Snacks.zen.zoom()<cr>', { desc = 'resize' })
end

-- Extra keymaps with explicit modes
vim.keymap.set('n', '<m-a>', 'ggVG', { desc = 'visual select all' })
vim.keymap.set('n', '<m-x>', '"+yydd', { desc = 'cut to clipboard' })
vim.keymap.set('n', '<m-c>', '"+yyj', { desc = 'copy to clipboard' })
vim.keymap.set('v', '<m-c>', '"+y', { desc = 'copy to clipboard' })
vim.keymap.set('n', '<m-v>', '"+P<down>', { desc = 'paste from clipboard' })
vim.keymap.set('v', '<m-v>', '"+p', { desc = 'paste from clipboard' })
vim.keymap.set('n', '<esc>', '<cmd>nohlsearch<cr>', { noremap = true, silent = true, desc = 'Remove search highlights' })

local wk = require("which-key")

wk.add({
    { '<leader>s',  group = "Search commands" },
    { '<leader>u',  group = "Enable/Disable features" },
    { '<leader>g',  group = "Git commands" },
    { '<leader>d',  group = "Document LSP" },
    -- Window management
    { '<leader>o',  '<cmd>only<cr>',                                                                                    desc = 'Only' },
    { '<leader>n',  '<cmd>enew<cr>',                                                                                    desc = 'New buffer' },
    -- Formatting
    { '<leader>f',  group = "Format" },
    { '<leader>fs', '<cmd>%s/^.*$/\'&\',/g<CR>G$xgg0vG$"+y',                                                            desc = 'SQLify' },
    { '<leader>fx', '<cmd>%! xmllint --format -<cr>',                                                                   desc = 'XML prettyprint' },
    { '<leader>fj', '<cmd>%! jq .<cr>',                                                                                 desc = 'Json prettyprint' },
    { '<leader>fc', 'ggI|<esc>A|<esc>:s/\\s\\+/\\|\\|/g<cr>:%s/\\s\\+/\\|/g<cr>:%s/^/\\|/g<cr>:%s/$/\\|/g<cr>',         desc = 'Confluence prettyprint' },
    { '<leader>fd', ':%s/\\(\\d\\{2}:\\d\\{2}\\):\\d\\{2}\\.\\d\\{3}/\\1/g<cr>',                                        desc = 'Dateformat' },
    -- Macros
    { '<leader>m',  group = "Macros" },
    { '<leader>ms', '<cmd>set lazyredraw<cr>',                                                                          desc = 'Silence macros' },
    { '<leader>mu', '/version<cr>$F.<c-a>',                                                                             desc = 'Update version' },
    { '<leader>me', 'yy!!bash<CR>Po<Esc><Up>',                                                                          desc = 'Execute line as command' },
    { '<leader>md', '<cmd>windo diffthis<cr>',                                                                          desc = 'Diffthis' },
    { '<leader>mo', '<cmd>windo diffoff<cr>',                                                                           desc = 'Diff Off' },
    -- Quickfix (not working, neither is git-stuff)
    { 'l',          group = "Quickfix" },
    { 'lo',         '<cmd>copen<CR>',                                                                                   desc = 'Open quickfix list' },
    { 'lq',         '<cmd>cclose<CR>',                                                                                  desc = 'Quit quickfix list' },
    { 'ln',         '<cmd>cnext<CR>',                                                                                   desc = 'Next quickfix item' },
    { 'lN',         '<cmd>cprev<CR>',                                                                                   desc = 'previous quickfix item' },
    { 'lgg',        '<cmd>cfirst<CR>',                                                                                  desc = 'first quickfix item' },
    { 'lG',         '<cmd>clast<CR>',                                                                                   desc = 'last quickfix item' },
    { 'lc',         'o- [ ] ',                                                                                          desc = 'create markdown Checkbox' },
    { 'lw',         '<cmd>tcd %:p:h<CR>',                                                                               desc = 'set buffer as local directory' },
    { 'lW',         '<cmd>tcd %:p:h:h<CR>',                                                                             desc = 'set buffer/.. as local directory' },
    { 'lx',         '0/\\[ \\]<CR><right>rx<down>',                                                                     desc = 'mark checkbox done' },
    { 'lt',         'V<cmd>s/\\%V / | /g<CR>I| <esc>A |<esc><down>',                                                    desc = 'markdown Table line' },
    { 'lh',         'yyV<cmd>s/\\%V / | /g<CR>I| <esc>A |<esc>pV<cmd>s/\\%V\\w*/ | --- /g<CR>A |<esc><down>',           desc = 'markdown table Header' },
    { 'll',         '@q',                                                                                               desc = 'run q-macro' },
    { 'lu',         '@w',                                                                                               desc = 'run w-macro' },
    { 'ly',         '@f',                                                                                               desc = 'run f-macro' },
    { 'lv',         '<cmd>vsplit<cr><cmd>cnext<cr>',                                                                    desc = 'open next quickfix-item in Vertical split' },
    { 'ls',         '<cmd>split<cr><cmd>cnext<cr>',                                                                     desc = 'open next quickfix-item in Split' },
    -- Git
    { 'h',          group = "Git" },
    { 'ha',         '<cmd>!git add %<cr>',                                                                              desc = 'Add' },
    { 'hB',         '<cmd>Gitsigns blame<cr>',                                                                          desc = 'Blame' },
    { 'hC',         '<cmd>Gvdiffsplit!<cr>',                                                                            desc = 'resolve Conflict' },
    { 'he',         '<cmd>diffget //2<cr>',                                                                             desc = 'get lEft' },
    { 'hi',         '<cmd>diffget //3<cr>',                                                                             desc = 'get rIght' },
    { 'hp',         '<cmd>Git pull<cr>',                                                                                desc = 'pull' },
    { 'hP',         '<cmd>Git push<cr>',                                                                                desc = 'Push' },
    { 'hs',         '<cmd>Git stash<cr>',                                                                               desc = 'Stash' },
    { 'hS',         '<cmd>Git stash pop<cr>',                                                                           desc = 'Stash pop' },
    { 'hb',         require('gitsigns').blame_line,                                                                     desc = 'blame' },
    { 'hN',         require('gitsigns').prev_hunk,                                                                      desc = 'go to Previous Hunk' },
    { 'hn',         require('gitsigns').next_hunk,                                                                      desc = 'go to Next Hunk' },
    { 'hr',         require('gitsigns').reset_hunk,                                                                     desc = 'reset Hunk' },
    { 'hv',         require('gitsigns').preview_hunk,                                                                   desc = 'preView Hunk' },
    { '<leader>p',  group = "Projects" },
    { '<leader>pp', '<cmd>tablast<cr><cmd>tabnew<cr><cmd>lua Snacks.picker.projects()<cr>', desc = "Project picker" },
    { '<leader>pn', '<cmd>tablast<cr><cmd>tabnew<cr><cmd>lcd ~/Documents/notes/<cr><cmd>Tabby rename_tab notes<cr><cmd>lua Snacks.picker.files()<cr>', desc = "Notes" },
    { '<leader>pw', '<cmd>tablast<cr><cmd>tabnew<cr><cmd>lcd ~/Downloads/<cr><cmd>Tabby rename_tab downloads<cr><cmd>lua Snacks.picker.files()<cr>',       desc = "Downloads" },
    { '<leader>pg', '<cmd>tablast<cr><cmd>tabnew<cr><cmd>lcd ~/Documents/git/<cr><cmd>Tabby rename_tab git<cr><cmd>lua Snacks.picker.files()<cr>',       desc = "Git" },
})

-- Moved from wk.add, because refresh of command line did not happen
vim.keymap.set({ 'n' }, 'hc', ':wa<cr>:Git commit -am ""<left>', { desc = 'Commit' })
vim.keymap.set({ 'n' }, '<leader>mc', ':%!', { desc = 'Run command on buffer' })
vim.keymap.set({ 'n' }, '<leader>mg', 'yiw:%g/<C-r>"/d<Left><Left>', { desc = 'G-remove template' })
vim.keymap.set({ 'n' }, '<leader>mG', 'yiw:%g!/<C-r>"/d<Left><Left>', { desc = 'G-invert-remove template' })
vim.keymap.set({ 'n' }, '<leader>mr', 'yiw:%s/<C-r>"//g<Left><Left>', { desc = 'search-Replace template' })
vim.keymap.set({ 'n' }, '<leader>mR', 'yiw:windo%s/<C-r>"//g<Left><Left>',
    { desc = 'search-Replace template across windows' })
vim.keymap.set({ 'v' }, '<leader>mr', ':s/\\%V//g<left><left><left>', { desc = 'search-Replace template' })
vim.keymap.set({ 'v' }, '<leader>mg', ':g/^/norm! @', { desc = 'run macro template' })
vim.keymap.set({ 'n' }, '<leader>ft', ':%! tr -s " " | column -t', { desc = 'Table prettyprint' })
vim.keymap.set({ 'n' }, '<leader>N',
    ':enew<cr>:w ~/Documents/notes/<c-r>=strftime(\'%Y-%m-%d\')<cr>-.md<left><left><left>', { desc = 'New note' })

-- { '<leader>N',  '<cmd>lua MiniFiles.open(\'~/Documents/notes/\')<CR><cmd>put=strftime(\'%Y-%m-%d\')<CR>A-.md<left><left><left>', desc = 'New note' },
