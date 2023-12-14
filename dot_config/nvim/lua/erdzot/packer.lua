

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use('tpope/vim-fugitive')
    use('lewis6991/gitsigns.nvim')

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use('nvim-telescope/telescope-ui-select.nvim')

    use('navarasu/onedark.nvim')

    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use('nvim-treesitter/nvim-treesitter-context')

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

    -- Cursorline
    use("RRethy/vim-illuminate")

    -- Harpoon
    use("ThePrimeagen/harpoon")

    -- Copilot
    use {
      "zbirenbaum/copilot.lua",
      cmd = "Copilot",
      event = "InsertEnter",
      config = function()
        require("copilot").setup({})
      end,
    }
end)
