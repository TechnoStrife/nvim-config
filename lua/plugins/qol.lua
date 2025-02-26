return {
    -- 'tpope/vim-sleuth', -- auto config tabs

    {
        'ggandor/leap.nvim', -- jump by 2 chars
        config = function()
            require('leap').create_default_mappings()
        end,
        opts = {},
    },

    {
        'nvim-pack/nvim-spectre', -- search-replace
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
        config = function()
            vim.keymap.set('n', '<leader>S', function() require("spectre").toggle() end, { desc = 'Toggle Spectre' })
            vim.keymap.set('n', '<leader>sw', function() require("spectre").open_visual({ select_word = true }) end, {
                desc = 'Spectre: search current word',
            })
            vim.keymap.set('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', {
                desc = 'Spectre: search current word',
            })
            vim.keymap.set('n', '<leader>sp', function() require("spectre").open_file_search({ select_word = true }) end,
                {
                    desc = 'Spectre: search on current file',
                })
        end,
    },

    {
        "mbbill/undotree",
        init = function()
            vim.g.undotree_SetFocusWhenToggle = 1
        end,
    },
    { "RRethy/vim-illuminate" }, -- highlight uses of word under cursor
    {
        "aileot/emission.nvim",  -- highlight added/removed text
        event = "VeryLazy",
        opts = {},
    },
    {
        "lukas-reineke/indent-blankline.nvim", -- add indentation guides
        main = "ibl",
        opts = {},
    },
    {
        "numToStr/Comment.nvim", -- manipulate comments
        opts = {
            -- add any options here
        },
    },
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end,
    },
    -- {
    --     "windwp/nvim-autopairs",
    --     event = "InsertEnter",
    --     config = function()
    --         local remap = vim.api.nvim_set_keymap
    --         local npairs = require("nvim-autopairs")
    --         npairs:setup({
    --             disable_filetype = { "TelescopePrompt", "spectre_panel" },
    --             disable_in_macro = true,        -- disable when recording or executing a macro
    --             disable_in_visualblock = false, -- disable when insert after visual block mode
    --             disable_in_replace_mode = true,
    --             ignored_next_char = [=[[%w%%%'%[%"%.%`%$]]=],
    --             enable_moveright = true,
    --             enable_afterquote = true,         -- add bracket pairs after quote
    --             enable_check_bracket_line = true, -- check bracket in same line
    --             enable_bracket_in_quote = true,   --
    --             enable_abbr = false,              -- trigger abbreviation
    --             break_undo = true,                -- switch for basic rule break undo sequence
    --             check_ts = false,
    --             map_cr = false,
    --             map_bs = false,
    --             map_c_h = false, -- Map the <C-h> key to delete a pair
    --             map_c_w = false, -- map <c-w> to delete a pair if possible
    --             fast_wrap = {},
    --         })
    --         _G.MUtils = {}
    --
    --         MUtils.CR = function()
    --             if vim.fn.pumvisible() ~= 0 then
    --                 if vim.fn.complete_info({ "selected" }).selected ~= -1 then
    --                     return npairs.esc("<c-y>")
    --                 else
    --                     return npairs.esc("<c-e>") .. npairs.autopairs_cr()
    --                 end
    --             else
    --                 return npairs.autopairs_cr()
    --             end
    --         end
    --         remap("i", "<cr>", "v:lua.MUtils.CR()", { expr = true, noremap = true })
    --
    --         MUtils.BS = function()
    --             if vim.fn.pumvisible() ~= 0 and vim.fn.complete_info({ "mode" }).mode == "eval" then
    --                 return npairs.esc("<c-e>") .. npairs.autopairs_bs()
    --             else
    --                 return npairs.autopairs_bs()
    --             end
    --         end
    --         remap("i", "<bs>", "v:lua.MUtils.BS()", { expr = true, noremap = true })
    --     end,
    -- },

    {
        "OXY2DEV/helpview.nvim",
        lazy = false
    },
}
