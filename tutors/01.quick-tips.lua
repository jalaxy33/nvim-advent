-- quick-tips.lua

-- 01. you could use a different config quickly by
--    setting `NVIM_APPNAME` env varible:
--
--    NVIM_APPNAME="nv-new" nvim init.lua
--
--    as long as you create the `nv-new` folder in ~/.config/
--

-- 02. You could execute the lua file by executing:
--
--    :source %
--
--    or select multiple lines in visual mode and execute:
--
--    :'<'>lua
--
--    if you want to execute something:
--    :lua ...
--

-- try to execute:
print("hello neovim")
print("hello neovim")

-- try to execute the following function by `:lua MyFunc()`
MyFunc = function()
	print("hello")
end

-- 03. You could set keymaps via
--
--     vim.keymaps.set(...)
--
-- Put your keymap configs in `~/.config/nvim/init.lua` to enable your configs permanantly

-- e.g.
vim.keymap.set("n", "<space><space>x", "<cmd>source %<cr>")
vim.keymap.set("n", "<space>x", ":.lua<cr>")
vim.keymap.set("v", "<space>x", ":lua<cr>")

-- 04. Check current keymap configs by:
--     :nnoremap
--
-- Search certain key:
--     :nnoremap <space>

-- 05. We can change editor behavior by creating autocmd

-- For example:
--
-- Highlight when yanking (copying) text
--   Try it with `yap` in normal mode
--   See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- 06. Check vim library table by
--    :lua =vim
--
-- Check certain fields
--    :lua =vim.api
--    :lua =vim.api.nvim_create_autocmd
--
-- Check manual by:
--    :help
--    :help nvim_create_autocmd

-- 07. Check option value by
--    :set someopt?
--
-- Check usage by
--    :help 'someopt'

-- 08. neovim only load modules inside runtime path. Check current runtime path by:
--    :echo nvim_list_runtime_paths()

-- 09. Open yank register by
--    :reg
