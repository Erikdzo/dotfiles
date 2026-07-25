return {
    {
        "tpope/vim-fugitive",
        event = "BufWinEnter",
        keys = {
            { "<leader>gs", vim.cmd.Git, desc = "Git Status" }
        }
    },
    {
        "lewis6991/gitsigns.nvim",
        config = true,
        lazy = false,
        keys = function()
            local gitsigns = require('gitsigns')
            return {
                { "<leader>gls", function() gitsigns.toggle_current_line_blame() end, desc = "Toggle current line Git Blame" },
                { "<leader>gb",  function() gitsigns.blame() end,                     desc = "Show Git Blame" },
                { "[g",          function() gitsigns.next_hunk() end,                 desc = "Show next hunk" },
                { "]g",          function() gitsigns.prev_hunk() end,                 desc = "Show previous hunk" },
            }
        end
    },
}
