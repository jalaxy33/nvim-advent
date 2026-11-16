-- configs for `javascript` and `typescript` (.js, .jsx, .ts, .tsx, .mjs, .cjs)
--
-- LSP provided by [tsc](https://github.com/microsoft/typescript)
-- Install by mason `:MasonInstall tsc`, or globally with `npm install -g typescript`.
-- Needs TypeScript 7.0+, where `tsc --lsp` exists.
--
-- Gives completion, hover, diagnostics, rename, and inlay hints.
--
-- `nvim-lspconfig` handles the details: it prefers `<root>/node_modules/.bin/tsc`,
-- then `tsc`, then `tsgo`, and skips binaries without `--lsp`. The root is the
-- nearest package manager lock file, so one server covers a monorepo.
--


-- Config LSP
vim.lsp.config('tsc', {
  settings = {
    ['js/ts'] = {
      -- server settings go here
    },
  },
})


-- Enable LSP
vim.lsp.enable('tsc')
