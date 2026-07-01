-- core/options.lua
--
-- Options & Custom Global variables
--

-- ===================================
-- Options
-- ===================================

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.scrolloff = 8      -- keep % lines above/below cursor
vim.opt.sidescrolloff = 8  -- keep % lines left/right of cursor
vim.opt.showmatch = true   -- hightlights matching brackets
vim.opt.signcolumn = "yes" -- show diagnostic on the left of linenumber


vim.opt_global.mouse = "a"              -- enable mouse support
vim.opt.clipboard:append("unnamedplus") -- use system clipboard

vim.opt.tabstop = 2                     -- tabwidth
vim.opt.shiftwidth = 2                  -- indent width
vim.opt.softtabstop = 2
vim.opt.expandtab = true                -- use spaces instead of tabs
vim.opt.smarttab = true
vim.opt.smartindent = true              -- smart auto indent
vim.opt.autoindent = true

vim.opt.ignorecase = true     -- case insensitive search
vim.opt.smartcase = true      -- case sensitive if uppercase in string
vim.opt.hlsearch = true       -- highlight search matches
vim.opt.incsearch = true      -- show matches as you type
vim.opt.isfname:append("@-@") -- allows @ in filename

vim.opt.pumheight = 8         -- popup menu height
vim.opt.pumblend = 10         -- popup menu transparent
vim.opt.pumborder = 'rounded' -- set popup menu border style
vim.opt.winblend = 5          -- floating window transparency
vim.opt.synmaxcol = 400       -- syntax highlightlighting limit
vim.opt.laststatus = 3        -- allow full statusline

vim.opt.cmdheight = 0         -- command line height. 0 means only show command line when necessary
vim.opt.shortmess:append("c") -- keep command line clean by hiding completion messages

vim.opt.backup = false        -- do not create a backup file
vim.opt.writebackup = false   -- do not write to a backup file
vim.opt.swapfile = false      -- do not create a swapfile
vim.opt.undodir = vim.fn.stdpath("data") .. "/undodir"
vim.opt.undofile = true       -- do create a undo file
vim.opt.autoread = true       -- auto-reload changes if outside of neovim
vim.opt.autowrite = false     -- do not auto-save

vim.opt.updatetime = 300      -- faster completion
vim.opt.timeoutlen = 1000     -- timeout duration
vim.opt.ttimeoutlen = 0       -- key code timeout
vim.opt.redrawtime = 10000    -- increase neovim redraw tolerance
vim.opt.maxmempattern = 20000 -- increase max memory

vim.opt.splitbelow = true     -- :vsplit new window to below
--vim.opt.splitright = true  -- :split new window to right

vim.opt.autocomplete = true                           -- enable built-in autocomplete (v0.12), press <C-e> to exit.
vim.opt.complete:append('o')                          -- integrate completion with LSP
vim.opt.completeopt = "menuone,fuzzy,noselect,nosort" -- completion behaviors


-- ===================================
-- Custom Global Varables
-- ===================================

vim.g.format_on_save = false
