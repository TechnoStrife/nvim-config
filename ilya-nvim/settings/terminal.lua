vim.keymap.set('n', ',st', function()
  vim.cmd.new()
  vim.cmd.wincmd 'J'
  vim.api.nvim_win_set_height(0, 16)
  vim.wo.winfixheight = true
  vim.cmd.term()
end)
