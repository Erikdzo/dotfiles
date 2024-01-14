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
        opts = {
            current_line_blame = true,
            current_line_blame_opts = {
                delay = 100
            }
        }
    },
}
