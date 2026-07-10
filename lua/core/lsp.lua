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
-- Helper Functions
-- ===================================

local function enable_lsp(lsproot, name)
  require(lsproot .. "." .. name)
end


-- ===================================
-- Global LSP Settings
-- ===================================

-- set completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()

local MiniCompletion = require("mini.completion")
if MiniCompletion ~= nil then
  -- if `mini.completion` used, merge its capabilities together
  capabilities = vim.tbl_deep_extend("force", capabilities, MiniCompletion.get_lsp_capabilities())
end

vim.lsp.config('*', { capabilities = capabilities })

--- diagnostic configs
vim.diagnostic.config({
  virtual_text = true,      -- inline diagnostic
  underline = true,         -- diagnostic underline
  update_in_insert = false, -- update in insert mode
})


-- ===================================
-- Enable LSP servers
-- ===================================
local lsproot = "lsp"

enable_lsp(lsproot, "lua") -- [lua]
