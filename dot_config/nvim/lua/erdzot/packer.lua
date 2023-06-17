

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use('kdheepak/lazygit.nvim')
    use('lewis6991/gitsigns.nvim')

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        requires = { {'nvim-lua/plenary.nvim'}, {'kdheepak/lazygit.nvim'} }
    }
    -- Theme
    -- use('rose-pine/neovim')
    use('navarasu/onedark.nvim')

    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use('nvim-treesitter/playground')
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim'},           -- Optional
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},         -- Required
            {'hrsh7th/cmp-nvim-lsp'},     -- Required
            {'hrsh7th/cmp-buffer'},       -- Optional
            {'hrsh7th/cmp-path'},         -- Optional
            {'saadparwaiz1/cmp_luasnip'}, -- Optional
            {'hrsh7th/cmp-nvim-lua'},     -- Optional

            -- Snippets
            {'L3MON4D3/LuaSnip'},             -- Required
            {'rafamadriz/friendly-snippets'}, -- Optional
        }
    }
    -- Commenting
    use('numToStr/Comment.nvim')
    -- Dynamic commenting base on place in file
    use('JoosepAlviste/nvim-ts-context-commentstring')

    -- Auto pairs
    use("windwp/nvim-autopairs")
    -- Auto tag
    use("windwp/nvim-ts-autotag")

    -- Formatter
    use("mhartington/formatter.nvim")

    -- File tree
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }

    -- Todo comments   
    use("folke/todo-comments.nvim")

    -- EditorConfig
    use("gpanders/editorconfig.nvim")

    --Which key
    use("folke/which-key.nvim")

    -- Diff view
    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

    -- Fancy statusline
    use("nvim-lualine/lualine.nvim")

    -- Detect tabstop and shiftwidth automatically
    use("tpope/vim-sleuth")

    -- Toggle term
    use {"akinsho/toggleterm.nvim", tag = '*'}
end)
