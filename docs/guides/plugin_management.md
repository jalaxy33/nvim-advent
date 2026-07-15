# Plugin Management

This config uses Neovim 0.12's built-in `vim.pack` package manager. No external plugin manager is needed.

## Architecture

```
lua/plugin/pack.lua          → Entry point: registers all plugins
lua/plugin/plugins/*.lua     → Individual plugin configs
lua/plugin/utils/*.lua       → Utility modules (e.g. pack-helper)
```

## How to Add a Plugin

### Step 1: Create Plugin Config

Create a new file under `lua/plugin/plugins/`. Use the template:

```lua
-- `my-plugin` using vim.pack

vim.pack.add({
  'https://github.com/<user>/<repo>'
})

--- Setup ---
require("my-plugin").setup({})


--- Keymaps ---
vim.keymap.set('n', "<leader>xx", "<cmd>MyCommand<CR>", { desc = "Description" })
```

### Step 2: Register in Entry Point

In `lua/plugin/pack.lua`, add a line in the plugins section:

```lua
load_plugin(plugindir, "my-plugin")
```

### Step 3: Restart Neovim

`vim.pack` will automatically clone the repository and make it available. No manual install step needed.

## How to Remove a Plugin

1. Delete the plugin file from `lua/plugin/plugins/`
2. Remove the corresponding `load_plugin(...)` line from `lua/plugin/pack.lua`
3. Run `<leader>pc` inside Neovim to clean unused plugins from disk, or manually delete the directory under `~/.local/share/nvim/site/pack/core/opt/`

## How to Update Plugins

Use `<leader>pu` to update all plugins, or `:lua vim.pack.update()` directly.

## Keymaps

| Key | Description |
|-----|-------------|
| `<leader>pu` | Update all plugins |
| `<leader>pc` | Clean unused plugins |

## Unused Plugins

Deprecated or temporarily removed plugins can be moved to `lua/plugin/unused/` instead of being deleted. This way they remain in the codebase for reference but are not loaded.

## Plugin Storage

All plugins are stored under `~/.local/share/nvim/site/pack/core/opt/` and managed automatically by `vim.pack`.
