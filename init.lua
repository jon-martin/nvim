require("config.lazy")

vim.o.expandtab = true   -- Use spaces instead of tabs
vim.o.shiftwidth = 4     -- Number of spaces for indentation
vim.o.tabstop = 4        -- Number of spaces a tab counts for
vim.o.softtabstop = 4    -- Number of spaces when hitting <Tab>

-- vim.opt.clipboard = "unnamedplus"
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
  { '<leader>o',  '<cmd>only<cr>', desc = 'Only' },
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
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
