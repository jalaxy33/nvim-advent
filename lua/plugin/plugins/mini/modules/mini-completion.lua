-- `mini.completion`  |  Completion and signature help
--
--  https://github.com/nvim-mini/mini.nvim/blob/main/readmes/mini-completion.md
--

-- early return when disabled
if vim.g.native_autocomplete then return end

--- Initialization ---

local mini_completion = require("mini.completion")

-- Snippet menu label: snippets without tabstops insert fixed text, so show
-- that text instead of the opaque prefix. `mini.snippets` sends the prefix as
-- label and the body as detail; `filterText` keeps the prefix because that is
-- what gets typed and what the popup filters by.
-- Results are cached: bodies are stable, and this runs on every completion.
local snippet_client, body_label = {}, {}

local function is_snippet_client(client_id)
  if client_id == nil then return false end
  local res = snippet_client[client_id]
  if res == nil then
    local client = vim.lsp.get_client_by_id(client_id)
    res = client ~= nil and client.name == 'mini.snippets'
    snippet_client[client_id] = res
  end
  return res
end

local function display_label(body)
  local label = body_label[body]
  if label == nil then
    local text = body:gsub('%$0', '')
    if text:find('$', 1, true) then
      label = false
    else
      label = text:gsub('%s+', ' ')
    end
    body_label[body] = label
  end
  return label
end

local function process_items(items, base)
  local res = mini_completion.default_process_items(items, base)

  -- `mini.snippets` offers every snippet of the language, so short prefixes win
  -- the fuzzy sort against the LSP items. Put them below the LSP items, keeping
  -- the order inside each group. Other snippet sources (emmet) stay untouched.
  local lsp_items, snippet_items = {}, {}
  for _, item in ipairs(res) do
    if is_snippet_client(item.client_id) then
      if item.detail then
        local label = display_label(item.detail)
        if label then
          item.filterText = item.filterText or item.label
          item.label = label
        end
      end
      table.insert(snippet_items, item)
    else
      table.insert(lsp_items, item)
    end
  end

  return vim.list_extend(lsp_items, snippet_items)
end

mini_completion.setup({
  lsp_completion = { process_items = process_items },
})

-- set completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend("force", capabilities,
  mini_completion.get_lsp_capabilities()
)
vim.lsp.config('*', { capabilities = capabilities })

--- Filepath completion ---

-- In-process LSP server feeding file paths into the LSP stage. Only used with
-- `mini.completion`: native `vim.lsp.completion` has its own setup.
vim.lsp.config("filepaths_ls", {
  settings = {
    insert_dir_trailing_slash = true, -- keep `/` so the next level starts right away
    sort = "dir_first",
    max_items = 200,                  -- `pumheight` is 8, 1000 items is waste
  },
})
vim.lsp.enable("filepaths_ls")
