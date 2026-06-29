-- core/autocmds.lua
--
-- You could change editor behavior by creating auto commands.
--

-- Define autocmd group
local augroup = vim.api.nvim_create_augroup("UserConfig", { clear = true })


-- ===================================
-- Define autocmds
-- ===================================


-- Highlight when yanking (copying) text
--   Try it with `yap` in normal mode
--   See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = augroup,
  callback = function()
    vim.highlight.on_yank()
  end,
})


-- Return to last cursor position
vim.api.nvim_create_autocmd("BufReadPost", {
  desc = "Restore last cursor position",
  group = augroup,
  callback = function()
    -- except in diff mode
    if vim.o.diff then
      return
    end

    local last_pos = vim.api.nvim_buf_get_mark(0, '"') -- {line, col}
    local last_line = vim.api.nvim_buf_line_count(0)

    local row = last_pos[1]
    if row < 1 or row > last_line then
      return
    end

    pcall(vim.api.nvim_win_set_cursor, 0, last_pos)
  end,
})


-- Auto-trigger LSP completion
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('my.lsp', {}),
  callback = function(ev)
    local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))

    -- if client:supports_method('textDocument/implementation') then
    --   -- Create a keymap for vim.lsp.buf.implementation ...
    -- end

    -- Enable auto-completion. Note: Use CTRL-Y to select an item. |complete_CTRL-Y|
    if client:supports_method('textDocument/completion') then
      -- Optional: trigger autocompletion on EVERY keypress. May be slow!
      -- local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
      -- client.server_capabilities.completionProvider.triggerCharacters = chars

      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end
  end,
})
