vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function()
  -- Packer can manage itself
  use "wbthomason/packer.nvim"
  use "lewis6991/impatient.nvim"
  use "nathom/filetype.nvim"
  use "nvim-lua/plenary.nvim"

  use {
    "neovim/nvim-lspconfig",
    -- TODO(gm): add LSP
    -- setup = function() require("plugins.configs.lspconfig").setup() end
  }

  use {
    "nvim-treesitter/nvim-treesitter",
    config = function() require("plugins.configs.treesitter").setup() end
  }

  use {
    "lewis6991/gitsigns.nvim",
    requires = {
      "nvim-lua/plenary.nvim"
    },
    config = function() require("gitsigns").setup() end
  }

  use {
    "kyazdani42/nvim-tree.lua",
    requires = {
      "kyazdani42/nvim-web-devicons",
    },
    config = function() require("nvim-tree").setup() end
  }

  use {
    "folke/tokyonight.nvim",
    event = "VimEnter",
    config = function()
      vim.cmd[[colorscheme tokyonight]]
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
    config = function()
      require('Comment').setup()
    end,
    setup = function()
       require("core.mappings").comment()
    end,
  }
end)
