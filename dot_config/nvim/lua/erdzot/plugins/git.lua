return {
    {
        "tpope/vim-fugitive",
        event = "BufWinEnter",
        config = function()
            vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
            vim.keymap.set("n", "<leader>gg", vim.cmd.GBrowse)
            vim.keymap.set("v", "<leader>gl", function()
                vim.cmd([['<,'>GBrowse]])
            end)
        end
    },
    {
        "tpope/vim-rhubarb",
        dependencies = {
            "tpope/vim-fugitive"
        },
    },
    {
        "shumphrey/fugitive-gitlab.vim",
        dependencies = {
            "tpope/vim-fugitive"
        },
    },
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            local gitsigns = require("gitsigns")
            gitsigns.setup()
            vim.keymap.set("n", "<leader>glb", gitsigns.toggle_current_line_blame,
                { desc = "Toggle current line git blame" })
            vim.keymap.set("n", "<leader>gb", gitsigns.blame, { desc = "Show git blame" })
            vim.keymap.set("n", "<leader>g[", gitsigns.next_hunk, { desc = "Show next hunk" })
            vim.keymap.set("n", "<leader>g]", gitsigns.prev_hunk, { desc = "Show previous hunk" })
        end
    },
}
