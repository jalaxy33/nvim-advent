-- `nvim-treesitter` using vim.pack
--
-- Treesitter configs for more languages. [`tree-sitter-cli`](https://github.com/tree-sitter/tree-sitter/blob/master/crates/cli/README.md) is required.
--
-- Check treesitter status by:
--    :checkhealth nvim-treesitter   -- this plugin
--    :checkhealth vim.treesitter    -- neovim built-in
--
-- Supported languages can be found in [this page](https://github.com/nvim-treesitter/nvim-treesitter/blob/main/SUPPORTED_LANGUAGES.md).
--

vim.pack.add({
  'https://github.com/nvim-treesitter/nvim-treesitter'
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
