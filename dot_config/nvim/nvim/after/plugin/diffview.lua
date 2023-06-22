local diffview = require('diffview')
local actions = require('diffview.actions')

vim.keymap.set('n', '<leader>pd', diffview.open, {})

diffview.setup {
    keymaps = {
        view = {
            ['q'] = actions.close
        },
        file_panel = {
            ['q'] = '<Cmd>tabc<CR>'
        }
    }
}
