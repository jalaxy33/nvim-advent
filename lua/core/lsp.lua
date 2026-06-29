-- core/lsp.lua
--
-- LSP configs.
--
-- Notes:
--
-- 1. Settings for each language are placed under `lua/lsp/`.
--
-- 2. Please load after installing `nvim-lspconfig` plugin.
--
-- 3. Check all provided [lsp configs](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md):
--
--    :help lspconfig-all
--
--  or visit docs of [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md)
--
-- 4. Check lsp status:
--
--    :checkhealth vim.lsp
--
--  Please install the specific language servers first and make sure they can be found in `$PATH`. For example, `lua-language-server` for lua.
--



-- ===================================
-- Global LSP Settings
-- ===================================

local capabilities = vim.lsp.protocol.make_client_capabilities()

vim.lsp.config('*', {
  capabilities = capabilities
})


-- ===================================
-- Enable LSP servers
-- ===================================

require("lsp.lua") -- [lua] by `lua-language-server`
