return {
    {
        'stevearc/conform.nvim',
        opts = function()
            return {
                formatters_by_ft = {
                    lua = { "stylua" },
                    python = { "autoflake", "isort", "black" },
                    javascript = { "prettierd", "prettier", stop_after_first = true },
                    typescript = { "prettierd", "prettier", stop_after_first = true },
                    vue = { "prettierd", "prettier", stop_after_first = true },
                    html = { "prettierd", "prettier", stop_after_first = true },
                    css = { "prettierd", "prettier", stop_after_first = true },
                    scss = { "prettierd", "prettier", stop_after_first = true },
                    sql = { "sqlfmt" }
                },
                format_on_save = {
                    timeout_ms = 500,
                    lsp_format = "fallback",
                },
            }
        end,
    },
    {
        "tpope/vim-sleuth",
    },
}
