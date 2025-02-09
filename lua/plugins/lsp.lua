local lsp_servers = {
    ['nil'] = {},
    ['nixpkgs-fmt'] = {},
    gopls = {},
    lua_ls = {
        settings = {
            Lua = {
                workspace = {
                    checkThirdParty = false,
                },
                codeLens = {
                    enable = true,
                },
                completion = {
                    callSnippet = "Replace",
                },
                doc = {
                    privateName = { "^_" },
                },
                hint = {
                    enable = true,
                    setType = false,
                    paramType = true,
                    paramName = "Disable",
                    semicolon = "Disable",
                    arrayIndex = "Disable",
                },
            },
        },
    },
}

return {
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "stylua",
                "shfmt",
                "nil",
                "nixpkgs-fmt",
                "gopls",
            },
        },
    },
    {
        "williamboman/mason-lspconfig.nvim",
        opts = {
            ensure_installed = lsp_servers,
            automatic_installation = true,
            handlers = {
                function(server_name)
                    require("lspconfig")[server_name].setup({})
                end,
            },
        },
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        dependencies = {
            -- { "ms-jpq/coq_nvim",       branch = "coq" },
            -- { "ms-jpq/coq.artifacts",  branch = "artifacts" },
            -- { "ms-jpq/coq.thirdparty", branch = "3p" },

            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            'WhoIsSethDaniel/mason-tool-installer.nvim',

            {
                "folke/lazydev.nvim",
                ft = "lua", -- only load on lua files
            },
        },
        opts = function()
            ---@class PluginLspOpts
            local ret = {
                -- options for vim.diagnostic.config()
                ---@type vim.diagnostic.Opts
                diagnostics = {
                    underline = true,
                    update_in_insert = false,
                    virtual_text = {
                        spacing = 4,
                        source = "if_many",
                        prefix = "icons",
                    },
                    severity_sort = true,
                },
                -- Enable this to enable the builtin LSP code lenses on Neovim >= 0.10.0
                -- Be aware that you also will need to properly configure your LSP server to
                -- provide the code lenses.
                codelens = {
                    enabled = false,
                },
                -- Enable lsp cursor word highlighting
                document_highlight = {
                    enabled = true,
                },
                -- add any global capabilities here
                capabilities = {},
                -- options for vim.lsp.buf.format
                -- `bufnr` and `filter` is handled by the LazyVim formatter,
                -- but can be also overridden when specified
                format = {
                    formatting_options = nil,
                    timeout_ms = nil,
                },
                -- LSP Server Settings
                ---@type lspconfig.options
                servers = lsp_servers,
                -- you can do any additional lsp server setup here
                -- return true if you don't want this server to be setup with lspconfig
                ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
            }
            return ret
        end,
        init = function()
            --[[ vim.g.coq_settings = {
                auto_start = "shut-up", -- if you want to start COQ at startup
                keymap = {
                    recommended = false,
                },
            } ]]
        end,
        config = function()
            require("techno/lsp")
        end,
    },

    {
        'ray-x/lsp_signature.nvim',
        event = 'VeryLazy',
        opts = {},
        config = function(_, opts)
            require('lsp_signature').setup(opts)
        end,
    },

    {
      'mrcjkb/rustaceanvim',
      version = '^5', -- Recommended
      lazy = false, -- This plugin is already lazy
    },

    {
        "chrisgrieser/nvim-lsp-endhints",
        event = "LspAttach",
        opts = {}, -- required, even if empty
    },
}
