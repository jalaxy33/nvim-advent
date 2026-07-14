-- config for `efm`
--
-- A general-purpose LSP to support linters and formatters.
--
-- - Please install `efm-langserver` globally or installed by mason `:MasonInstall efm`:
--
--    https://github.com/mattn/efm-langserver
--
-- - The `efmls-configs-nvim` plugin is required to provide configs:
--
--    https://github.com/creativenull/efmls-configs-nvim
--
-- - Check supported formatters and linters by `:h efmls-configs-setup` or visit:
--
--    https://github.com/creativenull/efmls-configs-nvim/blob/main/doc/SUPPORTED_LIST.md
--
-- - To customize formatters or linters, make sure to define as table, like:
--    ```
--    lua = {
--      {formatCommand = "lua-format -i", formatStdin = true}
--    }
--    ```
--


--- Helper Functions ---

local function get_formatter(name)
  require("efmls-configs.formatters." .. name)
end

-- local function get_linter(name)
--   require("efmls-configs.linters." .. name)
-- end


--- Setup ---

-- register formatters and linters
local prettierd = get_formatter("prettier_d")
local fish_indent = get_formatter("fish_indent")
local ruff = get_formatter("ruff")
local shfmt = {
  -- set bash/zsh indent to % spaces (using `-i` arg)
  formatCommand = "shfmt -ci -s -bn" .. " -i 2",
  formatStdin = true
}


-- set languages
local languages = {
  -- format by prettierd
  css = { prettierd },
  html = { prettierd },
  json = { prettierd },
  markdown = { prettierd },
  javascript = { prettierd },
  typescript = { prettierd },
  -- languages
  python = { ruff },
}

if vim.fn.has('unix') then  -- only used in Linux/MacOS
  languages = vim.tbl_extend('force', languages, {
    -- shell
    sh = { shfmt },
    zsh = { shfmt },
    fish = { fish_indent },
  })
end


-- setup efm
vim.lsp.config("efm", {
  filetypes = vim.tbl_keys(languages),
  settings = {
    rootMarkers = { '.git/' },
    languages = languages,
  },
  init_options = {
    documentFormatting = true,
    documentRangeFormatting = true,
  },
  cmd = { 'efm-langserver' },
})


--- Enable LSP ---

vim.lsp.enable("efm")
