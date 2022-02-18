local map = function(mode, lhs, rhs)
  local opts = { noremap = true, silent = true }
  vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end

local M = {}

M.options = {
  mapleader = " "
}

M.general = function()
  -- Write, write & quit and quit
  map("n", "<leader>w", ":w<CR>")
  map("n", "<leader>wq", ":wq<CR>")
  map("n", "<leader>q", ":q<CR>")

  -- Unhighlight searched term
  map("v", "<C-h>", ":nohlsearch<CR>")
  map("n", "<C-h>", ":nohlsearch<CR>")

  -- Switch between windows
  map("n", "<leader><tab>", "<C-w>w")
  map("n", "<leader>wh", "<C-w>h")
  map("n", "<leader>wl", "<C-w>l")
  map("n", "<leader>wj", "<C-w>j")
  map("n", "<leader>wk", "<C-w>k")

  -- Move windows around
  map("n", "<leader>wH", "<C-w>H")
  map("n", "<leader>wL", "<C-w>L")
  map("n", "<leader>wJ", "<C-w>J")
  map("n", "<leader>wK", "<C-w>K")

  -- Buffers
  map("n", "<leader>bn", ":enew<CR>")
  map("n", "<leader>bd", ":bd<CR>")

  -- Split vertically and horizontally
  map("n", "<leader>b|", ":vsplit<CR>")
  map("n", "<leader>b-", ":split<CR>")
end

M.nvimtree = function()
  map("n", "<C-n>", ":NvimTreeToggle <CR>")
  map("n", "<leader>e", ":NvimTreeFocus <CR>")
end

M.lspconfig = function()
  local prefix = "<leader>c"
  map('n', prefix .. 'D', '<cmd>lua vim.lsp.buf.declaration()<CR>')
  map('n', prefix .. 'd', '<cmd>lua vim.lsp.buf.definition()<CR>')
  map('n', prefix .. 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
  map('n', prefix .. 'i', '<cmd>lua vim.lsp.buf.implementation()<CR>')
  map('n', prefix .. '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
  map('n', prefix .. 'wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>')
  map('n', prefix .. 'wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>')
  map('n', prefix .. 'wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>')
  map('n', prefix .. 't', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
  map('n', prefix .. 'r', '<cmd>lua vim.lsp.buf.rename()<CR>')
  map('n', prefix .. 'a', '<cmd>lua vim.lsp.buf.code_action()<CR>')
  map('n', prefix .. 'R', '<cmd>lua vim.lsp.buf.references()<CR>')
  map('n', prefix .. 'f', '<cmd>lua vim.lsp.buf.formatting()<CR>')
end

M.telescope = function()
  map("n", "<leader>bb", ":Telescope buffers <CR>")
  map("n", "<leader>gs", ":Telescope git_status <CR>")
  map("n", "<leader>fw", ":Telescope live_grep <CR>")

  -- files
  map("n", "<leader>ff", ":Telescope find_files <CR>")
  map("n", "<leader>fr", ":Telescope oldfiles <CR>")
end

M.comment = function()
  local m = "<leader>/"
  map("n", m, ":lua require('Comment.api').toggle_current_linewise()<CR>")
  map("v", m, ":lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<CR>")
end

M.packer = function()
  map("n", "<leader>ps", ":PackerSync<CR>")
  map("n", "<leader>pc", ":PackerCompile<CR>")
end

M.setup = function()
  M.general()
  M.nvimtree()
  M.packer()
end

return M
