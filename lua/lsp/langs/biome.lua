-- configs for `biome` (javascript, typescript)
--
-- Biome is a linter + formatter. Here it only provides lint diagnostics; js/ts
-- formatting stays with `oxfmt` in `conform.nvim`, and types come from `tsc`.
--
-- The server attaches only when the project has a biome config (`biome.json`
-- and friends), so projects that do not use biome are left alone.
--


-- Config LSP
vim.lsp.config('biome', {
  filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
})


-- Enable LSP
vim.lsp.enable('biome')
