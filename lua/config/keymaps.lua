-- ===================================
-- General keymap settings
-- ===================================

vim.g.mapleader = " "  -- space for leader key
vim.g.maplocalleader = "\\"  -- space for local leader

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
vim.keymap.set("n", "<leader>sv", ":vsplit<cr>", { desc = "Split window Vertically" })  -- or `<C-w>v`
vim.keymap.set("n", "<leader>sh", ":split<cr>", { desc = "Split window Horizontally" }) -- or `<C-w>s`
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
vim.keymap.set("x", "<", "<gv", { desc = "Indent left and Reselect" })
vim.keymap.set("x", ">", ">gv", { desc = "Indent right and Reselect" })

-- better join lines
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines and keep cursor position" })

-- clear search
vim.keymap.set({ "n", "i", "s" }, "<esc>", function()
    vim.cmd("noh")
    return "<esc>"
  end, { expr = true, desc = "Escape and Clear hlsearch" }
)

-- commenting
vim.keymap.set({ "n", "i" }, "<C-/>", "<cmd>normal gcc<cr>", { remap = true, desc = "Toggle Comment" } )
vim.keymap.set("x", "<C-/>", "gc<Esc>gv", { remap = true, desc = "Toggle comment and reselect" })

-- quit
vim.keymap.set("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" } )

-- select all
vim.keymap.set("n", "<C-a>", "<cmd>normal ggVG<cr>", { desc = "Select all" })

-- Restart editor
vim.keymap.set("n", "<leader>R", ":restart<cr>", {desc = "Restart neovim" } )

