return {
    {
        'nvim-treesitter/nvim-treesitter',
        branch = "main",
        lazy = false,
        build = ':TSUpdate',
        config = function()
            require('nvim-treesitter').install({ "javascript", "typescript", "vue", "html", "css", "c", "lua", "vim",
                "vimdoc" })
        end
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        opts = {
            max_lines = 1,
        }
    },
    { "windwp/nvim-ts-autotag" },
}
