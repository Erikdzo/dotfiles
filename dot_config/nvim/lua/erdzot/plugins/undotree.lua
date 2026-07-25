return {
    {
        'mbbill/undotree',
        init = function()
            vim.g.undotree_WindowLayout = 2
            vim.g.undotree_SetFocusWhenToggle = 1
        end,
        keys = {
            { "<leader><F5>", function() vim.cmd.UndotreeToggle() end, desc = "Toggle Undo Tree" }
        }
    },
}
