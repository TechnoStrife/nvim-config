return {
	{
		"navarasu/onedark.nvim",
		priority = 1000,
		opts = { transparent = true },
		init = function()
			-- vim.cmd.hi 'Comment gui=none'
			vim.cmd.colorscheme("onedark")
			vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		end,
	},
}
