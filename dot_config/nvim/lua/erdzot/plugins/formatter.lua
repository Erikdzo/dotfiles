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
                return { "prettierd", "prettier", stop_after_first = true }
            end

            conform.setup {

                formatters_by_ft = {
                    lua = { "stylua" },
                    python = { "black" },
                    javascript = js_formatters,
                    typescript = js_formatters,
                    vue = js_formatters,
                    html = { "prettierd", "prettier", stop_after_first = true },
                    css = { "prettierd", "prettier", stop_after_first = true },
                    scss = { "prettierd", "prettier", stop_after_first = true },
                    sql = { { "sqlfmt" } }
                },
                format_on_save = {
                    timeout_ms = 500,
                    lsp_fallback = "always",
                    filter = function(client)
                        -- NOTE: temp fix as volar is not formatting correctly
                        return client.name ~= "volar"
                    end
                },
            }
        end,
    },
    {
        "tpope/vim-sleuth",
    },
}
