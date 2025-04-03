vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.shortmess:append("c")

local lspkind = require("lspkind")

local cmp = require("cmp")

cmp.setup({
	sources = {
		{ name = "nvim_lsp", keyword_length = 2 }, -- from language server
		{ name = "nvim_lsp_signature_help" }, -- display function signatures with current parameter emphasized
		{ name = "nvim_lua", keyword_length = 2 }, -- complete neovim's Lua runtime API such vim.lsp.*
		{ name = "luasnip" },
		-- { name = 'vsnip', keyword_length = 2 },         -- nvim-cmp source for vim-vsnip
		{ name = "path" },
		{ name = "buffer", keyword_length = 3 }, -- source current buffer
		{ name = "lazydev", group_index = 0 },
		{ name = "calc" }, -- source for math calculation
	},
	mapping = cmp.mapping.preset.insert({
		["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
		["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),

		["<C-y>"] = cmp.mapping(
			cmp.mapping.confirm({
				select = true,
				behavior = cmp.ConfirmBehavior.Insert,
			}),
			{ "i", "c" }
		),
		-- Add tab support
		-- ['<S-Tab>'] = cmp.mapping.select_prev_item(),
		-- ['<Tab>'] = cmp.mapping.select_next_item(),
		["<C-S-f>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		-- ['<CR>'] = cmp.mapping.confirm({
		--     behavior = cmp.ConfirmBehavior.Insert,
		--     select = true,
		-- })
	}),
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
			-- vim.fn["vsnip#anonymous"](args.body)
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	formatting = {
		-- format = lspkind.cmp_format({
		-- 	mode = "symbol_text",
		-- 	maxwidth = 80,
		-- 	ellipsis_char = "...",
		-- 	show_labelDetails = true,
		-- }),
		format = function(entry, item)
			local menu_icon = {
				nvim_lsp = "λ",
				vsnip = "⋗",
				buffer = "Ω",
				path = "🖫",
			}
			item.menu = menu_icon[entry.source.name]
			return item
		end,
		expandable_indicator = true,
		fields = { "abbr", "kind", "menu" },
	},
})

local ls = require("luasnip")
ls.config.set_config({
	history = false,
	updateevents = "TextChanged,TextChangedI",
})
require("luasnip.loaders.from_vscode").lazy_load()

for _, ft_path in ipairs(vim.api.nvim_get_runtime_file("lua/custom/snippets/*.lua", true)) do
	loadfile(ft_path)()
end

vim.keymap.set({ "i", "s" }, "<c-k>", function()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<c-j>", function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end, { silent = true })
