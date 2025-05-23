return {
    {
        'mbbill/undotree',
        config = function()
            vim.keymap.set("n", "<leader><F5>", vim.cmd.UndotreeToggle)

            vim.g.undotree_WindowLayout = 2
            vim.g.undotree_SetFocusWhenToggle = 1
        end
    },
}
