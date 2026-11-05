-- configs for `css` (.css, .scss, .less)
--
-- LSP provided by [vscode-css-language-server](https://github.com/hrsh7th/vscode-langservers-extracted)
-- Install it globally, or install by mason `:MasonInstall css-lsp`
--
-- Gives property/value completion, hover docs and validation.
--


-- Config LSP
vim.lsp.config('cssls', {
  settings = {
    css = {
      -- LSP settings go here
    }
  }
})


-- Enable LSP
vim.lsp.enable('cssls')
