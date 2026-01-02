require("config.lazy")

vim.o.expandtab = true   -- Use spaces instead of tabs
vim.o.shiftwidth = 4     -- Number of spaces for indentation
vim.o.tabstop = 4        -- Number of spaces a tab counts for
vim.o.softtabstop = 4    -- Number of spaces when hitting <Tab>
vim.o.nrformats = 'unsigned'

vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
vim.o.foldlevel = 99

-- vim.opt.clipboard = "unnamedplus"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

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

vim.diagnostic.config({
  virtual_text = true,
  update_in_insert = false,
})

-- Enable mouse mode
-- vim.o.mouse = 'i'

require('keybinds')
require('autocmds')
require('functions')

require("catppuccin").setup({
  flavour = "mocha",
  transparent_background = false,
  dim_inactive = {
    enabled = true,
    shade = "light",
    percentage = 0.5,
  },
  highlight_overrides = {
    mocha = function (C)
      return { ["@string"] = { fg = C.teal },
      }
    end
    }
})

vim.cmd.colorscheme 'catppuccin'

require("flash").toggle(false)

require('gitsigns').setup()

local function tab_name()
  return vim.t.tabname or "todo"
end

require('lualine').setup {
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = { { 'filename', path=1 } },
    lualine_x = {'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  tabline = {
    lualine_a = { tab_name },
    lualine_z = { 'tabs' },
  },
  inactive_sections = {
    lualine_c = { { 'filename', path=1 } },
    lualine_x = {'location'},
  },
}

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
