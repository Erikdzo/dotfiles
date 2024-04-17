return {
    {
        'stevearc/conform.nvim',
        dependencies = {
            'folke/neoconf.nvim',
        },
        opts = {
            formatters_by_ft = {
                lua = { "stylua" },
                python = { "black" },
                javascript = { { "prettierd", "prettier" } },
                typescript = { { "prettierd", "prettier" } },
                vue = function()
                    local neoconf = require("neoconf")
                    if neoconf.get("eslint.enabled") then
                        return {}
                    end
                    return { { "prettierd", "prettier" } }
                end,
                html = { { "prettierd", "prettier" } },
                css = { { "prettierd", "prettier" } },
                scss = { { "prettierd", "prettier" } },
            },
            format_on_save = {
                timeout_ms = 500,
                lsp_fallback = "always",
            },
        },
    },
    {
        "tpope/vim-sleuth",
    },
}
