local function get_vue_version()
    local node_check = io.popen("command -v node >/dev/null 2>&1 && echo yes || echo no")

    if node_check == nil then
        return nil
    end

    local has_node = node_check:read("*l")
    node_check:close()

    if has_node ~= "yes" then
        return nil
    end

    local handle = io.popen(
        [[node -e "try{console.log(require('./node_modules/vue/package.json').version)}catch(e){process.exit(1)}"]])

    if handle == nil then
        return nil
    end

    ---@type string
    local vue_version = handle:read("*l")
    handle:close()

    return vue_version
end

local function is_version_before_2_7(vue_version)
    return vue_version:match("^2") and not vue_version:match("^2.7.")
end

local function diagnostics_on_jump(diagnostic, bufnr)
    if diagnostic then
        vim.diagnostic.open_float(bufnr, {
            scope = "cursor",
            focus = false,
        })
    end
end

return {
    {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
            library = {
                -- See the configuration section for more details
                -- Load luvit types when the `vim.uv` word is found
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "saghen/blink.cmp",
        },
        config = function()
            local capabilities = require('blink.cmp').get_lsp_capabilities()

            vim.lsp.config('*', {
                capabilities = capabilities,
            })

            vim.lsp.config('lua_ls', {
            })

            local vue_language_server_path = vim.fn.stdpath('data') ..
                "/mason/packages/vue-language-server/node_modules/@vue/language-server"

            local ts_ls_filetypes = { 'typescript', 'javascript', 'javascriptreact',
                'typescriptreact', 'vue' }
            local ts_ls_plugins = {
                {
                    name = "@vue/typescript-plugin",
                    location = vue_language_server_path,
                    languages = { "vue" },
                    configNamespace = 'typescript',
                }
            }

            local vue_version = get_vue_version()

            local is_vue_before_2_7 = vue_version and is_version_before_2_7(vue_version)

            if is_vue_before_2_7 then
                ts_ls_filetypes = { 'typescript', 'javascript', 'javascriptreact',
                    'typescriptreact', }
                ts_ls_plugins = {
                }
            end

            vim.lsp.config('vtsls', {
                capabilities = capabilities,
                settings = {
                    vtsls = {
                        tsserver = {
                            globalPlugins = ts_ls_plugins
                        }
                    },
                    typescript = {
                        preferences = {
                            importModuleSpecifierPreference = 'non-relative',
                            preferGoToSourceDefinition = true
                        },
                    }
                },
                filetypes = ts_ls_filetypes,
            })

            if not is_vue_before_2_7 then
                vim.lsp.config('vue_ls', {
                })
            else
                vim.lsp.config('vuels', {
                    filetypes = { 'vue' }
                })
            end

            local base_on_attach = vim.lsp.config.eslint.on_attach

            vim.lsp.config('eslint', {
                on_attach = function(client, bufnr)
                    if not base_on_attach then return end

                    base_on_attach(client, bufnr)
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        buffer = bufnr,
                        command = "LspEslintFixAll",
                    })
                end,
            })

            vim.lsp.config('tailwindcss', {
                settings = {
                    tailwindCSS = {
                        -- tailwind-variants: tv({ base: '…', variants: { … } })
                        classFunctions = { 'tv' },
                    },
                },
            })

            vim.lsp.config('stylelint_lsp', {
                settings = {
                    stylelint = {
                        validate = { 'css', 'postcss', 'scss', 'vue' }
                    }
                }
            })

            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('UserLspConfig', { clear = true }),
                callback = function(ev)
                    -- Enable completion triggered by <c-x><c-o>
                    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

                    -- Buffer local mappings.
                    -- See `:help vim.lsp.*` for documentation on any of the below functions
                    local opts = { buffer = ev.buf }

                    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
                    vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
                    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
                    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
                    vim.keymap.set("n", "[d",
                        function()
                            vim.diagnostic.jump({ count = 1, on_jump = diagnostics_on_jump })
                        end, opts)
                    vim.keymap.set("n", "]d",
                        function()
                            vim.diagnostic.jump({ count = -1, on_jump = diagnostics_on_jump })
                        end, opts)
                    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
                    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)


                    -- Conseals Markdown syntax in hover windows when hover window is selected
                    vim.api.nvim_create_autocmd("BufEnter", {
                        callback = function()
                            if vim.bo.buftype == "nofile" then
                                vim.wo.conceallevel = 2
                                vim.wo.concealcursor = "ncv"
                            end
                        end,
                    })
                end,
            })
        end
    }
}
