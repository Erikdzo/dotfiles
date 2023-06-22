require("telescope")

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = "Search files"})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>pw', builtin.grep_string, { desc = "Search current word"})
vim.keymap.set('n', '<leader>ps', builtin.live_grep, { desc = "Search by grep"})

require('telescope').load_extension('ui-select')
