-- configs for `python` (.py)
--
-- LSP provided by [ty](https://docs.astral.sh/ty/).
-- Install it globally, or install by mason `:MasonInstall ty`
--


-- Config LSP
vim.lsp.config('ty', {
  settings = {
    ty = {
      -- ty language server settings go here
    }
  }
})


-- Enable LSP
vim.lsp.enable('ty')
