-- use `vim.pack` as package manager


-- ===========================================
-- Helper Functions
-- ===========================================

local function load_plugin(pluginroot, name)
  require(pluginroot .. "." .. name).setup()
end

-- ===========================================
-- Helper Functions
-- ===========================================
local pluginroot = "plugins.packplugins"

load_plugin(pluginroot, "mini")
load_plugin(pluginroot, "neo-tree")
load_plugin(pluginroot, "fff")
