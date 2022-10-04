vim.cmd "packadd packer.nvim"

local plugins = {
  { "nvim-lua/plenary.nvim" },
  { "wbthomason/packer.nvim" },

  { "lewis6991/impatient.nvim" },
  { "nathom/filetype.nvim" },

  {
    "folke/lua-dev.nvim",
    module = "lua-dev"
  },

  {
    "nvim-treesitter/nvim-treesitter",
    module = "nvim-treesitter",
    setup = function()
      require("core.lazy_load").on_file_open "nvim-treesitter"
    end,
    cmd = require("core.lazy_load").treesitter_cmds,
    run = ":TSUpdate",
    config = function()
      require("plugins.configs.treesitter")
    end,
  },

  -- Git
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end
  },

  -- Telescope
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup()
    end,
  },

  { "nvim-telescope/telescope-file-browser.nvim" },
  { "nvim-telescope/telescope-project.nvim" },

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

  -- LSP
  {
    "williamboman/mason.nvim",
    cmd = require("core.lazy_load").mason_cmds,
    config = function()
      require "plugins.configs.mason"
    end,
  },

  {
    "neovim/nvim-lspconfig",
    --opt = true,
    setup = function()
      require("core.lazy_load").on_file_open "nvim-lspconfig"
    end,
    config = function()
      require "plugins.configs.lspconfig"
    end
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    after = "nvim-lspconfig",
    config = function()
      require "plugins.configs.null-ls"
    end,
  },

  -- UI

  -- Icons
  { "kyazdani42/nvim-web-devicons" },

  -- Theme
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
          component_separators = ''
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

  -- File explorer(s)
  {
    "kyazdani42/nvim-tree.lua",
    config = function()
      require("nvim-tree").setup()
    end
  },

  { "tpope/vim-repeat" },
  { "tpope/vim-surround" },

  --{
  --  "folke/twilight.nvim",
  --  config = function() require("twilight").setup {} end,
  --},

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

  -- HCL
  { "jvirtanen/vim-hcl" },
}

require("core.packer").run(plugins)
