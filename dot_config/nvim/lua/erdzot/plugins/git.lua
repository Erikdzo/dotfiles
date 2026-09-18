return {
    {
        "tpope/vim-fugitive",
        cmd = "Git",
        keys = {
            { "<leader>gs", vim.cmd.Git, desc = "Git Status" }
        }
    },
    {
        "lewis6991/gitsigns.nvim",
        event = "BufReadPre",
        keys = {
            { "<leader>gls", function() require('gitsigns').toggle_current_line_blame() end, desc = "Toggle current line Git Blame" },
            { "<leader>gb",  function() require('gitsigns').blame() end,                     desc = "Show Git Blame" },
            { "[g",          function() require('gitsigns').nav_hunk("next") end,            desc = "Show next hunk" },
            { "]g",          function() require('gitsigns').nav_hunk("prev") end,            desc = "Show previous hunk" },
        }
    },
}
