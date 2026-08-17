-- `nvim-treesitter` using vim.pack
--
-- Treesitter configs for more languages. [`tree-sitter-cli`](https://github.com/tree-sitter/tree-sitter/blob/master/crates/cli/README.md) is required.
--
-- https://github.com/nvim-treesitter/nvim-treesitter
--
-- Check treesitter status by:
--    :checkhealth nvim-treesitter   -- this plugin
--    :checkhealth vim.treesitter    -- neovim built-in
--
-- Supported languages can be found in [this page](https://github.com/nvim-treesitter/nvim-treesitter/blob/main/SUPPORTED_LANGUAGES.md).
--

-- Pre-check: `tree-sitter` CLI is required
if vim.fn.executable("tree-sitter") == 0 then
  vim.notify(
    "nvim-treesitter: 'tree-sitter' command not found, skipping treesitter config",
    vim.log.levels.WARN
  )
  return
end

--- Add Pack ---
local get_repo = require("plugin.utils.pack-helper").get_repo

vim.pack.add({
  get_repo("nvim-treesitter/nvim-treesitter")
})


--- Setup ---

-- Install language supports

local ensure_installed = {
  -- languages
  "rust", "python",
  "html", "css",

  -- extras
  "http", "mermaid",
  "json", "yaml", "toml",
  "bash", "fish", "zsh",
  "gitignore", "ssh_config",

  -- ignore already installed by native `vim.treesitter`
  -- e.g. markdown, lua, vim... (run `:checkhealth vim.treesitter`)
}

require("nvim-treesitter").install(ensure_installed)
