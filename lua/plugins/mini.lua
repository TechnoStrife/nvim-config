return {
  'echasnovski/mini.nvim',
  config = function()
    -- Better Around/Inside textobjects
    require('mini.ai').setup { n_lines = 500 }

    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    -- require('mini.surround').setup()
    require('mini.pairs').setup()
    require('mini.splitjoin').setup()
    require('mini.move').setup()
  end,
}
