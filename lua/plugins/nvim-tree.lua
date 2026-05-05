local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  -- default mappings
  api.map.on_attach.default(bufnr)

  -- custom mappings
  vim.keymap.set("n", "_",    api.tree.change_root_to_node, { buffer = bufnr, desc = "Change root to node" })
  vim.keymap.del("n", "s",     { buffer = bufnr })
end

-- pass to setup along with your other config
require("nvim-tree").setup({
  on_attach = my_on_attach,
})
