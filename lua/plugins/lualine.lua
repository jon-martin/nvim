local function tab_name()
  return vim.t.tabname or "tab"
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
