return {
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 500
        end,
        opts = {}
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
        opts = {
            options = {
                icons_enabled = true,
                theme = 'onedark',
                component_separators = '|',
                section_separators = '',
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = { 'branch', 'diff', 'diagnostics' },
                lualine_c = { '%f' },
                -- lualine_c = { 'filename' },
                -- lualine_x = { { 'copilot', show_colors = true }, 'encoding', 'fileformat', 'filetype' },
                lualine_y = { 'progress' },
                lualine_z = { 'location' }
            },
        }
    },
    {
        'stevearc/oil.nvim',
        -- Optional dependencies
        dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
        ---@module 'oil'
        opts = {
            columns = {
                "icon",
                -- "permissions",
                "size",
                "mtime",
            },
            keymaps = {
                ["<C-h>"] = false,
                ["<C-l>"] = false,
                ["<C-k>"] = false,
                ["<C-j>"] = false,
                ['<C-p>'] = {
                    callback = function()
                        local oil = require("oil")
                        oil.open_preview { vertical = true, split = 'botright' }
                    end,
                },
            },
            view_options = {
                show_hidden = true,
            },
            preview_split = "right"
        },
        keys = {
            { "<leader>pv", "<CMD>Oil<CR>", desc = "Open parent directory" }
        }
    },
    {
        "tpope/vim-sleuth",
    },
    {
        "RRethy/vim-illuminate",
        event = "BufReadPre"
    },
    {
        "sindrets/diffview.nvim",
        cmd = "DiffviewOpen",
        opts = function()
            local actions = require('diffview.actions')

            return {
                keymaps = {
                    view = {
                        ['q'] = actions.close
                    },
                    file_panel = {
                        ['q'] = '<Cmd>tabc<CR>'
                    }
                }
            }
        end,
        keys = function()
            local diffview = require('diffview')

            return {
                { "<leader>pd", function() diffview.open() end, desc = "Diff view" }
            }
        end
    },
    {
        "j-hui/fidget.nvim",
        event = "LspAttach",
        config = true
    }
}
