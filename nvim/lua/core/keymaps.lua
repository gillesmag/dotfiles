local map = function(mode, lhs, rhs)
  vim.keymap.set(mode, lhs, rhs, {})
end

local M = {}

M.general = function()
  -- Fast escape
  map("i", "jk", "<ESC>")

  -- Write, write & quit and quit
  map("n", "<leader>w", ":w<CR>")
  map("n", "<leader>wq", ":wq<CR>")
  map("n", "<leader>q", ":q<CR>")

  -- Unhighlight searched term
  map("v", "<leader>h", ":nohlsearch<CR>")
  map("n", "<leader>h", ":nohlsearch<CR>")

  -- Switch between windows
  map("n", "<leader><tab>", "<C-w>w")
  map("n", "<leader>wh", "<C-w>h")
  map("n", "<leader>wl", "<C-w>l")
  map("n", "<leader>wj", "<C-w>j")
  map("n", "<leader>wk", "<C-w>k")

  -- Resize with arrows
  -- map("n", "<C-Up>", ":resize -2<CR>")
  -- map("n", "<C-Down>", ":resize +2<CR>")
  -- map("n", "<C-Left>", ":vertical resize -2<CR>")
  -- map("n", "<C-Right>", ":vertical resize +2<CR>")

  -- Move windows around
  map("n", "<leader>wH", "<C-w>H")
  map("n", "<leader>wL", "<C-w>L")
  map("n", "<leader>wJ", "<C-w>J")
  map("n", "<leader>wK", "<C-w>K")

  -- Split windows
  map("n", "<leader>w\\", ":vsplit<CR>")
  map("n", "<leader>w-", ":split<CR>")

  -- Buffers
  map("n", "<leader>bn", ":enew<CR>")
  map("n", "<leader>bd", ":bd<CR>")

  -- Split vertically and horizontally
  map("n", "<leader>b|", ":vsplit<CR>")
  map("n", "<leader>b-", ":split<CR>")

  -- Open file under word in respective application
  map("n", "gx", "<cmd>silent execute '!open ' . shellescape('<cWORD>')<CR>")

  map("v", "<", "<gv")
  map("v", ">", ">gv")
end

M.nvimtree = function()
  map("n", "<C-n>", ":NvimTreeToggle <CR>")
  map("n", "<leader>e", ":NvimTreeFocus <CR>")
end

M.lspconfig = function()
  local keymap = {
    ["D"] = vim.lsp.buf.type_definition,
    ["K"] = vim.lsp.buf.hover,
    ["[d"] = vim.diagnostic.goto_prev,
    ["ca"] = vim.lsp.buf.code_action,
    ["d]"] = vim.diagnostic.goto_next,
    ["f"] = vim.diagnostic.open_float,
    ["fm"] = vim.lsp.buf.formatting,
    ["gD"] = vim.lsp.buf.declaration,
    ["gd"] = vim.lsp.buf.definition,
    ["gi"] = vim.lsp.buf.implementation,
    ["gr"] = require('telescope.builtin').lsp_references,
    ["ls"] = vim.lsp.buf.signature_help,
    ["r"] = vim.lsp.buf.rename,
    ["wa"] = vim.lsp.buf.add_workspace_folder,
    -- ["wl"] = function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
    ["wr"] = vim.lsp.buf.remove_workspace_folder,
  }

  for k, v in pairs(keymap) do
    map("n", "<leader>" .. k, v)
  end
end

M.telescope = function()
  local builtin = require("telescope.builtin")
  local keymap = {
    ["<leader>"] = builtin.buffers,
    ["fb"] = builtin.file_browser,
    ["ff"] = builtin.find_files,
    ["fg"] = builtin.live_grep,
    ["fh"] = builtin.help_tags,
    ["fo"] = builtin.oldfiles,
    ["gs"] = builtin.git_status,
  }

  for k, v in pairs(keymap) do
    map("n", "<leader>" .. k, v)
  end
end

M.comment = function()
  local m = "<leader>/"
  map("n", m, ":lua require('Comment.api').toggle.linewise.current()<CR>")
  map("v", m, ":lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>")
end

M.packer = function()
  map("n", "<leader>ps", ":PackerSync<CR>")
  map("n", "<leader>pc", ":PackerCompile<CR>")
end

M.cmp = function(cmp)
  return {
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-o>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<C-Space>"] = cmp.mapping.confirm({ select = true }),
  }
end

M.setup = function()
  M.general()
  M.nvimtree()
  M.packer()
end

return M
