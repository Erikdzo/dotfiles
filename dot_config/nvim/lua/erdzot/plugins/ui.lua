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
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        }
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
