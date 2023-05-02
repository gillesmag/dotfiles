local modemap = function(keymap, bufnr)
  for mode, bindings in pairs(keymap) do
    for lhs, rhs in pairs(bindings) do
      vim.keymap.set(mode, lhs, rhs, { buffer = bufnr })
    end
  end
end

local M = {}

M.general = function()
  modemap {
    i = {
      -- Fast escape
      ["jk"] = "<ESC>",
    },
    n = {
      -- Write, write & quit and quit
      ["<leader>w"] = ":w<CR>",
      ["<leader>wq"] = ":wq<CR>",
      ["<leader>q"] = ":q<CR>",

      -- Move windows around
      ["<tab>"] = "<C-w>w",
      ["<leader>h"] = "<C-w>h",
      ["<leader>l"] = "<C-w>l",
      ["<leader>j"] = "<C-w>j",
      ["<leader>k"] = "<C-w>k",

      -- Resize with arrows
      ["<C-k>"] = ":resize -2<CR>",
      ["<C-j>"] = ":resize +2<CR>",
      ["<C-h>"] = ":vertical resize -2<CR>",
      ["<C-l>"] = ":vertical resize +2<CR>",

      -- Split windows
      ["<leader>\\"] = ":vsplit<CR>",
      ["<leader>-"] = ":split<CR>",

      -- Buffers
      ["<leader>bn"] = ":enew<CR>",
      ["<leader>bd"] = ":bd<CR>",

      -- Open file under word in respective application
      ["gx"] = "<cmd>silent execute '!open ' . shellescape('<cWORD>')<CR>",
    },
    v = {
      ["<"] = "<gv",
      [">"] = ">gv",
    },
  }
end

M.nvimtree = function()
  modemap {
    n = {
      ["<C-n>"] = ":NvimTreeToggle <CR>",
      ["<leader>e"] = ":NvimTreeFocus <CR>",
    },
  }
end

M.lspconfig = function(bufnr)
  modemap({
    n = {
      ["<leader>D"] = vim.lsp.buf.type_definition,
      ["<leader>K"] = vim.lsp.buf.hover,
      ["<leader>[d"] = vim.diagnostic.goto_prev,
      ["<leader>ca"] = vim.lsp.buf.code_action,
      ["<leader>d]"] = vim.diagnostic.goto_next,
      ["<leader>f"] = vim.diagnostic.open_float,
      ["<leader>fm"] = vim.lsp.buf.formatting,
      ["<leader>gD"] = vim.lsp.buf.declaration,
      ["<leader>gd"] = vim.lsp.buf.definition,
      ["<leader>gi"] = vim.lsp.buf.implementation,
      ["<leader>gr"] = require("telescope.builtin").lsp_references,
      ["<leader>ls"] = vim.lsp.buf.signature_help,
      ["<leader>r"] = vim.lsp.buf.rename,
      ["<leader>wa"] = vim.lsp.buf.add_workspace_folder,
      ["<leader>wr"] = vim.lsp.buf.remove_workspace_folder,
    },
  }, bufnr)
end

M.telescope = function()
  local t = require "telescope.builtin"
  modemap {
    n = {
      ["<leader><leader>"] = t.buffers,
      ["<leader>fb"] = t.file_browser,
      ["<leader>ff"] = t.find_files,
      ["<leader>fg"] = t.live_grep,
      ["<leader>fh"] = t.help_tags,
      ["<leader>fo"] = t.oldfiles,
      ["<leader>gs"] = t.git_status,
    },
  }
end

M.comment = function()
  modemap {
    n = { ["<leader>/"] = ":lua require('Comment.api').toggle.linewise.current()<CR>" },
    v = { ["<leader>/"] = ":lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>" },
  }
end

M.cmp = function(cmp)
  return {
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-o>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<C-Space>"] = cmp.mapping.confirm { select = true },
  }
end

M.fugitive = function()
  modemap {
    n = {
      ["<leader>gb"] = ":Git blame<CR>",
      ["<leader>gl"] = ":Git log<CR>",
    },
  }
end

M.setup = function()
  M.general()
  M.nvimtree()
end

return M
