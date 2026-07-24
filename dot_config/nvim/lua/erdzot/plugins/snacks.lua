return {
    {
        'folke/snacks.nvim',
        opts = {
            bigfile = {
                enabled = true
            },
            picker = {
                enabled = true
            }
        },
        keys = {
            { "<leader>gl", function() require('snacks').picker.git_log() end,      desc = "Git Log" },
            { "<leader>gf", function() require('snacks').picker.git_log_file() end, desc = "Git Log File" },
            { "<leader>ps", function() require('snacks').picker.grep() end,         desc = "Grep" },
            { "<leader>pw", function() require('snacks').picker.grep_word() end,    desc = "Visual selection or word", mode = { "n", "x" } },
            { "<leader>pf", function() require('snacks').picker.files() end,        desc = "Find Files" },
            { "<leader>pr", function() require('snacks').picker.recent() end,       desc = "Recent" },
        }
    }
}
