return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            local default_picker = {
            }
            require("telescope").setup({
                pickers = {
                    find_files = default_picker,
                    grep_string = default_picker,
                    live_grep = {
                        path_display = { "tail" }
                    },
                    help_tags = default_picker,
                },
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_cursor({})
                    }
                }
            })
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = "Search files" })
            vim.keymap.set('n', '<C-p>', builtin.git_files, {})
            vim.keymap.set('n', '<leader>pw', builtin.grep_string, { desc = "Search current word" })
            vim.keymap.set(
                'n',
                '<leader>pW',
                function()
                    builtin.grep_string({ search = vim.fn.expand("<cWORD>") })
                end,
                { desc = "Search current WORD" })
            vim.keymap.set('n', '<leader>ps', builtin.live_grep, { desc = "Search by grep" })
            vim.keymap.set('n', '<leader>vh', builtin.help_tags, { desc = "Search in help tags" })
        end
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        dependencies = { 'nvim-telescope/telescope.nvim' },
        config = function()
            require('telescope').load_extension('ui-select')
        end
    },
}
