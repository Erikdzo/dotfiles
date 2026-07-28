return {
    {
        'saghen/blink.cmp',
        dependencies = {
            'saghen/blink.lib',
            -- optional: provides snippets for the snippet source
            'rafamadriz/friendly-snippets',
        },
        build = function()
            -- build the fuzzy matcher, optionally add a timeout to `pwait(timeout_ms)`
            -- you can use `gb` in `:Lazy` to rebuild the plugin as needed
            ---@diagnostic disable-next-line: undefined-field
            require('blink.cmp').build():pwait()
        end,
        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            -- C-space: Open menu or open docs if already open
            -- C-n/C-p or Up/Down: Select next/previous item
            -- C-e: Hide menu
            -- C-k: Toggle signature help (if signature.enabled = true)
            keymap = { preset = 'default' },
            completion = { documentation = { auto_show = false }, ghost_text = { enabled = false }, },
            signature = { enabled = true },
            sources = {
                -- add lazydev to your completion providers
                default = { "lazydev", "lsp", "path", "snippets", "buffer" },
                providers = {
                    lazydev = {
                        name = "LazyDev",
                        module = "lazydev.integrations.blink",
                        -- make lazydev completions top priority (see `:h blink.cmp`)
                        score_offset = 100,
                    },
                    snippets = {
                        score_offset = -100
                    }
                },
            },
        },
    }
}
