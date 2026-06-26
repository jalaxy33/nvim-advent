-- `<PLUGIN>` using vim.pack
local M = {}

M.setup = function()
  vim.pack.add({
    '<REPO_URL>'
  })

  -- options
  require("<PLUGIN>").setup({})
end

return M
