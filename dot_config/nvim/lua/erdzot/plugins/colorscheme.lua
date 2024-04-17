return {
    {
        "navarasu/onedark.nvim",
        opts = {},
        config = function()
            require("onedark").setup { }
            vim.cmd.colorscheme("onedark")
        end
    },
}
