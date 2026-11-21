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

-- Parser builds go through the `tree-sitter` CLI, which uses the `cc` crate. On Windows
-- it looks for MSVC only, so a mingw gcc on PATH must be passed explicitly with a target
-- triple; otherwise the build dies with "program not found". Linux and macOS find a
-- compiler on their own, so the whole branch is skipped there.
local can_build = true
if vim.fn.has("win32") == 1 then
  local vswhere = "C:\\Program Files (x86)\\Microsoft Visual Studio\\Installer\\vswhere.exe"
  local has_msvc = vim.fn.executable("cl") == 1
  if not has_msvc and vim.fn.filereadable(vswhere) == 1 then
    local out = vim.fn.system({
      vswhere,
      "-products", "*",
      "-property", "installationPath",
      "-requires", "Microsoft.VisualStudio.Component.VC.Tools.x86.x64",
    })
    has_msvc = vim.v.shell_error == 0 and out:find("%S") ~= nil
  end

  if not has_msvc then
    local gcc = vim.fn.exepath("gcc")
    if gcc == "" then
      can_build = false
      vim.notify(
        "nvim-treesitter: no C compiler found (MSVC Build Tools or mingw), skipping parser install",
        vim.log.levels.WARN
      )
    else
      vim.env.CC = gcc
      vim.env.TARGET = vim.fn.has("win64") == 1 and "x86_64-pc-windows-gnu" or "i686-pc-windows-gnu"
    end
  end
end

if can_build then
  require("nvim-treesitter").install(ensure_installed)
end
