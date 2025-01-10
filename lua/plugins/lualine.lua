function lspprogess()
	return require("lsp-progress").progress()
end

return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local theme = require("lualine.themes.onedark")
			require("lualine").setup({
				options = {
					icons_enabled = true,
					theme = theme,
					component_separators = { left = "", right = "" },
					section_separators = { left = "", right = "" },
					disabled_filetypes = {
						statusline = {},
						winbar = {},
					},
					ignore_focus = {},
					always_divide_middle = true,
					always_show_tabline = true,
					globalstatus = false,
					refresh = {
						statusline = 100,
						tabline = 100,
						winbar = 100,
					},
				},
				sections = {
					lualine_a = { { "mode", fmt = string.lower } },
					lualine_b = {
						{
							"branch",
							fmt = function(str)
								if string.find(str, "/") then
									return ".." .. str:sub(str:find("/[^/]*$"))
								else
									return str
								end
							end,
						},
						"diff",
						"diagnostics"
					},
					lualine_c = {
						{
							"filename",
							path = 1, -- relative path
							file_status = true,
						},
						lspprogess
					},
					lualine_x = { "encoding", "fileformat", "filetype" },
					lualine_y = { "harpoon2" }, -- "selectioncount" :h showcmd
					lualine_z = { "location" },
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = { "filename" },
					lualine_x = { "location" },
					lualine_y = {},
					lualine_z = {},
				},
				tabline = {},
				winbar = {},
				inactive_winbar = {},
				extensions = { "mason" },
			})
		end,
	},
	{
		"letieu/harpoon-lualine",
		dependencies = {
			{
				"ThePrimeagen/harpoon",
				branch = "harpoon2",
			},
		},
	},
	{
		"linrongbin16/lsp-progress.nvim",
		config = function()
			require("lsp-progress").setup({})
			vim.api.nvim_create_augroup("lualine_augroup", { clear = true })
			vim.api.nvim_create_autocmd("User", {
				group = "lualine_augroup",
				pattern = "LspProgressStatusUpdated",
				callback = require("lualine").refresh,
			})
		end,
	},
}
