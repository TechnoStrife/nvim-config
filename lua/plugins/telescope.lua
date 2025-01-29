return {
    "nvim-telescope/telescope.nvim",
    event = "VimEnter",
    branch = "master",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",

            build = "make",
        },
        { "nvim-telescope/telescope-ui-select.nvim" },

        {
            "nvim-telescope/telescope-file-browser.nvim",
            options = {
                create_from_prompt = false,
            },
        },
        { "ThePrimeagen/git-worktree.nvim" },
        { "kdheepak/lazygit.nvim" },

        { "nvim-tree/nvim-web-devicons",            enabled = vim.g.have_nerd_font },

        {
            "nvim-telescope/telescope-live-grep-args.nvim",  -- ripgrep with arguments
            version = "^1.0.0",
        },
    },
    config = function()
        require("techno/telescope")
    end,
}
