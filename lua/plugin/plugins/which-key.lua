-- `which-key.nvim` using vim.pack

vim.pack.add({
  'https://github.com/folke/which-key.nvim'
})

--- Setup ---
require("which-key").setup({
  preset = "helix",
  triggers = {
    { "<auto>", mode = "nixsotc" },
    { "t",      mode = { "n" } },
    { "b",      mode = { "n" } },
  }
})
