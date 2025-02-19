require("config.lazy")

vim.o.expandtab = true   -- Use spaces instead of tabs
vim.o.shiftwidth = 4     -- Number of spaces for indentation
vim.o.tabstop = 4        -- Number of spaces a tab counts for
vim.o.softtabstop = 4    -- Number of spaces when hitting <Tab>

vim.opt.clipboard = "unnamedplus"
vim.opt.number = true
vim.opt.relativenumber = true

-- Nowrap
vim.opt.wrap = false

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Split direction
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- Enable mouse mode
-- vim.o.mouse = 'i'

-- vim.keymap.set({ 'n', 'v' }, 'l', ':WhichKey l<CR>', { noremap = true, silent = true })
-- vim.keymap.set({ 'n', 'v' }, 'h', ':WhichKey h<CR>', { noremap = true, silent = true })

-- vim.keymap.set("n", "l", "<Nop>", { desc = "quickfix stuff" })
-- vim.keymap.set("n", "h", "<Nop>", { desc = "git stuff" })

require('keybinds')
require('autocmds')
require('functions')

require("catppuccin").setup({
  flavour = "mocha",
  -- transparent_background = true, -- disables setting the background color.
  dim_inactive = {
    enabled = true,       -- dims the background color of inactive window
    shade = "light",
    percentage = 0.5,     -- percentage of the shade to apply to the inactive window
  },
})

vim.cmd.colorscheme 'catppuccin'

require("flash").toggle(false)
require('mini.files').setup({
  mappings = {
    close       = '<esc>',
    go_in       = '<tab>',
    go_in_plus  = '<cr>',
    go_out      = '<c-bc>',
    go_out_plus = '<bs>',
    reset       = '-',
    reveal_cwd  = '@',
    show_help   = 'g?',
    synchronize = '=',
    trim_left   = '<',
    trim_right  = '>',
  },
  windows = {
    preview = true,
    -- Width of focused window
    width_focus = 50,
    -- Width of non-focused window
    width_nofocus = 15,
    -- Width of preview window
    width_preview = 75,
  }
})
require('mini.ai').setup()
require('mini.operators').setup()

require('gitsigns').setup()

local theme = {

  current = { fg = "#cad3f5", bg = "transparent", style = "bold" },
  not_current = { fg = "#5b6078", bg = "transparent" },

  fill = { bg = "transparent" },
}

require("tabby.tabline").set(function(line)
  return {
    line.tabs().foreach(function(tab)
      local hl = tab.is_current() and theme.current or theme.not_current
      return {
        line.sep(" ", hl, theme.fill),
        tab.name(),
        line.sep(" ", hl, theme.fill),
        hl = hl,
      }
    end),
    line.spacer(),
    line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
      local hl = win.is_current() and theme.current or theme.not_current

      return {
        line.sep(" ", hl, theme.fill),
        win.buf_name(),
        line.sep(" ", hl, theme.fill),
        hl = hl,
      }
    end),
    hl = theme.fill,
  }
end)


local wk = require("which-key")
wk.add({
  -- Window management
  -- { '<leader>b',  require('telescope.builtin').buffers, desc = 'find existing Buffers' },
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
  -- { '<leader>sf', require('telescope.builtin').find_files, desc = 'search Files' },
  -- { '<leader>sh', require('telescope.builtin').help_tags, desc = 'search Help' },
  -- { '<leader>sw', require('telescope.builtin').grep_string, desc = 'search current Word' },
  -- { '<leader>sg', desc = 'search by Grep' },
  -- { '<leader>se', require('telescope.builtin').diagnostics, desc = 'search diagnostics' },
  -- { '<leader>sj', require('telescope.builtin').jumplist, desc = 'search Jumplist' },
  -- { '<leader>sd', '<cmd>lua require("telescope").extensions.file_browser.file_browser({cwd = "~/Documents"})<cr>', desc = 'search Documents' },
  -- { '<leader>s"', require('telescope.builtin').registers, desc = 'search registers' },
  -- { '<leader>sm', require('telescope.builtin').marks, desc = 'search Marks' },
  -- { '<leader>sn', '<cmd>Telescope live_grep search_dirs={"~/Documents/notes/"}<cr>', desc = 'search Notes' },
  -- { '<leader>sN', '<cmd>Telescope find_files search_dirs={"~/Documents/notes/"}<cr>', desc = 'search Notefiles' },
  -- { '<leader>ss', require('telescope.builtin').git_status, desc = 'search Git Status' },
  -- { '<leader>sS', require('telescope.builtin').git_stash, desc = 'search Git Stash' },
  -- { '<leader>sb', require('telescope.builtin').git_bcommits, desc = 'search Git Buffer commits' },
  -- { '<leader>sc', require('telescope.builtin').git_commits, desc = 'search Git Commits' },
  -- { '<leader>sr', require('telescope.builtin').git_branches, desc = 'search Git bRanches' },
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
  { 'hb',         require('gitsigns').blame_line, desc = 'blame' },
  { 'hN',         require('gitsigns').prev_hunk, desc = 'go to Previous Hunk' },
  { 'hn',         require('gitsigns').next_hunk, desc = 'go to Next Hunk' },
  { 'hr',         require('gitsigns').reset_hunk, desc = 'reset Hunk' },
  { 'hv',         require('gitsigns').preview_hunk, desc = 'preView Hunk' },
})

-- Extra keymaps with explicit modes
vim.keymap.set("v", "<leader>y", '"+y', { desc = "Yank to clipboard" }) -- Visual mode

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
