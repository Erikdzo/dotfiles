return {
    {
        'stevearc/conform.nvim',
        dependencies = {
            'folke/neoconf.nvim',
        },
        opts = {
        },
        config = function()
            local conform = require("conform")
            local neoconf = require("neoconf")

            local function js_formatters()
                if neoconf.get("eslint.enabled") then
                    return {}
                end
                return { { "prettierd", "prettier" } }
            end

            conform.setup {

                formatters_by_ft = {
                    lua = { "stylua" },
                    python = { "black" },
                    javascript = js_formatters,
                    typescript = js_formatters,
                    vue = js_formatters,
                    html = { { "prettierd", "prettier" } },
                    css = { { "prettierd", "prettier" } },
                    scss = { { "prettierd", "prettier" } },
                },
                format_on_save = {
                    timeout_ms = 500,
                    lsp_fallback = "always",
                },
            }
        end,
    },
    {
        "tpope/vim-sleuth",
    },
}
