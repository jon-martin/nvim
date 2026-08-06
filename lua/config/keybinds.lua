-- Clipboard
vim.keymap.set('n', '<m-a>', 'ggVG',                     { desc = 'visual select all' })
vim.keymap.set('n', '<m-x>', '"+yydd',                   { desc = 'cut to clipboard' })
vim.keymap.set('n', '<m-c>', '"+yyj',                    { desc = 'copy to clipboard' })
vim.keymap.set('v', '<m-c>', '"+y',                      { desc = 'copy to clipboard' })
vim.keymap.set('n', '<m-v>', '"+P<down>',                { desc = 'paste from clipboard' })
vim.keymap.set('v', '<m-v>', '"+p',                      { desc = 'paste from clipboard' })
vim.keymap.set('n', '<esc>', '<cmd>nohlsearch<cr>',                          { noremap = true, silent = true, desc = 'Remove search highlights' })

-- Terminal
vim.keymap.set('t', '<esc>', '<c-\\><c-n>',              { desc = 'esc' })
vim.keymap.set('t', 'ZQ', '<c-\\><c-n>ZQ',               { desc = 'exit terminal' })
vim.keymap.set('t', '<leader>1', '<c-\\><c-n>1gt',       { desc = 'select tab 1' })
vim.keymap.set('t', '<leader>2', '<c-\\><c-n>2gt',       { desc = 'select tab 2' })
vim.keymap.set('t', '<leader>3', '<c-\\><c-n>3gt',       { desc = 'select tab 3' })
vim.keymap.set('t', '<leader>4', '<c-\\><c-n>4gt',       { desc = 'select tab 4' })
vim.keymap.set('t', '<leader>5', '<c-\\><c-n>5gt',       { desc = 'select tab 5' })
vim.keymap.set('t', '<leader>6', '<c-\\><c-n>6gt',       { desc = 'select tab 6' })
vim.keymap.set('t', '<leader>7', '<c-\\><c-n>7gt',       { desc = 'select tab 7' })
vim.keymap.set('t', '<leader>8', '<c-\\><c-n>8gt',       { desc = 'select tab 8' })
vim.keymap.set('t', '<leader>9', '<c-\\><c-n>9gt',       { desc = 'select tab 9' })

-- LSP
vim.keymap.set("n", "gd", vim.lsp.buf.definition,        { desc = 'definition' })
vim.keymap.set("n", "K", vim.lsp.buf.hover)

local wk = require("which-key")

wk.add({
    -- One-key binds
    { '<leader>n', '<cmd>wincmd h<cr>',                  desc = 'move left' },
    { '<leader>i', '<cmd>wincmd l<cr>',                  desc = 'move right' },
    { '<leader>u', '<cmd>wincmd k<cr>',                  desc = 'move Up' },
    { '<leader>e', '<cmd>wincmd j<cr>',                  desc = 'move Down' },
    { '<leader>y', '<cmd>vsplit<cr><cmd>wincmd l<cr>',   desc = 'vertical split' },
    { '<leader>l', '<cmd>split<cr><cmd>wincmd j<cr>',    desc = 'horizontal split' },
    { '<leader>b', '<cmd>FzfLua buffers<cr>',            desc = 'Buffers' },
    { '<leader>/', '<cmd>FzfLua lgrep_curbuf<cr>',       desc = 'grep Buffer' },
    { '<leader>?', '<cmd>FzfLua history<cr>',            desc = 'file History' },
    { '<leader>-', '<cmd>NvimTreeToggle<cr>',            desc = 'Explorer' },
    { '<leader>1', '1gt',                                desc = 'select tab 1' },
    { '<leader>2', '2gt',                                desc = 'select tab 2' },
    { '<leader>3', '3gt',                                desc = 'select tab 3' },
    { '<leader>4', '4gt',                                desc = 'select tab 4' },
    { '<leader>5', '5gt',                                desc = 'select tab 5' },
    { '<leader>6', '6gt',                                desc = 'select tab 6' },
    { '<leader>7', '7gt',                                desc = 'select tab 7' },
    { '<leader>8', '8gt',                                desc = 'select tab 8' },
    { '<leader>9', '9gt',                                desc = 'select tab 9' },
    { '<leader>w', '<c-w>=',                             desc = 'equal Windows' },
    { '<leader>o', '<cmd>only<cr>',                      desc = 'Only' },
    { '<leader>z', '<c-w>|<c-w>_',                       desc = 'Zoom' },
    { '<leader>t', '<cmd>tabnew<cr>',                    desc = 'create new Tab' },
    -- Find
    { '<leader>s',                                       group = 'Search' },
    { '<leader>sf', '<cmd>FzfLua files<cr>',             desc = 'Files' },
    { '<leader>sr', '<cmd>FzfLua live_grep<cr>',         desc = 'Ripgrep' },
    { '<leader>sd', '<cmd>FzfLua grep<cr>',              desc = 'Double grep' },
    { '<leader>sj', '<cmd>FzfLua jumps<cr>',             desc = 'Jumplist' },
    { '<leader>sm', '<cmd>FzfLua marks<cr>',             desc = 'Marks' },
    { '<leader>s"', '<cmd>FzfLua registers<cr>',         desc = 'Registers' },
    { '<leader>sk', '<cmd>FzfLua keymaps<cr>',           desc = 'Keymaps' },
    { '<leader>sc', '<cmd>FzfLua command_history<cr>',   desc = 'Commands' },
    { '<leader>sb', '<cmd>FzfLua lines<cr>',             desc = 'Buffer lines' },
    { '<leader>sq', '<cmd>FzfLua quickfix<cr>',          desc = 'Quickfix' },
    { '<leader>sl', '<cmd>FzfLua loclist<cr>',           desc = 'Location list' },
    { '<leader>s*', '<cmd>FzfLua grep_cword<cr>',        desc = 'grep cword' },
    { '<leader>sz', '<cmd>FzfLua<cr>',                   desc = 'fZflua' },
    { '<leader>sg',                                      group = 'Git' },
    { '<leader>sgs', '<cmd>FzfLua git_status<cr>',       desc = 'git Status' },
    { '<leader>sgh', '<cmd>FzfLua git_stash<cr>',        desc = 'git stasH' },
    { '<leader>sgc', '<cmd>FzfLua git_commits<cr>',      desc = 'git Commits' },
    { '<leader>sgb', '<cmd>FzfLua git_bcommits<cr>',     desc = 'git Buffer commits' },
    { '<leader>sgr', '<cmd>FzfLua git_branches<cr>',     desc = 'git bRanches' },
    -- Formatting
    { '<leader>f',                                                                                              group = 'Format' },
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
    -- Quickfix list
    { '<leader>q',                                       group = 'Quickfix-list' },
    { '<leader>qo', '<cmd>copen<CR>',                    desc = 'Open quickfix list' },
    { '<leader>qq', '<cmd>cclose<CR>',                   desc = 'Quit quickfix list' },
    { '<leader>qv', '<cmd>vsplit<cr><cmd>cnext<cr>',     desc = 'open next quickfix-item in Vertical split' },
    { '<leader>qh', '<cmd>split<cr><cmd>cnext<cr>',      desc = 'open next quickfix-item in Horizontal split' },
    -- Helpers
    { '<leader>h',                                       group = 'Helpers' },
    { '<leader>hn',  '<cmd>enew<cr>',                    desc = 'New buffer' },
    { '<leader>ht',  '<cmd>terminal<cr>a',               desc = 'new Terminal' },
    { '<leader>hc', 'o- [ ] ',                           desc = 'create markdown Checkbox' },
    { '<leader>hx', '0/\\[.]<CR><right>rx<down>',        desc = 'mark checkbox done' },
    { '<leader>h-', '0/\\[.]<CR><right>r-<down>',        desc = 'mark checkbox progress' },
    { '<leader>h ', '0/\\[.]<CR><right>r <down>',        desc = 'mark checkbox unmarked' },
    { '<leader>hl', '@q',                                desc = 'run q-macro' },
    { '<leader>hu', require("undotree").open,            desc = 'Undotree' },
    { '<leader>hf', 'V%zf',                              desc = 'Fold' },
    { '<leader>ho', '<cmd>lopen<CR>',                    desc = 'Open location list' },
    { '<leader>hq', '<cmd>lclose<CR>',                   desc = 'Quit location list' },
    { '<leader>hv', '<cmd>vsplit<cr><cmd>lnext<cr>',     desc = 'open next location-item in Vertical split' },
    { '<leader>hh', '<cmd>split<cr><cmd>lnext<cr>',      desc = 'open next location-item in Horizontal split' },
    { '<leader>hw', '<cmd>lcd %:p:h<cr>',                desc = 'set file path as window working directory' },
    -- Git
    { '<leader>g',                                       group = 'Gitsigns' },
    { '<leader>ga', '<cmd>!git add %<cr>',               desc = 'Add' },
    { '<leader>gp', '<cmd>!git pull<cr>',                desc = 'pull' },
    { '<leader>gP', '<cmd>!git push<cr>',                desc = 'Push' },
    { '<leader>gs', '<cmd>!git stash<cr>',               desc = 'Stash' },
    { '<leader>gS', '<cmd>!git stash pop<cr>',           desc = 'Stash pop' },
    { '<leader>gn', require('gitsigns').next_hunk,       desc = 'Next hunk' },
    { '<leader>gN', require('gitsigns').prev_hunk,       desc = 'Prev hunk' },
    { '<leader>gB', require('gitsigns').blame,           desc = 'Blame' },
    { '<leader>gb', require('gitsigns').blame_line,      desc = 'blame' },
    { '<leader>gr', require('gitsigns').reset_hunk,      desc = 'Reset Hunk' },
    { '<leader>gv', require('gitsigns').preview_hunk,    desc = 'preView Hunk' },
    -- Macros
    { '<leader>m',                                       group = 'Macros' },
    { '<leader>ms', '<cmd>set lazyredraw<cr>',           desc = 'Silence macros' },
    { '<leader>mu', '/version<cr>$F.<c-a>',              desc = 'Update version' },
    { '<leader>me', 'yy!!bash<CR>Po<Esc><Up>',           desc = 'Execute line as command' },
    { '<leader>md', '<cmd>windo diffthis<cr>',           desc = 'Diffthis' },
    { '<leader>mo', '<cmd>windo diffoff<cr>',            desc = 'Diff Off' },
    { '<leader>m',                                       group = 'Macros', mode = 'v' },
    -- Document LSP
    { '<leader>d',                                       group = 'Document LSP' },
})

-- Moved from wk.add, because refresh of command line did not happen
vim.keymap.set({ 'n' }, '<leader>N',  ':enew<cr>:w ~/Documents/notes/<c-r>=strftime(\'%Y-%m-%d\')<cr>-.md<left><left><left>', { desc = 'New note' })
vim.keymap.set({ 'n' }, '<leader>gc', '<cr>:!git commit -am ""<left>',     { desc = 'Commit' })
vim.keymap.set({ 'n' }, '<leader>mc', ':%!',                               { desc = 'Run command on buffer' })
vim.keymap.set({ 'n' }, '<leader>mg', 'yiw:%g/<C-r>"/d<Left><Left>',       { desc = 'G-remove template' })
vim.keymap.set({ 'n' }, '<leader>mG', 'yiw:%g!/<C-r>"/d<Left><Left>',      { desc = 'G-invert-remove template' })
vim.keymap.set({ 'n' }, '<leader>mr', 'yiw:%s/<C-r>"//g<Left><Left>',      { desc = 'search-Replace template' })
vim.keymap.set({ 'n' }, '<leader>mR', 'yiw:windo%s/<C-r>"//g<Left><Left>', { desc = 'search-Replace template across windows' })
vim.keymap.set({ 'v' }, '<leader>mr', ':s/\\%V//g<left><left><left>',      { desc = 'search-Replace template' })
vim.keymap.set({ 'v' }, '<leader>mg', ':g/^/norm! @',                      { desc = 'run macro template' })
vim.keymap.set({ 'n' }, '<leader>ft', ':%! tr -s " " | column -t',         { desc = 'Table prettyprint' })

---- Misc
-- Flash
vim.keymap.set({ 'n', 'x', 'o' }, 's', function() require('flash').jump() end,         { desc = 'Flash'})
vim.keymap.set({ 'o' }, 'r', function() require('flash').remote() end,                 { desc = 'Remote Flash' })
-- Rename the variable under your cursor.
vim.keymap.set({ 'n' }, '<leader>dr', '<cmd>lua vim.lsp.buf.rename()<cr>', { desc = 'Rename' })
-- Create markdown link to file
vim.keymap.set({ 'n' }, '<leader>ff', 'o[notat]()<esc><Left>"%pdd',        { desc = 'File markdown to register' })
-- Rename tab
vim.keymap.set({ 'n' }, '<leader>r', ':let t:tabname = ""<left>',          { desc = 'rename tab' })
