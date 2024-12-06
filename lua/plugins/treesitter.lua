return {
    { -- Highlight, edit, and navigate code
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-context",
            opts = {
                enable = true,
                max_lines = 2,
                patterns = {
                    default = {
                        "function",
                        "method",
                        "for",
                        "while",
                        "if",
                        "switch",
                        "case",
                    },

                    rust = {
                        "loop_expression",
                        "impl_item",
                        "block",
                    },

                    typescript = {
                        "class_declaration",
                        "abstract_class_declaration",
                        "else_clause",
                    },
                },
            },
        },
        opts = {
            ensure_installed = {
                "lua",
                "go",
                "rust",
                "vim",
                "vimdoc",
                "query",
                "bash",
                "comment",
                "csv",
                "diff",
                "dockerfile",
                "git_config",
                "git_rebase",
                "gitcommit",
                "gitignore",
                "gomod",
                "gosum",
                "gowork",
                "html",
                "json",
                "markdown",
                "python",
                "sql",
                "ssh_config",
                "yaml",
            },
            -- Autoinstall languages that are not installed
            auto_install = true,
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
            inlay_hints = { enable = true },
            refactor = {
                highlight_definitions = {
                    enable = true,
                    -- Set to false if you have an `updatetime` of ~100.
                    clear_on_cursor_move = true,
                },
            },
        },
        config = function(_, opts)
            -- [[ Configure Treesitter ]] See `:help nvim-treesitter`

            ---@diagnostic disable-next-line: missing-fields
            require("nvim-treesitter.configs").setup(opts)

            vim.keymap.set("n", "[c", function()
                require("treesitter-context").go_to_context(vim.v.count1)
            end, { silent = true, desc = "Go up to [c]ontext" })

            -- There are additional nvim-treesitter modules that you can use to interact
            -- with nvim-treesitter. You should go explore a few and see what interests you:
            --
            --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
            --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
            --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
        end,
    },
}
