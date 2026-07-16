-- `mini.completion`  |  Completion and signature help
--
--  https://github.com/nvim-mini/mini.nvim/blob/main/readmes/mini-completion.md
--

local mini_completion = require("mini.completion")
mini_completion.setup()

-- set completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend("force", capabilities,
  mini_completion.get_lsp_capabilities()
)
vim.lsp.config('*', { capabilities = capabilities })


