-- Helpers for `vim.pack` plugin manager
local M = {}

-- ===================================
-- Helper Functions
-- ===================================

-- Clean unused plugins
local function pack_clean()
  local active_plugins = {}
  local unused_plugins = {}

  for _, plugin in ipairs(vim.pack.get()) do
    active_plugins[plugin.spec.name] = plugin.active
  end

  for _, plugin in ipairs(vim.pack.get()) do
    if not active_plugins[plugin.spec.name] then
      table.insert(unused_plugins, plugin.spec.name)
    end
  end

  if #unused_plugins == 0 then
    print("No unused plugins.")
    return
  end

  local choice = vim.fn.confirm("Remove unused plugins? (default: Yes)", "&Yes\n&No", 1)
  if choice == 1 then
    vim.pack.del(unused_plugins)
  end
end


-- ===================================
-- Functions to Export
-- ===================================

-- get github repo: 'https://github.com/{repo_owner}/{repo_name}'
M.get_repo = function(repo_owner, repo_name)
  local github_url = vim.g.github_url or "https://github.com/"
  -- ensure end with '/'
  if github_url:sub(-1) ~= "/" then
    github_url = github_url .. "/"
  end
  return github_url .. repo_owner .. '/' .. repo_name
end


-- ===================================
-- Keymaps
-- ===================================

vim.keymap.set("n", "<leader>pu", "<cmd>lua vim.pack.update()<cr>", { desc = "Update Plugins" })
vim.keymap.set("n", "<leader>pc", pack_clean, { desc = "Clean unused plugins" })


return M
