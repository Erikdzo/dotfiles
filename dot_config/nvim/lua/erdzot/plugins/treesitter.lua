return {
    {
        'nvim-treesitter/nvim-treesitter',
        branch = "main",
        lazy = false,
        build = ':TSUpdate',
        config = function()
            require('nvim-treesitter').install({
                "javascript",
                "typescript",
                "vue",
                "html",
                "css",
                "c",
                "lua",
                "vim",
                "scss",
                "vimdoc",
                "xml",
                "python"
            })

            vim.api.nvim_create_autocmd('FileType', {
                pattern = { "javascript", "typescript", "vue", "html", "css", "c", "lua", "vim", "scss",
                    "vimdoc", "xml", "python"
                },
                callback = function()
                    vim.treesitter.start()
                end
            })
        end
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        event = "BufReadPre",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        opts = {
            max_lines = 1,
        }
    },
    {
        "windwp/nvim-ts-autotag",
        event = "InsertEnter"
    },
}
