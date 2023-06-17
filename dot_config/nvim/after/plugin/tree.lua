vim.opt.termguicolors = true

local tree = require("nvim-tree")

tree.setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
    float  = {
        enable = true,
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
  update_focused_file = {
      enable = true,
  }
})

vim.keymap.set('n', '<leader>pt', tree.toggle, {})
