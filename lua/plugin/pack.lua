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

-- File picker
load_plugin(plugindir, "fzf-lua") -- file picker & fuzzy finder

-- File Browser
load_plugin(plugindir, "neo-tree") -- tree-style file browser

-- Toggle terminal
load_plugin(plugindir, "toggleterm")

-- bufferline
load_plugin(plugindir, "bufferline")

-- Git integration
load_plugin(plugindir, "gitsigns") -- git integration for buffer

-- Misc
load_plugin(plugindir, "mini")         -- collections of plugins
load_plugin(plugindir, "which-key")    -- keymap indication
load_plugin(plugindir, "live-preview") -- preview Markdown/HTML in browser

-- LSP
load_plugin(plugindir, "nvim-treesitter") -- treesitter configs for more languages
load_plugin(plugindir, "nvim-lspconfig")  -- quickstart LSP configs
load_plugin(plugindir, "mason")           -- LSP installation
