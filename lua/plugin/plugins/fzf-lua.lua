-- `fzf-lua` using vim.pack
--
-- picker & fuzzy finder
--
-- https://github.com/ibhagwan/fzf-lua
--
-- New Commands:
--  :FzfLua
--

--- Add Pack ---
local get_repo = require("plugin.utils.pack-helper").get_repo

vim.pack.add({
  get_repo("ibhagwan", "fzf-lua")
})

--- Setup ---
require("fzf-lua").setup({})


--- Keymaps ---
local Fzf = require("fzf-lua")

vim.keymap.set('n', "<leader>ff", function() Fzf.global() end, { desc = 'FzF Files (Global)' })
vim.keymap.set('n', "<leader>fg", function() Fzf.live_grep_native() end, { desc = 'FzF Live Grep' })
vim.keymap.set({ 'n', 'x' }, "<leader>fw", function() Fzf.grep_cword() end, { desc = 'FzF current word/selection' })

vim.keymap.set('n', "<leader>fh", function() Fzf.helptags() end, { desc = 'FzF Help' })
vim.keymap.set('n', "<leader>fk", function() Fzf.keymaps() end, { desc = 'FzF Keymaps' })
vim.keymap.set('n', "<leader>fo", function() Fzf.nvim_options() end, { desc = 'FzF NeoVim Options' })

-- override undotree
vim.keymap.set('n', "<leader>u", function() Fzf.undotree() end, { remap = true, desc = 'Fzf undotree' })
vim.keymap.set('n', "<leader>fu", function() Fzf.undotree() end, { desc = 'Fzf undotree' })
