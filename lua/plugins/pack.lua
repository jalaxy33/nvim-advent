-- use `vim.pack` as package manager


-- ===========================================
-- Helper Functions
-- ===========================================

local function load_plugin(pluginroot, name)
  require(pluginroot .. "." .. name).setup()
end


-- ===========================================
-- Load Plugins
-- ===========================================
local pluginroot = "plugins.packplugins"

-- helper modules for `vim.pack`
load_plugin(pluginroot, "pack-helper")

-- external plugins
load_plugin(pluginroot, "mini")  -- useful collections for statusline and more
load_plugin(pluginroot, "neo-tree")  -- tree-style file browser
load_plugin(pluginroot, "fff")  -- fuzzy finder
