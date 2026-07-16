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

local lsproot = "lsp"

-- ===================================
-- Helper Functions
-- ===================================

local function enable_lsp(name)
  require(lsproot .. "." .. name)
end


-- ===================================
-- Global LSP Settings
-- ===================================

--- diagnostic configs
vim.diagnostic.config({
  virtual_text = true,      -- inline diagnostic
  underline = true,         -- diagnostic underline
  update_in_insert = false, -- update in insert mode
})


-- ===================================
-- Enable LSP servers
-- ===================================

enable_lsp("lua")      -- [lua]
enable_lsp("python")   -- [python]
enable_lsp("rust")     -- [rust]
enable_lsp("markdown") -- [markdown]

-- enable efm to support formatters & linters
enable_lsp("efm")

-- buffer/path/snippets completion
enable_lsp("basics")
