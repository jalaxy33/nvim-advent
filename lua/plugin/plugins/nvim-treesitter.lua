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


--- Autocmds  ---

-- Automatically call `vim.treesitter.start` to enable Treesitter highlights
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",         -- for all filetypes
  callback = function(args)
    local buf = args.buf -- buffer_number of file
    local ft = vim.bo[buf].filetype

    local lang = vim.treesitter.language.get_lang(ft) -- get language name
    -- if no matching filetype, falls back to vim regex highlights
    if not lang then
      return
    end

    local ok_add = pcall(vim.treesitter.language.add, lang) -- try to load the parser
    -- if failed, falls back
    if not ok_add then
      return
    end

    -- starts treesitter highlights on the buffer
    pcall(vim.treesitter.start, buf, lang)
  end
})
