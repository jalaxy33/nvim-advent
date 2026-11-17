-- configs for `oxlint` (javascript, typescript)
--
-- Oxlint is the linter from the oxc project, same toolchain as `oxfmt` in
-- `conform.nvim`. It only provides lint diagnostics; formatting stays with
-- `oxfmt`, and types come from `tsc`.
--
-- Install by mason `:MasonInstall oxlint`, or per project with
-- `npm install -D oxlint`.
--


-- Config LSP
vim.lsp.config('oxlint', {
  filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
  -- Lint any js/ts project, not only the ones with `.oxlintrc.json`
  root_dir = function(bufnr, on_dir)
    local root = vim.fs.root(bufnr, { '.oxlintrc.json', '.oxlintrc.jsonc', 'oxlint.config.ts', 'package.json' })
    if root then on_dir(root) end
  end,
})


-- Enable LSP
vim.lsp.enable('oxlint')
