return {
    {
        "mason-org/mason.nvim",
        opts = {}
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        dependencies = {
            "mason-org/mason.nvim",
        },
        opts = {
            ensure_installed = {
                "tree-sitter-cli",
                "stylelint"
            }
        },
    },
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {
            ensure_installed = {
                'lua_ls',
                'vtsls',
                'eslint',
                'pyright',
                'vue_ls', -- Volar
                'tailwindcss',
                'vuels',  -- Vetur
                'cssls',
                'stylelint_lsp'
            }
        },
        dependencies = {
            "mason-org/mason.nvim",
            "neovim/nvim-lspconfig",
        },
    },
}
