return {
	{
		"mbbill/undotree",
		init = function()
			vim.g.undotree_SetFocusWhenToggle = 1
		end,
	},
	{ "RRethy/vim-illuminate" },
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		---@module "ibl"
		---@type ibl.config
		opts = {},
	},
	{
		"numToStr/Comment.nvim",
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
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			local remap = vim.api.nvim_set_keymap
			local npairs = require("nvim-autopairs")
			npairs:setup({
				disable_filetype = { "TelescopePrompt", "spectre_panel" },
				disable_in_macro = true, -- disable when recording or executing a macro
				disable_in_visualblock = false, -- disable when insert after visual block mode
				disable_in_replace_mode = true,
				ignored_next_char = [=[[%w%%%'%[%"%.%`%$]]=],
				enable_moveright = true,
				enable_afterquote = true, -- add bracket pairs after quote
				enable_check_bracket_line = true, -- check bracket in same line
				enable_bracket_in_quote = true, --
				enable_abbr = false, -- trigger abbreviation
				break_undo = true, -- switch for basic rule break undo sequence
				check_ts = false,
				map_cr = false,
				map_bs = false,
				map_c_h = false, -- Map the <C-h> key to delete a pair
				map_c_w = false, -- map <c-w> to delete a pair if possible
				fast_wrap = {},
			})
			_G.MUtils = {}

			MUtils.CR = function()
				if vim.fn.pumvisible() ~= 0 then
					if vim.fn.complete_info({ "selected" }).selected ~= -1 then
						return npairs.esc("<c-y>")
					else
						return npairs.esc("<c-e>") .. npairs.autopairs_cr()
					end
				else
					return npairs.autopairs_cr()
				end
			end
			remap("i", "<cr>", "v:lua.MUtils.CR()", { expr = true, noremap = true })

			MUtils.BS = function()
				if vim.fn.pumvisible() ~= 0 and vim.fn.complete_info({ "mode" }).mode == "eval" then
					return npairs.esc("<c-e>") .. npairs.autopairs_bs()
				else
					return npairs.autopairs_bs()
				end
			end
			remap("i", "<bs>", "v:lua.MUtils.BS()", { expr = true, noremap = true })
		end,
	},
}
