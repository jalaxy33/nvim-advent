-- configs for `javascript` and `typescript` (.js, .jsx, .ts, .tsx, .mjs, .cjs)
--
-- LSP provided by [typescript-language-server](https://github.com/typescript-language-server/typescript-language-server)
-- Install it globally with `npm install -g typescript typescript-language-server`,
-- or install by mason `:MasonInstall typescript-language-server`
--
-- Gives completion, hover, diagnostics, rename, and whole-file actions such as
-- organize imports (`:LspTypescriptSourceAction`).
--
-- The server picks its own project root from lock files
-- (`package-lock.json`, `yarn.lock`, `pnpm-lock.yaml`, `bun.lock*`), so no
-- root is set here. Add a `tsconfig.json` / `jsconfig.json` to a project to
-- tell it how to typecheck.
--


-- Config LSP
vim.lsp.config('ts_ls', {
  settings = {
    typescript = {
      -- server settings go here
    },
    javascript = {
      -- server settings go here
    },
  },
})


-- Enable LSP
vim.lsp.enable('ts_ls')
