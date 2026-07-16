-- `mini.surround`  |  Surround actions
--
--  https://github.com/nvim-mini/mini.nvim/blob/main/readmes/mini-surround.md
--
--  Actions (start with 's'):
--    add surround: `sa`
--    delete surround: `sd`
--    replace surround: `sr`
--    find surround: `sf` or `sF` (right or left)
--    highlight surround: `sh`
--
--  After above actions:
--    `f` - function call
--    `t` - tag
--    `?` - interative
--    

require('mini.surround').setup({
  search_method = 'cover',
})
