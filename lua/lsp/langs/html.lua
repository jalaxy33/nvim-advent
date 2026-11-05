-- configs for `html` (.html, and html embedded in markdown)
--
-- LSP provided by [vscode-html-language-server](https://github.com/hrsh7th/vscode-langservers-extracted)
-- Install it globally, or install by mason `:MasonInstall html-lsp`
--
-- Gives tag/attribute completion, plus CSS/Javascript completion inside
-- `style=""` and `<style>` blocks.
--
-- `filetypes` is widened to markdown on purpose: the server also completes
-- raw html there (`<div cla`, `<div style="backg">`, closing tags) and it
-- does not report diagnostics for markdown buffers.
--
-- Completions are snippets; `mini.completion` already advertises snippet
-- support through the global `vim.lsp.config('*')` capabilities.
--


-- Config LSP
vim.lsp.config('html', {
  filetypes = { 'html', 'markdown', 'markdown.mdx' },
  settings = {
    html = {
      -- LSP settings go here
    }
  }
})


-- Enable LSP
vim.lsp.enable('html')
