-- Set <space> as the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.loader.enable()

-- package manager
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',
      'nvim-telescope/telescope-live-grep-args.nvim',

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },

      -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',
    },
  },

  -- Fuzzy Finder (files, lsp, etc)
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
    },
  },

  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
  },

  { import = 'custom.plugins' },
}, {})

-- [[ Setting options ]]

require('ibl').setup()

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

require("catppuccin").setup({
  -- transparent_background = true, -- disables setting the background color.
  dim_inactive = {
    enabled = true,       -- dims the background color of inactive window
    shade = "light",
    percentage = 0.5,     -- percentage of the shade to apply to the inactive window
  },
})

vim.cmd.colorscheme 'catppuccin'

require("flash").toggle(false)

-- Set highlight on search
vim.o.hlsearch = true

-- Command menu settings
vim.o.wildmode = "longest,list:longest,full"

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
-- vim.o.mouse = 'i'

-- Nowrap
vim.opt.wrap = false

-- Split direction
vim.opt.splitright = true
vim.opt.splitbelow = true

-- line number style
vim.wo.relativenumber = true
vim.opt.cursorline = true

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- [[ Highlight on yank ]]
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
vim.o.foldlevel = 100

local select_one_or_multi = function(prompt_bufnr)
  local picker = require('telescope.actions.state').get_current_picker(prompt_bufnr)
  local multi = picker:get_multi_selection()
  if not vim.tbl_isempty(multi) then
    require('telescope.actions').close(prompt_bufnr)
    for _, j in pairs(multi) do
      if j.path ~= nil then
        vim.cmd(string.format('%s %s', 'edit', j.path))
      end
    end
  else
    require('telescope.actions').select_default(prompt_bufnr)
  end
end

-- [[ Configure Telescope ]]
local actions = require "telescope.actions"
local lga_actions = require("telescope-live-grep-args.actions")
local fb_actions = require "telescope._extensions.file_browser.actions"

require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-q>'] = actions.send_selected_to_qflist + actions.open_qflist,
        ['<CR>'] = select_one_or_multi,
        ['<C-h>'] = "which_key",
        ['<C-o>'] = require('telescope.actions').delete_buffer,
        ["<C-k>"] = lga_actions.quote_prompt(),
        ["<C-f>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
        ["<C-t>"] = lga_actions.quote_prompt({ postfix = " -t" }),
        -- freeze the current list and start a fuzzy search in the frozen list
        ["<C-space>"] = actions.to_fuzzy_refine,
      }
    },
  },
}

require("telescope").setup {
  extensions = {
    file_browser = {
      files = false,
      hide_parent_dir = true,
      mappings = {
        ["i"] = {
          ['<CR>'] = select_one_or_multi,
          ["<C-x>"] = fb_actions.toggle_browser,
        },
        ["n"] = {
          ['<CR>'] = select_one_or_multi,
          ["x"] = fb_actions.toggle_browser,
        },
      },
    },
  },
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')
pcall(require('telescope').load_extension, 'live_grep_args')
pcall(require('telescope').load_extension, 'file_browser')

-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
require('nvim-treesitter.configs').setup {
  -- Add languages to be installed here that you want installed for treesitter
  ensure_installed = { 'go', 'lua', 'python', 'tsx', 'javascript', 'typescript', 'vimdoc', 'vim', 'json', 'yaml' },

  -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
  auto_install = false,

  highlight = { enable = true },
  indent = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<c-space>',
      node_incremental = '<c-space>',
      scope_incremental = '<c-s>',
      node_decremental = '<M-space>',
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['aa'] = '@parameter.outer',
        ['ia'] = '@parameter.inner',
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = false,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
    swap = {
      enable = false,
      swap_next = {
        ['<leader>a'] = '@parameter.inner',
      },
      swap_previous = {
        ['<leader>A'] = '@parameter.inner',
      },
    },
  },
}


-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>de', vim.diagnostic.open_float, { desc = 'open floating Diagnostic mEssage' })
vim.keymap.set('n', '<leader>dq', vim.diagnostic.setloclist, { desc = 'open Diagnostics list' })

-- [[ Configure LSP ]]
local on_attach = function(_, bufnr)
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('gd', vim.lsp.buf.definition, 'Goto Definition')
  nmap('gr', require('telescope.builtin').lsp_references, 'Goto References')
  nmap('gI', vim.lsp.buf.implementation, 'Goto Implementation')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, 'Document Symbols')
  nmap('<leader>dr', vim.lsp.buf.rename, 'Document Rename')
  nmap('<leader>da', vim.lsp.buf.code_action, 'Document code Action')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end

local servers = {
  -- clangd = {},
  -- gopls = {},
  ruff = {},
  -- rust_analyzer = {},
  -- tsserver = {},
  -- html = { filetypes = { 'html', 'twig', 'hbs'} },
  bashls = {},

  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
}

-- Setup neovim lua configuration
require('neodev').setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
      filetypes = (servers[server_name] or {}).filetypes,
    }
  end
}

-- [[ Configure nvim-cmp ]]
local cmp = require 'cmp'
local luasnip = require 'luasnip'
require('luasnip.loaders.from_vscode').lazy_load {
  exclude = { "loremipsum" },
}
luasnip.config.setup {}

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete {},
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    -- { name = 'codeium' },
  },
}

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
