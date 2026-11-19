-- `mini.pairs`  |  Autopairs - auto-insert closing brackets and quotes
--
-- https://github.com/nvim-mini/mini.nvim/blob/main/readmes/mini-pairs.md
--

require('mini.pairs').setup()

-- Disable mini.pairs for specific lang
vim.api.nvim_create_autocmd('FileType', {
  desc = 'Disable mini.pairs',
  pattern = { 'markdown' },
  callback = function()
    vim.b.minipairs_disable = true
  end,
})
