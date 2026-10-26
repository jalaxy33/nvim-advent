-- `mini.completion`  |  Completion and signature help
--
--  https://github.com/nvim-mini/mini.nvim/blob/main/readmes/mini-completion.md
--

-- early return when disabled
if vim.g.native_autocomplete then return end

--- Initialization ---

local mini_completion = require("mini.completion")
mini_completion.setup()

-- set completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend("force", capabilities,
  mini_completion.get_lsp_capabilities()
)
vim.lsp.config('*', { capabilities = capabilities })

--- Filepath completion ---

-- In-process LSP server feeding file paths into the LSP stage. Only used with
-- `mini.completion`: native `vim.lsp.completion` has its own setup.
vim.lsp.config("filepaths_ls", {
  settings = {
    insert_dir_trailing_slash = true, -- keep `/` so the next level starts right away
    sort = "dir_first",
    max_items = 200,                  -- `pumheight` is 8, 1000 items is waste
  },
})
vim.lsp.enable("filepaths_ls")
