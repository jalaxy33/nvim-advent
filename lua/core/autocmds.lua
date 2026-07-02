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


-- Auto-trigger LSP completion & Conditional format-on-write
vim.api.nvim_create_autocmd('LspAttach', {
  group = augroup,
  callback = function(ev)
    local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
    if not client then return end -- early return when no client exist

    -- if client:supports_method('textDocument/implementation') then
    --   -- Create a keymap for vim.lsp.buf.implementation ...
    -- end

    -- Enable auto-completion. Note: Use CTRL-Y to select an item. |complete_CTRL-Y|
    if vim.g.native_autocomplete -- only set this when using native autocomplete
        and client:supports_method('textDocument/completion') then
      -- Optional: trigger autocompletion on EVERY keypress. May be slow!
      -- local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
      -- client.server_capabilities.completionProvider.triggerCharacters = chars
      if vim.fn.exists('&autocomplete') ~= 1 then return end -- skip if option is unavailable
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end


    -- Auto-format ("lint") on save.
    -- Usually not needed if server supports "textDocument/willSaveWaitUntil".
    -- Set auto-format with `format_on_save` global var
    if vim.g.format_on_save
        and not client:supports_method('textDocument/willSaveWaitUntil')
        and client:supports_method('textDocument/formatting') then
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = augroup,
        buffer = ev.buf,
        callback = function()
          vim.lsp.buf.format({ bufnr = ev.buf, id = client.id, timeout_ms = 1000 })
        end,
      })
    end
  end,
})
