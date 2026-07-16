# Configure LSP & Formatters

## Configuring LSP

Procedure:

```
Find LSP → Install → mason.lua → lua/lsp/xxx.lua → lua/core/lsp.lua
```

**Example** — config LSP for lua:

1. Find which LSP to use by `:h lspconfig-all` or check docs of [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md).

2. Install the language server globally or by mason: `:MasonInstall lua-language-server`

3. _(Optional)_ Auto-install on new machines: edit `lua/plugin/plugins/mason.lua`:

   ```lua
   require("mason-tool-installer").setup({
     ensure_installed = {
       -- ...existing...
       'lua-language-server',
     }
   })
   ```

4. Create `lua/lsp/lua.lua`:

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

5. Register in `lua/core/lsp.lua`:

   ```lua
   enable_lsp("lua")
   ```

## Configuring Formatters

Formatters and linters are managed through [efm-langserver](https://github.com/mattn/efm-langserver), a general-purpose LSP that wraps external tools. The [efmls-configs-nvim](https://github.com/creativenull/efmls-configs-nvim) plugin provides pre-configured formatter/linter recipes.

Procedure:

```
Find formatter → lua/lsp/efm.lua
```

### Built-in formatter recipes (efmls-configs)

1. Find supported formatters at `:h efmls-configs-setup` or the [supported list](https://github.com/creativenull/efmls-configs-nvim/blob/main/doc/SUPPORTED_LIST.md).

2. Install the formatter globally or by mason: `:MasonInstall prettierd`.

   For auto-install on new machines, add to `lua/plugin/plugins/mason.lua`:
   ```lua
   ensure_installed = { ..., 'prettierd' }
   ```

3. Register in `lua/lsp/efm.lua`:

   ```lua
   local function get_formatter(name)
     require("efmls-configs.formatters." .. name)
   end

   local prettierd = get_formatter("prettier_d")
   local ruff = get_formatter("ruff")

   local languages = {
     javascript = { prettierd },
     typescript = { prettierd },
     json = { prettierd },
     markdown = { prettierd },
     python = { ruff },
   }
   ```

### Custom formatter recipes

Define the command directly (instead of using `get_formatter()`) when:

- the tool is not in efmls-configs' supported list, or
- you need to customize the default configuration (e.g. indent width, extra flags):

```lua
local shfmt = {
  formatCommand = "shfmt -ci -s -bn -i 2",
  formatStdin = true,
}

local languages = {
  sh = { shfmt },
  zsh = { shfmt },
}
```

### Add linters

Linters work the same way via `require("efmls-configs.linters." .. name)`:

```lua
local function get_linter(name)
  require("efmls-configs.linters." .. name)
end

local languages = {
  python = { ruff, get_linter("mypy") },
}
```

### Global keymap for formatting

Already configured in `lua/core/keymaps.lua`:

```lua
vim.keymap.set({ "n", "i", "x" }, "<A-F>", function()
  vim.lsp.buf.format({ async = true })
end, { desc = "Format buffer" })
```

Since efm is an LSP server, `vim.lsp.buf.format()` triggers it just like any language server.
