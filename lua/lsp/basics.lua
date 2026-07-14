-- configs for `basics_ls`
--
-- LSP provided by [basics-language-server](https://github.com/antonk52/basics-language-server), used for Buffer completion, Path completion & Snippet completion.
--

-- config LSP
vim.lsp.config("basics_ls", {
  settings = {
    buffer = {
      enable = true,
      minCompletionLength = 4,
      matchStrategy = 'fuzzy', -- 'exact' or 'fuzzy'
    },
    path = {
      enable = true,
    },
    snippet = {
      enable = false,
      sources = {},            -- paths to package containing snippets
      matchStrategy = 'fuzzy', -- 'exact' or 'fuzzy'
    },
  }
})

-- enable LSP
vim.lsp.enable("basics_ls")
