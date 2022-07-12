local map = function(mode, lhs, rhs)
  local opts = { noremap = true, silent = true }
  vim.keymap.set(mode, lhs, rhs, opts)
end

local M = {}

M.options = {
  mapleader = " "
}

M.general = function()
  -- Write, write & quit and quit
  map("n", "<leader>w", ":w<CR>")
  map("n", "<leader>wq", ":wq<CR>")
  map("n", "<leader>q", ":bdelete<CR>")
  map("n", "<leader>x", ":q<CR>")


  -- Unhighlight searched term
  map("v", "<C-h>", ":nohlsearch<CR>")
  map("n", "<C-h>", ":nohlsearch<CR>")

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

  map("i", "jk", "<ESC>")

  -- Move windows around
  map("n", "<leader>wH", "<C-w>H")
  map("n", "<leader>wL", "<C-w>L")
  map("n", "<leader>wJ", "<C-w>J")
  map("n", "<leader>wK", "<C-w>K")

  -- Split windows
  map("n", "<leader>w|", ":vsplit<CR>")
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
  local lspconfig = {
    ["gD"] = { function() vim.lsp.buf.declaration() end },
    ["gd"] = { function() vim.lsp.buf.definition() end },
    ["K"] = { function() vim.lsp.buf.hover() end },
    ["gi"] = { function() vim.lsp.buf.implementation() end },
    ["ls"] = { function() vim.lsp.buf.signature_help() end },
    ["D"] = { function() vim.lsp.buf.type_definition() end },
    ["r"] = { function() vim.lsp.buf.rename() end },
    ["ca"] = { function() vim.lsp.buf.code_action() end },
    ["gr"] = { function() vim.lsp.buf.references() end },
    ["f"] = { function() vim.diagnostic.open_float() end },
    ["[d"] = { function() vim.diagnostic.goto_prev() end },
    ["d]"] = { function() vim.diagnostic.goto_next() end },
    ["fm"] = { function() vim.lsp.buf.formatting() end },
    ["wa"] = { function() vim.lsp.buf.add_workspace_folder() end },
    ["wr"] = { function() vim.lsp.buf.remove_workspace_folder() end },
    ["wl"] = { function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end },
  }

  for k, v in pairs(lspconfig) do
    map("n", "<leader>" .. k, v[1])
  end
end

M.telescope = function()
  map("n", "<leader>bb", ":Telescope buffers <CR>")
  map("n", "<leader>gs", ":Telescope git_status <CR>")
  map("n", "<leader>fw", ":Telescope live_grep <CR>")

  -- files
  map("n", "<leader>ff", ":Telescope find_files <CR>")
  map("n", "<leader>fr", ":Telescope oldfiles <CR>")

  map("n", "<leader>fp", ":Telescope projects <CR>")
  map("n", "<leader>fb", ":Telescope file_browser<CR>")
  map("n", "<leader>fh", ":Telescope help_tags<CR>")

  map("n", "<C-p>", ":lua require('telescope').extensions.project.project{}<CR>")
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
