return {
    {
        "JoosepAlviste/nvim-ts-context-commentstring",
        event = "BufReadPre",
        opts = { enable_autocmd = false }
    },
    {
        "numToStr/Comment.nvim",
        dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
        event = "BufReadPre",
        opts = {
            pre_hook = function() require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook() end,
        },
    },
    {
        "folke/todo-comments.nvim",
        event = "BufReadPost",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {}
    },
}
