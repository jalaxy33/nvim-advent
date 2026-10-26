-- configs for `rust` (.rs)
--
-- LSP provided by [rust-analyzer](https://github.com/rust-lang/rust-analyzer)
-- Install it globally, or install by mason `:MasonInstall rust-analyzer`
--


-- Config LSP
vim.lsp.config('rust_analyzer', {
  settings = {
    ['rust-analyzer'] = {
      -- LSP settings go here
    }
  }
})


-- Enable LSP
vim.lsp.enable('rust_analyzer')

