return {
    {
        "navarasu/onedark.nvim",
        priority = 1000,
        lazy = false,
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
