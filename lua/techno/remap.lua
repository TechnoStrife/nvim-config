-- vim.g.mapleader = " "

-- properly indent when `i` on empty line
vim.keymap.set("n", "i", function()
	return (string.match(vim.api.nvim_get_current_line(), "^%s*$") ~= nil and vim.v.count == 0) and [["_cc]] or "i"
end, { expr = true, noremap = true })
vim.keymap.set("n", "a", function()
	return (string.match(vim.api.nvim_get_current_line(), "^%s*$") ~= nil and vim.v.count == 0) and [["_cc]] or "a"
end, { expr = true, noremap = true })

-- vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
-- vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- remap P to swap the " register and p to just replace selection with paste
vim.keymap.set("v", "p", "P", { noremap = true })
vim.keymap.set("v", "P", "p", { noremap = true })

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", ":bd<CR>")

-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>rw", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- undotree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { noremap = true, silent = true, desc = "[U]ndotree toggle" })

vim.api.nvim_create_user_command("Cppath", function()
	local path = vim.fn.expand("%:p")
	vim.fn.setreg("+", path)
	vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})

vim.keymap.set(
	"n",
	"<leader>yf",
	":call setreg('+', expand('%:.') .. ':' .. line('.'))<CR>",
	{ noremap = true, silent = true, desc = "[Y]ank [f]ile name to +" }
)

local russian = false
function warn_russian()
	vim.api.nvim_echo({ { "russian!", "WarningMsg" } }, false, {})
	io.write("\7")
	russian = true
end
vim.api.nvim_create_autocmd("CursorHold", {
	pattern = "*",
	callback = function()
		if russian then
			vim.api.nvim_echo({ { "" } }, false, {})
			russian = false
		end
	end,
})
local russian_chars =
	"ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯфисвуапршолдьтщзйкыегмцчня"
for i = 1, #russian_chars do
	local c = russian_chars:sub(i, i)
	vim.keymap.set("n", c, warn_russian)
end
