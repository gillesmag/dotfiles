local map = vim.api.nvim_set_keymap

local M = {}

M.options = {
	mapleader = " "
}

M.general = function()
  -- Write, write & quit and quit
  map("n", "<leader>w", ":w<CR>", {})
  map("n", "<leader>wq", ":wq<CR>", {})
  map("n", "<leader>q", ":q<CR>", {})

  -- Unhighlight searched term
  map("v", "<C-h>", ":nohlsearch<CR>", {})
  map("n", "<C-h>", ":nohlsearch<CR>", {})

  -- Switch between windows
  map("n", "<leader><tab>", "<C-w>w", {})
end

M.nvimtree = function()
  map("n", "<C-n>", ":NvimTreeToggle <CR>", {})
  map("n", "<leader>e", ":NvimTreeFocus <CR>", {})
end

M.telescope = function()
  map("n", "<leader>fb", ":Telescope buffers <CR>", {})
  map("n", "<leader>ff", ":Telescope find_files <CR>", {})
  map("n", "<leader>gs", ":Telescope git_status <CR>", {})
  map("n", "<leader>fw", ":Telescope live_grep <CR>", {})
end

M.setup = function()
  M.general()
	M.nvimtree()
end

return M
