# Configure LSP & Formatters

## Configuring LSP

Procedure:

```text
Find LSP → Install → mason.lua → lua/lsp/xxx.lua → lua/core/lsp.lua
```

**Example** — config LSP for lua:

1. Find which LSP to use by `:h lspconfig-all` or check docs of [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md).

2. Install the language server globally or by mason: `:MasonInstall lua-language-server`

3. _(Optional)_ Auto-install on new machines: add it to the `ensure_installed` list in `lua/plugin/plugins/mason.lua`:

   ```lua
   local ensure_installed = {
     -- ...existing...
     "lua-language-server",
   }
   ```

4. Create `lua/lsp/langs/lua.lua`:

   ```lua
   -- config LSP
   vim.lsp.config('lua_ls', {
    settings = {
      -- dismiss warning for `vim`
      Lua = { diagnostics = { globals = { 'vim' } } },
    },
   })

   -- enable lsp
   vim.lsp.enable('lua_ls')
   ```

5. Register in `lua/lsp/lsp.lua`:

   ```lua
   enable_lsp("lua")
   ```

## Configuring Formatters

Formatters are managed by [conform.nvim](https://github.com/stevearc/conform.nvim).
The configuration lives in `lua/plugin/plugins/conform.lua`; conform is loaded
from `lua/plugin/pack.lua`, so no LSP registration is involved.

Procedure:

```text
Find formatter → Install → lua/plugin/plugins/conform.lua (formatters_by_ft)
```

### Built-in formatters

1. Find the formatter name in `:h conform-formatters` or the
   [formatter list](https://github.com/stevearc/conform.nvim#formatters).

2. Install it globally or with mason: `:MasonInstall oxfmt`.

   To auto-install on new machines, add it to `ensure_installed` in
   `lua/plugin/plugins/mason.lua`:

   ```lua
   local ensure_installed = {
     -- ...existing...
     "oxfmt",
   }
   ```

3. Add the filetype to the existing `formatters_by_ft` table in
   `lua/plugin/plugins/conform.lua`:

   ```lua
   Conform.setup({
     formatters_by_ft = {
       -- ...
       javascript = { "oxfmt" },
       markdown = { "rumdl" },
       python = { "ruff_format" },
     },
     default_format_opts = {
       -- use LSP formatting when no conform formatter is available
       lsp_format = "fallback",
     },
   })
   ```

Conform already ships the formatter definitions, so no `require()` call is
needed. Multiple formatters for one filetype run in order; add
`stop_after_first = true` to use the first available one.

Check formatter detection with `:ConformInfo`.

### Custom formatters

Define a custom formatter when it is not in conform's list:

```lua
Conform.formatters.my_fmt = {
  command = "myfmt",
  args = { "--stdin-filepath", "$FILENAME" },
  stdin = true,
}

Conform.setup({
  formatters_by_ft = {
    foo = { "my_fmt" },
  },
})
```

To adjust a built-in formatter, override only the fields you need; conform
merges the result with the built-in definition:

```lua
Conform.formatters.shfmt = {
  append_args = { "-i", "2" },
}
```

Use `inherit = false` to replace the built-in definition completely. See
`:h conform-options` and the README section "Customizing formatters".

### Linters

Conform only formats; it does not run linters. The former efm-langserver setup
is disabled and kept in `lua/lsp/unused/efm.lua`, with its plugin in
`lua/plugin/unused/efmls-configs-nvim.lua`. Re-enable that setup or add a
dedicated linter plugin if linting is needed.

### Formatting keymap

`<A-F>` is defined in `lua/plugin/plugins/conform.lua`, overriding the fallback
mapping in `lua/core/keymaps.lua` when the plugin loads:

```lua
vim.keymap.set({ "n", "x", "i" }, "<A-F>", function()
  if #Conform.list_formatters(0) > 0 then
    Conform.format({ async = true })
  else
    vim.lsp.buf.format({ async = true })
  end

  local filepath = vim.fn.expand("%")
  vim.notify(filepath .. " formatted (or failed).")
end, { remap = true, desc = "Format Buffer" })
```

It uses conform when a formatter is available for the current buffer, otherwise
falls back to LSP formatting. Run `:ConformInfo` to check formatter availability
and the log file.
