return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_cursor({})
                        -- require("telescope.themes").get_dropdown({
                        --     winblend = 10,
                        --     border = true,
                        --     previewer = false,
                        --     shorten_path = false,
                        --     results_height = 20,
                        --     layout_config = {
                        --         width = 0.25,
                        --         height = 0.5,
                        --     },
                        -- })
                    }
                }
            })
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = "Search files" })
            vim.keymap.set('n', '<C-p>', builtin.git_files, {})
            vim.keymap.set('n', '<leader>pw', builtin.grep_string, { desc = "Search current word" })
            vim.keymap.set('n', '<leader>ps', builtin.live_grep, { desc = "Search by grep" })
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
