-- core/keymaps.lua
--
-- General keymap settings
--

vim.g.mapleader = " "      -- space for leader key
vim.g.maplocalleader = " " -- space for local leader


-- ===================================
-- Editor
-- ===================================

-- save file
vim.keymap.set({ "n", "i", "x", "s" }, "<C-s>", "<esc>:w<cr>", { desc = "Save changes" })

-- select all
vim.keymap.set("n", "<C-a>", "<cmd>normal ggVG<cr>", { desc = "Select all" })

-- quit
vim.keymap.set("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })

-- Restart editor
vim.keymap.set("n", "<leader>re", ":restart<cr>", { desc = "Restart neovim" })

-- clear search
vim.keymap.set({ "n", "i", "s" }, "<esc>", function()
  vim.cmd("noh")
  return "<esc>"
end, { expr = true, desc = "Escape and Clear hlsearch" }
)

-- native undotree
vim.keymap.set("n", "<leader>u", function()
  vim.cmd.packadd("nvim.undotree")
  require("undotree").open()
end, { desc = "Toggle Builtin Undotree" })



-- ===================================
-- Window, Buffer & Tab
-- ===================================

-- buffers
vim.keymap.set('n', "bn", "<cmd>enew<cr>", { desc = "New Buffer" })
vim.keymap.set('n', "bx", "<cmd>bdelete<cr>", { desc = "Close Buffer" })
vim.keymap.set("n", "b[", "<cmd>bprevious<cr>", { desc = "Previous Buffer" })
vim.keymap.set("n", "b]", "<cmd>bnext<cr>", { desc = "Next Buffer" })
vim.keymap.set("n", "bs", "<cmd>buffers<cr>", { desc = "Show all buffers" })

-- tabs
vim.keymap.set("n", "tn", "<cmd>tabnew<cr>", { desc = "New tab" })
vim.keymap.set("n", "tx", "<cmd>tabclose<cr>", { desc = "Close Current tab" })
vim.keymap.set("n", "to", "<cmd>tabonly<cr>", { desc = "Close Other tabs" })
vim.keymap.set("n", "t[", "<cmd>tabprevious<cr>", { desc = "Previous tab" })
vim.keymap.set("n", "t]", "<cmd>tabnext<cr>", { desc = "Next tab" })
vim.keymap.set("n", "ts", "<cmd>tabs<cr>", { desc = "Show All Tabs" })

-- split/close window
vim.keymap.set("n", "<leader>sv", ":vsplit<cr>", { desc = "Split window Vertically" })  -- or `<C-w>v`
vim.keymap.set("n", "<leader>sh", ":split<cr>", { desc = "Split window Horizontally" }) -- or `<C-w>s`
vim.keymap.set("n", "<leader>wd", "<C-w>c", { desc = "Delete window" })

-- Move to window using <ctrl> hjkl
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Resize window using <ctrl> arrow keys
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })


-- default window keymaps (check :h windows)
--
-- all start with `<C-w>`
--
-- [1] Create window
-- vim.keymap.set("n", "<C-w>s", "<cmd>split<cr>", { desc = "Split window Horizontally" })
-- vim.keymap.set("n", "<C-w>v", "<cmd>vsplit<cr>", { desc = "Split window Vertically" })
-- vim.keymap.set("n", "<C-w>n", "<cmd>new<cr>", { desc = "Create new window" })
--
--   Split window use identifier under cursor:    <C-w>]
--
-- [2] Close window
-- vim.keymap.set("n", "<C-w>q", "<cmd>q<cr>", { desc = "Quit Current window" })
--
-- [3] Move cursor to window
--  Move Left:  <C-w>h or <C-w><left>
--  Move down:  <C-w>j or <C-w><down>
--  Move up:    <C-w>k or <C-w><up>
--  Move right: <C-w>l or <C-w><right>
--
-- [4] Move window around
--  Move downwards/rightwards:  <C-w>r
--  Move upwards/leftwards:     <C-w>R
--  Exchange with next:         <C-w>x
--  Move to a new tabpage:      <C-w>t    -- fails if only one window in current tabpage
--  Move to very left:      <C-w>h
--  Move to very bottom:    <C-w>j
--  Move to very top:       <C-w>k
--  Move to very right:     <C-w>l


-- ===================================
-- Editting Behaviors
-- ===================================

-- better change/delete
vim.keymap.set({ "n", "x" }, "<A-d>", '"_d', { desc = "Delete without yanking" })
vim.keymap.set({ "n", "x" }, "<A-c>", '"_c', { desc = "Change without yanking" })
vim.keymap.set("x", "<A-p>", '"_p', { desc = "Paste without yanking" })

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

-- commenting
vim.keymap.set({ "n", "i" }, "<C-/>", "<cmd>normal gcc<cr>", { remap = true, desc = "Toggle Comment" })
vim.keymap.set("x", "<C-/>", "gc<Esc>gv", { remap = true, desc = "Toggle comment and reselect" })

-- better move up/down
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Move Down in buffer with cursor centered" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Move Up in buffer with cursor centered" })

-- better search move
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result cursor center" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result cursor center" })

-- Quick replacement
vim.keymap.set("n", "<leader>S", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "Replace word under cursor" })


-- ===================================
-- terminal mode
-- ===================================

-- Exit terminal mode
vim.keymap.set('t', "<esc><esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })


-- ===================================
-- LSP
-- ===================================

-- LSP
vim.keymap.set("i", "<C-h>", vim.lsp.omnifunc, { desc = "Trigger completetion Hint" })            -- or `<C-x><C-o>`
vim.keymap.set({ "n", "i" }, "<F2>", vim.lsp.buf.rename, { desc = "Rename Symbol under cursor" }) -- or `grn`
vim.keymap.set('i', "<A-s>", vim.lsp.buf.signature_help, { desc = "Signature help" })             -- default <C-s>
vim.keymap.set('n', "gd", vim.lsp.buf.definition, { desc = "Go to definition" })

-- Formatting
vim.keymap.set({ "n", "i", "x" }, "<A-F>", function()
  vim.lsp.buf.format({ async = true })
  -- notify formatting message
  local filepath = vim.fn.expand("%")
  vim.notify(filepath .. " formatted (or failed).")
end, { desc = "Format buffer" })

-- diagnostic
local Diagnostic = vim.diagnostic

vim.keymap.set('n', "<leader>df", Diagnostic.open_float, { desc = "Show line diagnostics" })
vim.keymap.set("n", "<leader>dt", function() Diagnostic.enable(not Diagnostic.is_enabled()) end,
  { desc = "Toggle diagnostics" })


-- default lsp keymaps (check `:help vim.lsp`)
--
-- vim.keymap.set('n', "gri", vim.lsp.buf.implementation, { desc = "Go to Implementation" })
-- vim.keymap.set('n', "grt", vim.lsp.buf.type_definition, { desc = "Go to Type Definition" })
-- vim.keymap.set('n', "grr", vim.lsp.buf.references, { desc = "Find References" })
-- vim.keymap.set('n', "grn", vim.lsp.buf.rename, { desc = "Rename" })
-- vim.keymap.set({ 'n', 'x' }, "gra", vim.lsp.buf.code_action, { desc = "Code Action" })
-- vim.keymap.set('n', "grx", vim.lsp.codelens.run, { desc = "Run CodeLens" })
-- vim.keymap.set('n', "gO", vim.lsp.buf.document_symbol, { desc = "Document Symbols" })
-- vim.keymap.set('i', "<C-s>", vim.lsp.buf.signature_help, { desc = "Signature help" })
-- vim.keymap.set('n', "K", vim.lsp.buf.hover, vim.tbl_extend("force", { desc = "Show Documentation" }))
