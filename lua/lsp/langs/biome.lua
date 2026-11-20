-- configs for `biome`
--
-- Biome is the all-in-one toolchain (linter + formatter + import sorting),
-- successor of Rome. This server provides lint diagnostics and code actions;
-- formatting on save is set up in `lua/plugin/plugins/conform.lua`.
--
-- Install by mason `:MasonInstall biome`, globally with
-- `npm install -g @biomejs/biome`, or per project with
-- `npm install -D @biomejs/biome`.
--
-- `nvim-lspconfig` starts the server only in projects with a `biome.json`
-- (or `.biome.json`), which is what we want: no config, no lint rules.
--


-- Config LSP
vim.lsp.config('biome', {
  filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'css', 'html', 'json', 'jsonc', 'vue' },
})


-- Enable LSP
vim.lsp.enable('biome')
