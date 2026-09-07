-- `mini.completion`  |  Completion and signature help
--
--  https://github.com/nvim-mini/mini.nvim/blob/main/readmes/mini-completion.md
--

-- early return when disabled
if vim.g.native_autocomplete
    or not vim.g.autocomplete_fallback then
  return
end

-- initailization
local mini_completion = require("mini.completion")
mini_completion.setup()

-- set completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend("force", capabilities,
  mini_completion.get_lsp_capabilities()
)
vim.lsp.config('*', { capabilities = capabilities })
