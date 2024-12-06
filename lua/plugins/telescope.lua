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
    },
    config = function()
        require("techno/telescope")
    end,
}
