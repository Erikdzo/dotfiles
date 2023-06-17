require("telescope").load_extension("lazygit")

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = "Search files"})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = "Search current word"})
vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = "Search by grep"})

