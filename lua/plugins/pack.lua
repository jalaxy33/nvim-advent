-- use `vim.pack` as package manager


-- ===================================
-- Helper Functions
-- ===================================

local function load_plugin(pluginroot, name)
  require(pluginroot .. "." .. name)
end


-- ===================================
-- Load Plugins
-- ===================================

local packroot = "plugins.packplugins"
local plugindir = packroot .. "." .. "plugins"

-- modules for `vim.pack`
load_plugin(packroot, "pack-helper")  -- helper module

-- 3rd-party plugins
load_plugin(plugindir, "mini")  -- useful collections for statusline and more
load_plugin(plugindir, "neo-tree")  -- tree-style file browser
load_plugin(plugindir, "fff")  -- fuzzy finder
