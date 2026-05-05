-- Leaders
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Save undo history
vim.o.undofile = true

vim.opt.expandtab = true   -- Use spaces instead of tabs
vim.opt.shiftwidth = 4     -- Number of spaces for indentation
vim.opt.tabstop = 4        -- Number of spaces a tab counts for
vim.opt.softtabstop = 4    -- Number of spaces when hitting <Tab>
vim.opt.nrformats = 'unsigned'

vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldlevel = 99

-- vim.opt.clipboard = "unnamedplus"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

-- Nowrap
vim.opt.wrap = false

-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Split direction
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

vim.cmd.colorscheme('catppuccin')

vim.diagnostic.config({
  virtual_text = true,
  update_in_insert = false,
})
