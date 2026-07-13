# Configure LSP & Formatters

## Configuring LSP

Procedure:

```
Find LSP → Install → mason.lua → lua/lsp/xxx.lua → lua/core/lsp.lua
```

Example — config LSP for lua:

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
    enable_lsp(lsproot, "lua")
    ```

## Configuring Formatters

Procedure:

```
Find formatters → lua/plugin/plugins/conform.lua
```

Example — add shell script formatting with shfmt:

1. Find the formatter name by `:h conform-formatters` or check docs of [conform](https://github.com/stevearc/conform.nvim#formatters)

2. Add to `lua/plugin/plugins/conform.lua`:

    ```lua
    require("conform").setup({
      formatters_by_ft = {
        -- ...existing...
        sh = { "shfmt" },
        zsh = { "shfmt" },
      },
    })
    ```

3. _(Optional)_ Set indent to 2 spaces:

    ```lua
    require("conform").setup({
      -- ...other settings...
      formatters = {
        shfmt = {
          append_args = { "-i", "2" },
        },
      }
    })
    ```
