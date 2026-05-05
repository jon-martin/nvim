-- Clipboard
vim.keymap.set('n', '<m-a>', 'ggVG', { desc = 'visual select all' })
vim.keymap.set('n', '<m-x>', '"+yydd', { desc = 'cut to clipboard' })
vim.keymap.set('n', '<m-c>', '"+yyj', { desc = 'copy to clipboard' })
vim.keymap.set('v', '<m-c>', '"+y', { desc = 'copy to clipboard' })
vim.keymap.set('n', '<m-v>', '"+P<down>', { desc = 'paste from clipboard' })
vim.keymap.set('v', '<m-v>', '"+p', { desc = 'paste from clipboard' })
vim.keymap.set('n', '<esc>', '<cmd>nohlsearch<cr>', { noremap = true, silent = true, desc = 'Remove search highlights' })

-- Terminal
vim.keymap.set('t', '<esc>', '<c-\\><c-n>', { desc = 'esc' })
vim.keymap.set('t', 'ZQ', '<c-\\><c-n>ZQ', { desc = 'exit terminal' })

local wk = require("which-key")

wk.add({
    -- One-key binds
    { '<leader>o',  '<cmd>only<cr>',                     desc = 'Only' },
    { '<leader>n',  '<cmd>enew<cr>',                     desc = 'New buffer' },
    { '<leader>t',  '<cmd>terminal<cr>a',                desc = 'New terminal' },
    { '<leader>w',  '<c-w>=',                            desc = 'equal Windows' },
    -- Window keymaps
    { '<leader>w',                                       group = "Window" },
    { '<leader>wf', '<cmd>tabnew<cr>',                   desc = 'create new tab' },
    { '<leader>ws', ':let t:tabname = ""<left>',         desc = 'rename tab' },
    { '<leader>wr', 'gT',                                desc = 'move to left tab' },
    { '<leader>wt', 'gt',                                desc = 'move to right tab' },
    { '<leader>wy', '<cmd>vsplit<cr><cmd>wincmd l<cr>',  desc = 'vertical split' },
    { '<leader>wl', '<cmd>split<cr><cmd>wincmd j<cr>',   desc = 'horizontal split' },
    { '<leader>wn', '<cmd>wincmd h<cr>',                 desc = 'move Left' },
    { '<leader>wu', '<cmd>wincmd k<cr>',                 desc = 'move Up' },
    { '<leader>we', '<cmd>wincmd j<cr>',                 desc = 'move Down' },
    { '<leader>wi', '<cmd>wincmd l<cr>',                 desc = 'move Right' },
    { '<leader>w1', '1gt',                               desc = 'select tab 1' },
    { '<leader>w2', '2gt',                               desc = 'select tab 2' },
    { '<leader>w3', '3gt',                               desc = 'select tab 3' },
    { '<leader>w4', '4gt',                               desc = 'select tab 4' },
    { '<leader>w5', '5gt',                               desc = 'select tab 5' },
    { '<leader>w6', '6gt',                               desc = 'select tab 6' },
    { '<leader>w7', '7gt',                               desc = 'select tab 7' },
    { '<leader>w8', '8gt',                               desc = 'select tab 8' },
    { '<leader>w9', '9gt',                               desc = 'select tab 9' },
    -- Find
    { '<leader>s',                                       group = "Search" },
    { '<leader>/',  '<cmd>FzfLua lgrep_curbuf<cr>',      desc = "grep Buffer" },
    { '<leader>sf', '<cmd>FzfLua files<cr>',             desc = "Files" },
    { '<leader>sg', '<cmd>FzfLua grep<cr>',              desc = "Grep dir" },
    { '<leader>sj', '<cmd>FzfLua jumps<cr>',             desc = "Jumplist" },
    { '<leader>sm', '<cmd>FzfLua marks<cr>',             desc = "Marks" },
    { '<leader>sr', '<cmd>FzfLua registers<cr>',         desc = "Registers" },
    { '<leader>sk', '<cmd>FzfLua keymaps<cr>',           desc = "Keymaps" },
    { '<leader>sc', '<cmd>FzfLua command_history<cr>',   desc = "Commands" },
    { '<leader>sh', '<cmd>FzfLua history<cr>',           desc = "file History" },
    { '<leader>sb', '<cmd>FzfLua lines<cr>',             desc = "Buffer lines" },
    { '<leader>sq', '<cmd>FzfLua quickfix<cr>',          desc = "Quickfix" },
    -- Formatting
    { '<leader>f',                                                                                              group = "Format" },
    { '<leader>fs', '<cmd>%s/^.*$/\'&\',/g<CR>G$xgg0vG$"+y',                                                    desc = 'SQLify' },
    { '<leader>fo', '<cmd>%s/^.*$/& OR /g<CR>G$xxxgg0vG$"+y',                                                   desc = 'ORify' },
    { '<leader>fx', '<cmd>%! xmllint --format -<cr>',                                                           desc = 'XML prettyprint' },
    { '<leader>fj', '<cmd>%! jq .<cr>',                                                                         desc = 'Json prettyprint' },
    { '<leader>fc', 'ggI|<esc>A|<esc>:s/\\s\\+/\\|\\|/g<cr>:%s/\\s\\+/\\|/g<cr>:%s/^/\\|/g<cr>:%s/$/\\|/g<cr>', desc = 'Confluence prettyprint' },
    { '<leader>fd', ':%s/\\(\\d\\{2}:\\d\\{2}\\):\\d\\{2}\\.\\d\\{3}/\\1/g<cr>',                                desc = 'Dateformat' },
    { '<leader>fm', '0y$!!echo "$((<c-r>"))"<cr>O<esc>p',                                                       desc = 'Math' },
    -- Visual Formatting
    { '<leader>f',                                                                                              group = "Format", mode = 'v' },
    { '<leader>fs', "J<cmd>s/ /','/g<cr>I'<esc>A'<esc>V\"+y",                                                   mode = 'v', desc = 'Sqlify' },
    { '<leader>fo', "J<cmd>s/ / OR /g<cr>V\"+y",                                                                mode = 'v', desc = 'ORify' },
    { '<leader>fc', "<esc>o```<esc>gvo<esc>O```",                                                               mode = 'v', desc = 'markup Code-block' },
    -- Quickfix
    { '<leader>l',                                       group = "quickfixList" },
    { '<leader>lo', '<cmd>copen<CR>',                    desc = 'Open quickfix list' },
    { '<leader>lq', '<cmd>cclose<CR>',                   desc = 'Quit quickfix list' },
    { '<leader>ln', '<cmd>cnext<CR>',                    desc = 'Next quickfix item' },
    { '<leader>lp', '<cmd>cprev<CR>',                    desc = 'previous quickfix item' },
    { '<leader>lgg','<cmd>cfirst<CR>',                   desc = 'first quickfix item' },
    { '<leader>lG', '<cmd>clast<CR>',                    desc = 'last quickfix item' },
    { '<leader>lc', 'o- [ ] ',                           desc = 'create markdown Checkbox' },
    { '<leader>lv', '<cmd>vsplit<cr><cmd>cnext<cr>',     desc = 'open next quickfix-item in Vertical split' },
    { '<leader>ls', '<cmd>split<cr><cmd>cnext<cr>',      desc = 'open next quickfix-item in Split' },
    -- Markdown
    { '<leader>lx', '0/\\[.]<CR><right>rx<down>',        desc = 'mark checkbox done' },
    { '<leader>l-', '0/\\[.]<CR><right>r-<down>',        desc = 'mark checkbox progress' },
    { '<leader>l ', '0/\\[.]<CR><right>r <down>',        desc = 'mark checkbox unmarked' },
    { '<leader>lt', 'V<cmd>s/\\%V / | /g<CR>I| <esc>A |<esc><down>',                                          desc = 'markdown Table line' },
    { '<leader>lh', 'yyV<cmd>s/\\%V / | /g<CR>I| <esc>A |<esc>pV<cmd>s/\\%V\\w*/ | --- /g<CR>A |<esc><down>', desc = 'markdown table Header' },
    -- Run macros
    { '<leader>ll', '@q',                                desc = 'run q-macro' },
    { '<leader>lu', '@w',                                desc = 'run w-macro' },
    { '<leader>ly', '@f',                                desc = 'run f-macro' },
    -- Git
    { '<leader>g',                                       group = "Gitsigns" },
    { '<leader>ga', '<cmd>!git add %<cr>',               desc = 'Add' },
    { '<leader>gp', '<cmd>!git pull<cr>',                desc = 'pull' },
    { '<leader>gP', '<cmd>!git push<cr>',                desc = 'Push' },
    { '<leader>gs', '<cmd>!git stash<cr>',               desc = 'Stash' },
    { '<leader>gS', '<cmd>!git stash pop<cr>',           desc = 'Stash pop' },
    { '<leader>gn', require('gitsigns').next_hunk,       desc = 'Next hunk' },
    { '<leader>gp', require('gitsigns').prev_hunk,       desc = 'Prev hunk' },
    { '<leader>gB', require('gitsigns').blame,           desc = 'Blame' },
    { '<leader>gb', require('gitsigns').blame_line,      desc = 'blame' },
    { '<leader>gr', require('gitsigns').reset_hunk,      desc = 'Reset Hunk' },
    { '<leader>gv', require('gitsigns').preview_hunk,    desc = 'preView Hunk' },
    -- Macros
    { '<leader>m',                                       group = "Macros" },
    { '<leader>ms', '<cmd>set lazyredraw<cr>',           desc = 'Silence macros' },
    { '<leader>mu', '/version<cr>$F.<c-a>',              desc = 'Update version' },
    { '<leader>me', 'yy!!bash<CR>Po<Esc><Up>',           desc = 'Execute line as command' },
    { '<leader>md', '<cmd>windo diffthis<cr>',           desc = 'Diffthis' },
    { '<leader>mo', '<cmd>windo diffoff<cr>',            desc = 'Diff Off' },
    { '<leader>m',                                       group = "Macros", mode = 'v' },
    -- Document LSP
    { '<leader>d',                                       group = "Document LSP" },
})

-- Moved from wk.add, because refresh of command line did not happen
vim.keymap.set({ 'n' }, '<leader>gc', '<cr>:!git commit -am ""<left>',     { desc = 'Commit' })
vim.keymap.set({ 'n' }, '<leader>mc', ':%!',                               { desc = 'Run command on buffer' })
vim.keymap.set({ 'n' }, '<leader>mg', 'yiw:%g/<C-r>"/d<Left><Left>',       { desc = 'G-remove template' })
vim.keymap.set({ 'n' }, '<leader>mG', 'yiw:%g!/<C-r>"/d<Left><Left>',      { desc = 'G-invert-remove template' })
vim.keymap.set({ 'n' }, '<leader>mr', 'yiw:%s/<C-r>"//g<Left><Left>',      { desc = 'search-Replace template' })
vim.keymap.set({ 'n' }, '<leader>mR', 'yiw:windo%s/<C-r>"//g<Left><Left>', { desc = 'search-Replace template across windows' })
vim.keymap.set({ 'v' }, '<leader>mr', ':s/\\%V//g<left><left><left>',      { desc = 'search-Replace template' })
vim.keymap.set({ 'v' }, '<leader>mg', ':g/^/norm! @',                      { desc = 'run macro template' })
vim.keymap.set({ 'n' }, '<leader>ft', ':%! tr -s " " | column -t',         { desc = 'Table prettyprint' })
vim.keymap.set({ 'n' }, '<leader>N',  ':enew<cr>:w ~/Documents/notes/<c-r>=strftime(\'%Y-%m-%d\')<cr>-.md<left><left><left>', { desc = 'New note' })

-- Misc
-- Rename the variable under your cursor.
vim.keymap.set({ 'n' }, '<leader>dr', '<cmd>lua vim.lsp.buf.rename()<cr>', { desc = 'Rename' })
-- Create markdown link to file
vim.keymap.set({ 'n' }, '<leader>ff', 'o[notat]()<esc><Left>"%pdd',        { desc = 'File markdown to register' })
