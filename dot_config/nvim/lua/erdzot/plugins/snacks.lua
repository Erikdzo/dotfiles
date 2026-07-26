return {
    {
        'folke/snacks.nvim',
        priority = 1000,
        lazy = false,
        opts = function()
            local Snacks = require('snacks')
            return {
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
                                return Snacks.git.get_root() ~= nil
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
            }
        end,
        keys = function()
            local Snacks = require('snacks')

            return {
                -- File & word search
                { "<leader>ps", function() Snacks.picker.grep() end,            desc = "Grep" },
                { "<leader>pw", function() Snacks.picker.grep_word() end,       desc = "Visual selection or word", mode = { "n", "x" } },
                { "<leader>pf", function() Snacks.picker.files() end,           desc = "Find Files" },
                { "<leader>pr", function() Snacks.picker.recent() end,          desc = "Recent" },
                -- Git
                { "<leader>gl", function() Snacks.picker.git_log() end,         desc = "Git Log" },
                { "<leader>gf", function() Snacks.picker.git_log_file() end,    desc = "Git Log File" },
                { "<leader>gg", function() Snacks.gitbrowse() end,              desc = "Git Browse",               mode = { 'n', 'v' }, },
                -- LSP
                { "<leader>gd", function() Snacks.picker.lsp_definitions() end, desc = "Go to Definition" },
                { "<leader>gr", function() Snacks.picker.lsp_references() end,  desc = "References" },
            }
        end
    }
}
