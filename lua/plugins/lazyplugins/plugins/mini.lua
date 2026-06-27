-- `mini.nvim` using lazy.nvim

return {
  {
    "nvim-mini/mini.nvim", version = false,
    config = function()
      -- statusline
      require('mini.statusline').setup()
    end
  }
}
