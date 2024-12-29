return {
    {
        "lewis6991/gitsigns.nvim",
        opts = {
            signs = {
                add = { text = "+" },
                change = { text = "~" },
                delete = { text = "_" },
                topdelete = { text = "‾" },
                changedelete = { text = "~" },
            },
        },
    },
    {
        "kdheepak/lazygit.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        cmd = {
            "LazyGit",
            "LazyGitConfig",
            "LazyGitCurrentFile",
            "LazyGitFilter",
            "LazyGitFilterCurrentFile",
        },
        init = function()
            vim.keymap.set("n", "<leader>gg", ":LazyGit<CR>", { desc = "Open LazyGit" })
        end,
    },
    {
        "sindrets/diffview.nvim",
        opts = {
            hooks = {
                diff_buf_read = function(bufnr)
                    -- Change local options in diff buffers
                    vim.opt_local.wrap = false
                    -- vim.opt_local.formatoptions = vim.opt_local.formatoptions + { t = false }
                end,
            }
        },
        init = function()
            vim.keymap.set("n", "<leader>gdo", ":DiffviewOpen<CR>", { desc = "Open DiffView" })
            vim.keymap.set("n", "<leader>gdc", ":DiffviewClose<CR>", { desc = "Close DiffView" })
        end,
    },
    {
        'tpope/vim-fugitive',
    },
}
