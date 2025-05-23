return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		---@type snacks.Config
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
			bigfile = { enabled = true },
			dashboard = { enabled = true },
			explorer = { enabled = true },
			git = { enabled = true },
			-- indent = { enabled = true }, -- indent-blankline.nvim
			input = { enabled = true },
			lazygit = {
				enabled = true,
				win = {
					position = "float",
					height = 0,
					width = 0,
					zindex = 2000,
				},
				config = {
					os = {
						edit = '[ -z "$NVIM" ] && (nvim -- {{filename}}) || (nvim --server "$NVIM" --remote-send "q" && nvim --server "$NVIM" --remote {{filename}})',
						editAtLine = '[ -z "$NVIM" ] && (nvim +{{line}} -- {{filename}}) || (nvim --server "$NVIM" --remote-send "q" &&  nvim --server "$NVIM" --remote {{filename}} && nvim --server "$NVIM" --remote-send ":{{line}}<CR>")',
						-- editAtLineAndWait = 'nvim +{{line}} {{filename}}',
						openDirInEditor = '[ -z "$NVIM" ] && (nvim -- {{dir}}) || (nvim --server "$NVIM" --remote-send "q" && nvim --server "$NVIM" --remote {{dir}})',
						editPreset = "nvim-remote",
					},
				},
			},
			picker = { enabled = true },
			notifier = { enabled = true },
			quickfile = { enabled = true },
			-- scope = { enabled = true },
			statuscolumn = { enabled = true },
			toggle = { enabled = true },
			terminal = { enabled = true },
			words = { enabled = true },
		},
		keys = {
			-- Top Pickers & Explorer
			{
				"<leader>ss",
				function()
					Snacks.picker.smart()
				end,
				desc = "Smart Find Files",
			},
			-- { "<leader>,", function() Snacks.picker.buffers() end, desc = "Buffers" },
			-- { "<leader>/", function() Snacks.picker.grep() end, desc = "Grep" },
			{
				"<leader>:",
				function()
					Snacks.picker.command_history()
				end,
				desc = "Command History",
			},
			{
				"<leader>n",
				function()
					Snacks.picker.notifications()
				end,
				desc = "Notification History",
			},
			{
				"<leader>e",
				function()
					Snacks.explorer()
				end,
				desc = "File Explorer",
			},
			-- find
			-- { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
			-- { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
			-- { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
			-- { "<leader>fg", function() Snacks.picker.git_files() end, desc = "Find Git Files" },
			{
				"<leader>fp",
				function()
					Snacks.picker.projects()
				end,
				desc = "Projects",
			},
			-- { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent" },
			-- git
			{
				"<leader>gb",
				function()
					Snacks.picker.git_branches()
				end,
				desc = "Git Branches",
			},
			{
				"<leader>gl",
				function()
					Snacks.lazygit.log() --[[Snacks.picker.git_log()]]
				end,
				desc = "Git Log",
			},
			{
				"<leader>gL",
				function()
					Snacks.picker.git_log_line()
				end,
				desc = "Git Log Line",
			},
			{
				"<leader>gf",
				function()
					Snacks.lazygit.log_file() --[[ Snacks.picker.git_log_file() ]]
				end,
				desc = "Git Log File",
			},
			{
				"<leader>gs",
				function()
					Snacks.picker.git_status()
				end,
				desc = "Git Status",
			},
			-- { "<leader>gS", function() Snacks.picker.git_stash() end, desc = "Git Stash" },
			{
				"<leader>gdh",
				function()
					Snacks.picker.git_diff()
				end,
				desc = "Git Diff (Hunks)",
			},
			{
				"<leader>gg",
				function()
					Snacks.lazygit.open()
				end,
				desc = "Open lazygit",
			},
			-- search
			{
				'<leader>s"',
				function()
					Snacks.picker.registers()
				end,
				desc = "Registers",
			},
			{
				"<leader>s/",
				function()
					Snacks.picker.search_history()
				end,
				desc = "Search History",
			},
			{
				"<leader>sa",
				function()
					Snacks.picker.autocmds()
				end,
				desc = "Autocmds",
			},
			-- { "<leader>sb", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
			{
				"<leader>sc",
				function()
					Snacks.picker.command_history()
				end,
				desc = "Command History",
			},
			{
				"<leader>sC",
				function()
					Snacks.picker.commands()
				end,
				desc = "Commands",
			},
			-- { "<leader>sd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
			-- { "<leader>sD", function() Snacks.picker.diagnostics_buffer() end, desc = "Buffer Diagnostics" },
			-- { "<leader>sk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
			{
				"<leader>sl",
				function()
					Snacks.picker.loclist()
				end,
				desc = "Location List",
			},
			{
				"<leader>sm",
				function()
					Snacks.picker.marks()
				end,
				desc = "Marks",
			},
			{
				"<leader>sq",
				function()
					Snacks.picker.qflist()
				end,
				desc = "Quickfix List",
			},
			-- LSP
			-- { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
			-- { "gD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
			-- { "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
			-- { "gI", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
			-- { "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
			-- { "<leader>ss", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
			-- { "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
			-- Other
			-- { "<leader>z",  function() Snacks.zen() end, desc = "Toggle Zen Mode" },
			-- { "<leader>Z",  function() Snacks.zen.zoom() end, desc = "Toggle Zoom" },
			-- { "<leader>.",  function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
			-- { "<leader>S",  function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },
			{
				"<leader>n",
				function()
					Snacks.notifier.show_history()
				end,
				desc = "Notification History",
			},
			-- { "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete Buffer" },
			-- { "<leader>cR", function() Snacks.rename.rename_file() end, desc = "Rename File" },
			{
				"<leader>gB",
				function()
					Snacks.gitbrowse()
				end,
				desc = "Git Browse",
				mode = { "n", "v" },
			},
			{
				"<leader>un",
				function()
					Snacks.notifier.hide()
				end,
				desc = "Dismiss All Notifications",
			},
			{
				"<c-/>",
				function()
					Snacks.terminal()
				end,
				desc = "Toggle Terminal",
			},
			{
				"]]",
				function()
					Snacks.words.jump(vim.v.count1)
				end,
				desc = "Next Reference",
				mode = { "n", "t" },
			},
			{
				"[[",
				function()
					Snacks.words.jump(-vim.v.count1)
				end,
				desc = "Prev Reference",
				mode = { "n", "t" },
			},
		},
		init = function()
			vim.api.nvim_create_autocmd("User", {
				pattern = "VeryLazy",
				callback = function()
					-- Setup some globals for debugging (lazy-loaded)
					_G.dd = function(...)
						Snacks.debug.inspect(...)
					end
					_G.bt = function()
						Snacks.debug.backtrace()
					end
					vim.print = _G.dd -- Override print to use snacks for `:=` command

					-- Create some toggle mappings
					-- Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
					-- Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
					-- Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
					-- Snacks.toggle.diagnostics():map("<leader>ud")
					-- Snacks.toggle.line_number():map("<leader>ul")
					-- Snacks.toggle.option("conceallevel",
					--     { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
					--     :map("<leader>uc")
					-- Snacks.toggle.treesitter():map("<leader>uT")
					-- Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map(
					--     "<leader>ub")
					-- Snacks.toggle.inlay_hints():map("<leader>uh")
					-- Snacks.toggle.indent():map("<leader>ug")
					-- Snacks.toggle.dim():map("<leader>uD")
				end,
			})
		end,
	},
}
