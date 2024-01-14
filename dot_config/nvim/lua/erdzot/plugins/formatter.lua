return {
    {
        'stevearc/conform.nvim',
        opts = {
            formatters_by_ft = {
                lua = { "stylua" },
                python = { "black" },
                javascript = { { "prettierd", "prettier" } },
                vue = { { "prettierd", "prettier" } },
                typescript = { { "prettierd", "prettier" } },
                html = { { "prettierd", "prettier" } },
                css = { { "prettierd", "prettier" } },
                scss = { { "prettierd", "prettier" } },
            },
            format_on_save = {
                timeout_ms = 500,
                lsp_fallback = true,
            },
        },
    },
    {
        "tpope/vim-sleuth",
    },
}
