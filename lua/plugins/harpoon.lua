return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    config = function()
        local harpoon = require("harpoon")
        harpoon:setup({
            global_settings = {
                save_on_toggle = true,
                mark_branch = true,
            }
        })

        vim.keymap.set("n", "<leader>a", function()
            harpoon:list():add()
        end, { desc = "Add harpoon mark" })

        vim.keymap.set("n", "<C-e>", function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end, { desc = "List harpoon marks" })
    end,
}
