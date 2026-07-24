return {
    {
        'folke/snacks.nvim',
        --@type snacks.Config
        opts = {
            bigfile = {
                enabled = true
            },
            picker = {
                enabled = true
            }
        },
        keys = {
            { "<leader>gl", function() Snacks.picker.git_log() end,      desc = "Git Log" },
            { "<leader>gf", function() Snacks.picker.git_log_file() end, desc = "Git Log File" },
            { "<leader>ps", function() Snacks.picker.grep() end,         desc = "Grep" },
            { "<leader>pw", function() Snacks.picker.grep_word() end,    desc = "Visual selection or word", mode = { "n", "x" } },
            { "<leader>pf", function() Snacks.picker.files() end,        desc = "Find Files" },
            { "<leader>pr", function() Snacks.picker.recent() end,       desc = "Recent" },
        }
    }
}
