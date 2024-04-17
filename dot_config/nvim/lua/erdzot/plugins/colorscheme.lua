return {
    {
        "navarasu/onedark.nvim",
        opts = {},
        config = function()
            require("onedark").setup {
                code_style = {
                    comments = "none",
                }
            }
            vim.cmd.colorscheme("onedark")
        end
    },
}
