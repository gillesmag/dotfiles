vim.cmd "packadd packer.nvim"

local plugins = {
  { "wbthomason/packer.nvim" },

  { "nvim-lua/plenary.nvim" },

  { "lewis6991/impatient.nvim" },
  { "nathom/filetype.nvim" },

  {
    "folke/lua-dev.nvim",
    module = "lua-dev"
  },

  {
    "nvim-treesitter/nvim-treesitter",
    module = "nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require("plugins.configs.treesitter")
    end,
  },

  {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup()
    end
  },

  -- Git
  {
    "tpope/vim-fugitive",
    setup = function()
      require("core.keymaps").fugitive()
    end
  },

  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end
  },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    module = "telescope",
    cmd = "Telescope",
    config = function()
      require("plugins.configs.telescope")
    end,
    setup = function()
      require("core.keymaps").telescope()
    end
  },

  { "nvim-telescope/telescope-file-browser.nvim" },

  -- LSP
  {
    "williamboman/mason.nvim",
    config = function()
      require("plugins.configs.mason")
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("plugins.configs.mason_lspconfig")
    end
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("plugins.configs.lspconfig")
    end
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    after = "nvim-lspconfig",
    config = function()
      require "plugins.configs.null-ls"
    end,
  },

  {
    "j-hui/fidget.nvim",
    config = function()
      require('fidget').setup()
    end
  },

  {
    "folke/neodev.nvim",
    config = function()
      require("neodev").setup()
    end
  },

  -- Completion
  {
    "hrsh7th/nvim-cmp",
    config = function()
      require("plugins.configs.cmp")
    end
  },
  { "hrsh7th/cmp-nvim-lsp" },
  { "L3MON4D3/LuaSnip" },
  { "saadparwaiz1/cmp_luasnip" },
  { "rafamadriz/friendly-snippets" },

  -- UI
  { "kyazdani42/nvim-web-devicons" },

  {
    "folke/tokyonight.nvim",
    config = function()
      vim.cmd "colorscheme tokyonight"
    end
  },

  -- Status line
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup {
        options = {
          theme = 'tokyonight',
          icons_enabled = true,
          section_separators = '',
          component_separators = '',
        }
      }
    end
  },

  -- Buffer line
  {
    "akinsho/bufferline.nvim",
    tag = "v2.*",
    config = function()
      require("bufferline").setup {
        options = {
          mode = "tabs",
        }
      }
    end,
  },

  -- File explorer
  {
    "nvim-tree/nvim-tree.lua",
    requires = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup({
        filters = {
          dotfiles = false
        },
      })
    end
  },

  { "tpope/vim-surround" }, -- Delete, change and add surrounding pairs (paranetheses, brackets, etc.)
  { "tpope/vim-sleuth" }, -- Detect tabstop and shiftwidth automatically

  {
    "numToStr/Comment.nvim",
    module = "Comment",
    keys = { "gcc" },
    setup = function()
      require('Comment').setup()
    end,
    config = function()
       require("core.keymaps").comment()
    end,
  },

  {
    "ethanholz/nvim-lastplace",
    config = function()
      require('nvim-lastplace').setup {}
    end,
  },

  -- HCL
  { "jvirtanen/vim-hcl" },

  -- Jsonnet
  { "google/vim-jsonnet" },

  { "github/copilot.vim" },
}

require("core.packer").run(plugins)
