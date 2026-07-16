-- use `vim.pack` as package manager

local plugindir = "plugin.plugins"
local utilsdir = "plugin.utils"

-- ===================================
-- Helper Functions
-- ===================================

local function load_plugin(name)
  require(plugindir .. "." .. name)
end

local function load_util(name)
  require(utilsdir .. "." .. name)
end


-- ===================================
-- Load Utils
-- ===================================

load_util("pack-helper") -- helpers for `vim.pack` manager


-- ===================================
-- Load Plugins
-- ===================================

-- File picker
load_plugin("fzf-lua") -- file picker & fuzzy finder

-- File Browser
load_plugin("neo-tree") -- tree-style file browser

-- Toggle terminal
load_plugin("toggleterm")

-- bufferline
load_plugin("bufferline")

-- Git integration
load_plugin("gitsigns") -- git integration for buffer

-- Misc
load_plugin("mini")         -- collections of plugins
load_plugin("live-preview") -- preview Markdown/HTML in browser

-- LSP
load_plugin("nvim-treesitter")    -- treesitter configs for more languages
load_plugin("nvim-lspconfig")     -- quickstart LSP configs
load_plugin("mason")              -- LSP installation
load_plugin("efmls-configs-nvim") -- formatters & linters for efm
