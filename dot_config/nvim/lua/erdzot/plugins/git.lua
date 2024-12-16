return {
    {
        "tpope/vim-fugitive",
        event = "BufWinEnter",
        config = function()
            vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
        end
    },
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            local gitsigns = require("gitsigns")
            gitsigns.setup()
            vim.keymap.set("n", "<leader>glb", gitsigns.toggle_current_line_blame,
                { desc = "Toggle current line git blame" })
            vim.keymap.set("n", "<leader>gb", gitsigns.blame, { desc = "Show git blame" })
        end
    },
}
