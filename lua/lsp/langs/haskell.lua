-- LSP configs for `haskell` (.hs)
--
-- LSP provided by `haskell-language-server` (hls)
--    https://github.com/haskell/haskell-language-server
-- Install it globally, or install it with Mason `:MasonInstall haskell-language-server`
--

vim.lsp.config('hls', {
  filetypes = { 'haskell', 'lhaskell', 'cabal' },
})

vim.lsp.enable('hls')
