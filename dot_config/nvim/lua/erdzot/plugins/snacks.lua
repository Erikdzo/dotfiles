return {
    {
        'folke/snacks.nvim',
        opts = {
            bigfile = {
                enabled = true
            },
            picker = {
                enabled = true
            },
            gitbrowse = {
                enabled = true
            },
            dashboard = {
                enabled = true,
                sections = {
                    { section = "header" },
                    { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
                    { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
                    {
                        icon = " ",
                        title = "Git Status",
                        section = "terminal",
                        enabled = function()
                            return require('snacks').git.get_root() ~= nil
                        end,
                        cmd = "git status --short --branch --renames",
                        height = 5,
                        padding = 1,
                        ttl = 5 * 60,
                        indent = 3,
                    },
                    { section = "startup" },
                }
            }
        },
        keys = {
            { "<leader>gl", function() require('snacks').picker.git_log() end,      desc = "Git Log" },
            { "<leader>gf", function() require('snacks').picker.git_log_file() end, desc = "Git Log File" },
            { "<leader>ps", function() require('snacks').picker.grep() end,         desc = "Grep" },
            { "<leader>pw", function() require('snacks').picker.grep_word() end,    desc = "Visual selection or word", mode = { "n", "x" } },
            { "<leader>pf", function() require('snacks').picker.files() end,        desc = "Find Files" },
            { "<leader>pr", function() require('snacks').picker.recent() end,       desc = "Recent" },
            { "<leader>gg", function() require('snacks').gitbrowse() end,           mode = { 'n', 'v' },               desc = "Git Browse" },
        }
    }
}
