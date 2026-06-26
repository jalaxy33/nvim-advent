-- ===========================================
-- Auto Commands
-- ===========================================

local augroup = vim.api.nvim_create_augroup("UserConfig", { clear = true })


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
vim.api.nvim_create_autocmd("BufReadPost",{
  desc = "Restore last cursor position",
  group = augroup,
  callback = function()
    -- except in diff mode
    if vim.o.diff then 
      return 
    end

    local last_pos = vim.api.nvim_buf_get_mark(0, '"')  -- {line, col}
    local last_line = vim.api.nvim_buf_line_count(0)

    local row = last_pos[1]
    if row < 1 or row > last_line then
      return
    end

    pcall(vim.api.nvim_win_set_cursor, 0, last_pos)
  end,
})




