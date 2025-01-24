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
            -- 'AndreM222/copilot-lualine',
        },
        opts = {
            options = {
                icons_enabled = false,
                theme = 'onedark',
                component_separators = '|',
                section_separators = '',
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = { 'branch' },
                lualine_c = { '%f' },
                -- lualine_c = { 'filename' },
                -- lualine_x = { { 'copilot', show_colors = true }, 'encoding', 'fileformat', 'filetype' },
                lualine_y = { 'progress' },
                lualine_z = { 'location' }
            },
        }
    },
    {
        'nvimdev/dashboard-nvim',
        event = 'VimEnter',
        config = function()
            require('dashboard').setup {
                -- config
                config = {
                    week_header = { enable = true },
                    project = { enable = false },
                    mru = { cwd_only = true },
                }
            }
        end,
        dependencies = { { 'nvim-tree/nvim-web-devicons' } }
    },
    {
        'stevearc/oil.nvim',
        ---@module 'oil'
        opts = {},
        -- Optional dependencies
        dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
        config = function()
            require("oil").setup {

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
                            local oil = require 'oil'
                            oil.open_preview { vertical = true, split = 'botright' }
                        end,
                    },
                },
                view_options = {
                    show_hidden = true,
                },
                preview_split = "right"
            }
            -- Open parent directory in current window
            vim.keymap.set("n", "<leader>pv", "<CMD>Oil<CR>", { desc = "Open parent directory" })
        end,
    },
    {
        "tpope/vim-sleuth",
    },
    {
        "RRethy/vim-illuminate",
    },
    {
        "sindrets/diffview.nvim",
        config = function()
            local diffview = require('diffview')
            local actions = require('diffview.actions')

            vim.keymap.set('n', '<leader>pd', diffview.open, {})

            diffview.setup {
                keymaps = {
                    view = {
                        ['q'] = actions.close
                    },
                    file_panel = {
                        ['q'] = '<Cmd>tabc<CR>'
                    }
                }
            }
        end
    }
}
