-- ~/.config/nvim/init.lua
--
-- Reference:
--    https://www.youtube.com/watch?v=lljs_7xB7Ps
--    https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua


-- color theme
vim.opt.termguicolors = true
vim.cmd.colorscheme("catppuccin")

-- enable experimental `ui2` (v0.12)
--require('vim._core.ui2').enable()

-- enable built-in plugins (v0.12)
vim.cmd("packadd nvim.undotree")  -- `:Undotree`
vim.cmd("packadd nvim.difftool")  -- `:DiffTool {left} {right}`


-- ===========================================
-- Options
-- ===========================================
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.scrolloff = 10 -- keep % lines above/below cursor
vim.opt.sidescrolloff = 10 -- keep % lines left/right of cursor
vim.opt.showmatch = true -- hightlights matching brackets

vim.opt.mouse = "a" -- enable mouse support
vim.opt.clipboard:append("unnamedplus") -- use system clipboard
vim.opt.autocomplete = true  -- enable built-in autocomplete (v0.12)

vim.opt.tabstop = 2 -- tabwidth
vim.opt.shiftwidth = 2 -- indent width
vim.opt.softtabstop = 2
vim.opt.expandtab = true -- use spaces instead of tabs
vim.opt.smartindent = true -- smart auto indent
vim.opt.autoindent = true

vim.opt.ignorecase = true -- case insensitive search
vim.opt.smartcase = true -- case sensitive if uppercase in string
vim.opt.hlsearch = true -- highlight search matches
vim.opt.incsearch = true -- show matches as you type

vim.opt.pumheight = 10 -- popup menu height
vim.opt.pumblend = 10 -- popup menu transparent
vim.opt.winblend = 5 -- floating window transparency
vim.opt.synmaxcol = 400 -- syntax highlightlighting limit

vim.opt.backup = false -- do not create a backup file
vim.opt.writebackup = false -- do not write to a backup file
vim.opt.swapfile = false -- do not create a swapfile
vim.opt.undofile = true -- do create a undo file
vim.opt.autoread = true -- auto-reload changes if outside of neovim
vim.opt.autowrite = false -- do not auto-save

vim.opt.updatetime = 300 -- faster completion
vim.opt.timeoutlen = 1000 -- timeout duration
vim.opt.ttimeoutlen = 0 -- key code timeout
vim.opt.redrawtime = 10000 -- increase neovim redraw tolerance
vim.opt.maxmempattern = 20000 -- increase max memory


-- ===========================================
-- Keymaps
-- ===========================================
vim.g.mapleader = " "  -- space for leader key
vim.g.maplocalleader = " "  -- space for local leader

-- save file
vim.keymap.set({ "n", "i", "x", "s" }, "<C-s>", "<esc>:w<cr>", { desc = "Save changes" } )

-- better change/delete
vim.keymap.set({ "n", "x" }, "<M-d>", '"_d', { desc = "Delete without yanking" } )
vim.keymap.set({ "n", "x" }, "<M-c>", '"_c', { desc = "Change without yanking" } )

-- buffers
vim.keymap.set("n", "<leader>{", "<cmd>bprevious<cr>", { desc = "Previous buffer"} )
vim.keymap.set("n", "<leader>}", "<cmd>bnext<cr>", { desc = "Next buffer"} )

-- tabs
vim.keymap.set("n", "<leader><tab>n", "<cmd>tabnew<cr>", {desc = "New tab"})
vim.keymap.set("n", "<leader><tab>d", "<cmd>tabclose<cr>", {desc = "Delete/Close tab"})
vim.keymap.set("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous tab" } )
vim.keymap.set("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next tab" } )

-- split/close window
vim.keymap.set("n", "<leader>sv", ":vsplit<cr>", { desc = "Split window vertically" })  -- or `<C-w>v`
vim.keymap.set("n", "<leader>hv", ":split<cr>", { desc = "Split window horizontally" }) -- or `<C-w>s`
vim.keymap.set("n", "<leader>wd", "<C-w>c", { desc = "Delete window" })

-- Move to window using <ctrl> hjkl
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" } )
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" } )
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" } )
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" } )

-- Resize window using <ctrl> arrow keys
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- Move lines
vim.keymap.set("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
vim.keymap.set("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
vim.keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
vim.keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
vim.keymap.set("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
vim.keymap.set("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

-- better indenting
vim.keymap.set("x", "<", "<gv", { desc = "Indent left" })
vim.keymap.set("x", ">", ">gv", { desc = "Indent right" })

-- better join lines
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines and keep cursor position" })

-- clear search
vim.keymap.set({ "n", "i", "s" }, "<esc>", function()
    vim.cmd("noh")
    return "<esc>"
  end, { expr = true, desc = "Escape and Clear hlsearch" }
)

-- quit
vim.keymap.set("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" } )

-- Restart editor
vim.keymap.set("n", "<leader><leader>r", ":restart<cr>", {desc = "Restart neovim" } )

-- Run lua scripts
vim.keymap.set("n", "<leader><leader>x", "<cmd>source %<cr>", { desc = "Run entire lua file" } )
vim.keymap.set("n", "<leader>x", ":.lua<cr>", { desc = "Run one lua line" })
vim.keymap.set("v", "<leader>x", ":lua<cr>", { desc = "Run one lua line" } )


-- ===========================================
-- Auto Commands
-- ===========================================

-- Highlight when yanking (copying) text
--   Try it with `yap` in normal mode
--   See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

