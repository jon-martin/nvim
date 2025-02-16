return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
	defaults = {
	-- your configuration comes here
	-- or leave it empty to use the default settings
	-- refer to the configuration section below
	}
    },
    keys = { },
    config = function(_, opts)
	local wk = require("which-key")
	wk.add({
	    -- Window management
	    { '<leader>,',  '<cmd>only<cr>', desc = 'close other windows' },
	    { '<leader>b',  require('telescope.builtin').buffers, desc = 'find existing Buffers' },
	    { '<leader>N',  '<cmd>lua MiniFiles.open(\'~/Documents/notes/\')<CR><cmd>put=strftime(\'%Y-%m-%d\')<CR>A-.md<left><left><left>', desc = 'New note' },
	    { '<leader>o',  '<cmd>only<cr>', desc = 'Only' },
	    { '<leader>n',  '<cmd>enew<cr>', desc = 'New buffer' },
	    { '<leader>w',  '<cmd>tabnew<cr><cmd>lua require("telescope").extensions.file_browser.file_browser({cwd = "~/Documents"})<cr>', desc = 'new Window' },
	    -- Formatting
	    { '<leader>f',  group = "Format" },
	    { '<leader>fs', '<cmd>%s/^.*$/\'&\',/g<CR>G$xgg0vG$"+y', desc = 'SQLify' },
	    { '<leader>fx', '<cmd>%! xmllint --format -<cr>', desc = 'XML prettyprint' },
	    { '<leader>fj', '<cmd>%! jq .<cr>', desc = 'Json prettyprint' },
	    { '<leader>fc', 'ggI|<esc>A|<esc>:s/\\s\\+/\\|\\|/g<cr>:%s/\\s\\+/\\|/g<cr>:%s/^/\\|/g<cr>:%s/$/\\|/g<cr>', desc = 'Confluence prettyprint' },
	    { '<leader>fd', ':%s/\\(\\d\\{2}:\\d\\{2}\\):\\d\\{2}\\.\\d\\{3}/\\1/g<cr>', desc = 'Dateformat' },
	    -- Macros
	    { '<leader>m',  group = "Macros" },
	    { '<leader>ms', '<cmd>set lazyredraw<cr>', desc = 'Silence macros' },
	    { '<leader>mu', '/version<cr>$F.<c-a>', desc = 'Update version' },
	    { '<leader>me', 'yy!!bash<CR>Po<Esc><Up>', desc = 'Execute line as command' },
	    { '<leader>md', '<cmd>windo diffthis<cr>', desc = 'Diffthis' },
	    { '<leader>mo', '<cmd>windo diffoff<cr>', desc = 'Diff Off' },
	    -- Search commands
	    { '<leader>s',  group = "Search commands" },
	    { '<leader>sf', require('telescope.builtin').find_files, desc = 'search Files' },
	    { '<leader>sh', require('telescope.builtin').help_tags, desc = 'search Help' },
	    { '<leader>sw', require('telescope.builtin').grep_string, desc = 'search current Word' },
	    -- { '<leader>sg', desc = 'search by Grep' },
	    { '<leader>se', require('telescope.builtin').diagnostics, desc = 'search diagnostics' },
	    { '<leader>sj', require('telescope.builtin').jumplist, desc = 'search Jumplist' },
	    { '<leader>sd', '<cmd>lua require("telescope").extensions.file_browser.file_browser({cwd = "~/Documents"})<cr>', desc = 'search Documents' },
	    { '<leader>s"', require('telescope.builtin').registers, desc = 'search registers' },
	    { '<leader>sm', require('telescope.builtin').marks, desc = 'search Marks' },
	    { '<leader>sn', '<cmd>Telescope live_grep search_dirs={"~/Documents/notes/"}<cr>', desc = 'search Notes' },
	    { '<leader>sN', '<cmd>Telescope find_files search_dirs={"~/Documents/notes/"}<cr>', desc = 'search Notefiles' },
	    { '<leader>ss', require('telescope.builtin').git_status, desc = 'search Git Status' },
	    { '<leader>sS', require('telescope.builtin').git_stash, desc = 'search Git Stash' },
	    { '<leader>sb', require('telescope.builtin').git_bcommits, desc = 'search Git Buffer commits' },
	    { '<leader>sc', require('telescope.builtin').git_commits, desc = 'search Git Commits' },
	    { '<leader>sr', require('telescope.builtin').git_branches, desc = 'search Git bRanches' },
	    -- Quickfix (not working, neither is git-stuff)
	    { 'l',          group = "Quickfix" },
	    { 'lo',         '<cmd>copen<CR>', desc = 'Open quickfix list' },
	    { 'lq',         '<cmd>cclose<CR>', desc = 'Quit quickfix list' },
	    { 'ln',         '<cmd>cnext<CR>', desc = 'Next quickfix item' },
	    { 'lN',         '<cmd>cprev<CR>', desc = 'previous quickfix item' },
	    { 'lgg',        '<cmd>cfirst<CR>', desc = 'first quickfix item' },
	    { 'lG',         '<cmd>clast<CR>', desc = 'last quickfix item' },
	    { 'lc',         'o- [ ] ', desc = 'create markdown Checkbox' },
	    { 'lw',         '<cmd>tcd %:p:h<CR>', desc = 'set buffer as local directory' },
	    { 'lW',         '<cmd>tcd %:p:h:h<CR>', desc = 'set buffer/.. as local directory' },
	    { 'lx',         '0/\\[ \\]<CR><right>rx<down>', desc = 'mark checkbox done' },
	    { 'lt',         'V<cmd>s/\\%V / | /g<CR>I| <esc>A |<esc><down>', desc = 'markdown Table line' },
	    { 'lh',         'yyV<cmd>s/\\%V / | /g<CR>I| <esc>A |<esc>pV<cmd>s/\\%V\\w*/ | --- /g<CR>A |<esc><down>', desc = 'markdown table Header' },
	    { 'll',         '@q', desc = 'run q-macro' },
	    { 'lu',         '@w', desc = 'run w-macro' },
	    { 'ly',         '@f', desc = 'run f-macro' },
	    { 'lv',         '<cmd>vsplit<cr><cmd>cnext<cr>', desc = 'open next quickfix-item in Vertical split' },
	    { 'ls',         '<cmd>split<cr><cmd>cnext<cr>', desc = 'open next quickfix-item in Split' },
	    -- Git
	    { 'h',          group = "Git" },
	    { 'ha',         '<cmd>!git add %<cr>', desc = 'Add' },
	    { 'hB',         '<cmd>Gitsigns blame<cr>', desc = 'Blame' },
	    { 'hC',         '<cmd>Gvdiffsplit!<cr>', desc = 'resolve Conflict' },
	    { 'he',         '<cmd>diffget //2<cr>', desc = 'get lEft' },
	    { 'hi',         '<cmd>diffget //3<cr>', desc = 'get rIght' },
	    { 'hp',         '<cmd>Git pull<cr>', desc = 'pull' },
	    { 'hP',         '<cmd>Git push<cr>', desc = 'Push' },
	    { 'hs',         '<cmd>Git stash<cr>', desc = 'Stash' },
	    { 'hS',         '<cmd>Git stash pop<cr>', desc = 'Stash pop' },
	    -- { 'hb',         require('gitsigns').blame_line, desc = 'blame' },
	    -- { 'hN',         require('gitsigns').prev_hunk, desc = 'go to Previous Hunk' },
	    -- { 'hn',         require('gitsigns').next_hunk, desc = 'go to Next Hunk' },
	    -- { 'hr',         require('gitsigns').reset_hunk, desc = 'reset Hunk' },
	    -- { 'hv',         require('gitsigns').preview_hunk, desc = 'preView Hunk' },
	})

	-- Extra keymaps with explicit modes
	vim.keymap.set("v", "<leader>y", '"+y', { desc = "Yank to clipboard" }) -- Visual mode
    end,
}
