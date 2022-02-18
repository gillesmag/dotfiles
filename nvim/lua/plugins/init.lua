vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function()
  -- Packer can manage itself
  use "wbthomason/packer.nvim"
  use "lewis6991/impatient.nvim"
  use "nathom/filetype.nvim"
  use "nvim-lua/plenary.nvim"

  use "neovim/nvim-lspconfig"

  use {
    "folke/lua-dev.nvim",
    module = "lua-dev"
  }

  use {
    "williamboman/nvim-lsp-installer",
    requires = {
      "neovim/nvim-lspconfig",
      "folke/lua-dev.nvim",
    },
    config = require("plugins.configs.lsp-installer")
  }


  use {
    "nvim-treesitter/nvim-treesitter",
    config = require("plugins.configs.treesitter"),
  }

  -- Git
  use {
    "lewis6991/gitsigns.nvim",
    requires = {
      "nvim-lua/plenary.nvim"
    },
    config = function()
      require("gitsigns").setup()
    end
  }

  -- File explorer(s)
  use {
    "kyazdani42/nvim-tree.lua",
    requires = {
      "kyazdani42/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup()
    end
  }

  use {
    "nvim-telescope/telescope.nvim",
    module = "telescope",
    cmd = "Telescope",
    --config = function() require("plugins.configs.telescope").setup() end,
    setup = function()
      require("core.mappings").telescope()
    end
  }

  -- UI
  -- Theme
  use {
    "folke/tokyonight.nvim",
    event = "VimEnter",
    config = function()
      vim.cmd[[colorscheme tokyonight]]
    end
  }

  use {
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
    config = function()
      require("lualine").setup {
        options = {
          icons_enabled = false,
          section_separators = '', component_separators = ''
        }
      }
    end
  }

  use {
    "numToStr/Comment.nvim",
    module = "Comment",
    keys = { "gcc" },
    setup = function()
      require('Comment').setup()
    end,
    config = function()
       require("core.mappings").comment()
    end,
  }
end)
