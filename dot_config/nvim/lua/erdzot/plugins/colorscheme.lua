return {
    {
        "navarasu/onedark.nvim",
        opts = {},
        config = function()
            require("onedark").setup {
            }
            vim.cmd.colorscheme("onedark")
            vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
            vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })
        end
    },
}
