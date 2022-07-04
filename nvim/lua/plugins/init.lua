vim.cmd "packadd packer.nvim"

local plugins = {
  { "nvim-lua/plenary.nvim" },
  { "wbthomason/packer.nvim" },

  { "lewis6991/impatient.nvim" },
  { "nathom/filetype.nvim" },

  { "neovim/nvim-lspconfig" },

  {
    "folke/lua-dev.nvim",
    module = "lua-dev"
  },

  {
    "williamboman/nvim-lsp-installer",
    requires = {
      "neovim/nvim-lspconfig",
      "folke/lua-dev.nvim",
    },
    config = require("plugins.configs.lsp-installer")
  },

  {
    "nvim-treesitter/nvim-treesitter",
    config = require("plugins.configs.treesitter"),
  },

  -- Git
  {
    "lewis6991/gitsigns.nvim",
    requires = {
      "nvim-lua/plenary.nvim"
    },
    config = function()
      require("gitsigns").setup()
    end
  },

  -- File explorer(s)
  {
    "kyazdani42/nvim-tree.lua",
    requires = {
      "kyazdani42/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup()
    end
  },

  {
    "nvim-telescope/telescope.nvim",
    module = "telescope",
    cmd = "Telescope",
    --config = function() require("plugins.configs.telescope").setup() end,
    setup = function()
      require("core.mappings").telescope()
    end
  },

  -- UI
  -- Theme
  {
    "folke/tokyonight.nvim",
    --event = "VimEnter",
    config = function()
      vim.cmd "colorscheme tokyonight"
    end
  },

  {
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
    config = function()
      require("lualine").setup {
        options = {
          theme = 'tokyonight',
          icons_enabled = true,
          section_separators = '', component_separators = ''
        }
      }
    end
  },

  { "tpope/vim-repeat" },
  { "tpope/vim-surround" },

  {
    "folke/twilight.nvim",
    config = function() require("twilight").setup {} end,
  },

  {
    "numToStr/Comment.nvim",
    module = "Comment",
    keys = { "gcc" },
    setup = function()
      require('Comment').setup()
    end,
    config = function()
       require("core.mappings").comment()
    end,
  },
}

require("core.packer").run(plugins)
