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

local plugindir = "plugin.plugins"
local utilsdir = "plugin.utils"

--- Utils ---

load_plugin(utilsdir, "pack-helper") -- helpers for `vim.pack` manager


--- 3rd-party Plugins ---

-- LSP
load_plugin(plugindir, "nvim-treesitter") -- treesitter configs for more languages
load_plugin(plugindir, "nvim-lspconfig")  -- quickstart LSP configs

-- File picker
load_plugin(plugindir, "fff") -- file picker & fuzzy finder

-- File Browser
load_plugin(plugindir, "neo-tree") -- tree-style file browser

-- Misc
load_plugin(plugindir, "mini") -- collections of plugins
