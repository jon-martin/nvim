require("config.lazy")

vim.o.expandtab = true   -- Use spaces instead of tabs
vim.o.shiftwidth = 4     -- Number of spaces for indentation
vim.o.tabstop = 4        -- Number of spaces a tab counts for
vim.o.softtabstop = 4    -- Number of spaces when hitting <Tab>

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

require('lualine').setup {
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
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


-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
