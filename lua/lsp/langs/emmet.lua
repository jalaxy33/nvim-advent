-- configs for `emmet` (html, css, jsx, vue...)
--
-- LSP provided by [emmet-language-server](https://github.com/olrtg/emmet-language-server)
-- Install it globally, or install by mason `:MasonInstall emmet-language-server`
--
-- Fills html/css fast by expanding abbreviations through completion:
--
--   !                  full html5 skeleton
--   div.card>h2+p      nested tags
--   ul>li*3            repeated items
--   img[src alt]       tag with attributes
--   m10                margin: 10px;   (inside css)
--
-- Accept the item with <C-y> (or whatever completes); snippets come with
-- tabstops, `mini.completion` handles them.
--


-- Config LSP
vim.lsp.config('emmet_language_server', {
  settings = {
    -- LSP settings go here
  }
})


-- Enable LSP
vim.lsp.enable('emmet_language_server')
