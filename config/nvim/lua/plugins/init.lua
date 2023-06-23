local plugins = {
  "lewis6991/impatient.nvim",

  {
    "folke/lua-dev.nvim",
    module = "lua-dev",
  },

  {
    "nvim-treesitter/nvim-treesitter",
    module = "nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require "plugins.configs.treesitter"
    end,
  },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("todo-comments").setup()
    end,
  },

  -- Git
  {
    "tpope/vim-fugitive",
    init = function()
      require("core.keymaps").fugitive()
    end,
  },

  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    module = "telescope",
    cmd = "Telescope",
    config = function()
      require "plugins.configs.telescope"
    end,
    init = function()
      require("core.keymaps").telescope()
    end,
  },

  -- LSP
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = function()
      require "plugins.configs.mason"
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require "plugins.configs.mason_lspconfig"
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
    end,
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = { "nvim-lspconfig" },
    config = function()
      require "plugins.configs.null-ls"
    end,
  },

  {
    "j-hui/fidget.nvim",
    tag = "legacy",
    config = function()
      require("fidget").setup()
    end,
  },

  {
    "folke/neodev.nvim",
    config = function()
      require("neodev").setup()
    end,
  },

  -- Completion
  {
    "hrsh7th/nvim-cmp",
    config = function()
      require "plugins.configs.cmp"
    end,
  },
  "hrsh7th/cmp-nvim-lsp",
  "L3MON4D3/LuaSnip",
  "saadparwaiz1/cmp_luasnip",
  "rafamadriz/friendly-snippets",

  -- UI
  {
    "folke/tokyonight.nvim",
    config = function()
      vim.cmd "colorscheme tokyonight"
    end,
  },

  -- Status line
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup {
        options = {
          theme = "tokyonight",
          icons_enabled = true,
          section_separators = "",
          component_separators = "",
        },
      }
    end,
  },

  -- Buffer line
  {
    "akinsho/bufferline.nvim",
    version = "v3.*",
    config = function()
      require("bufferline").setup {
        options = {
          mode = "tabs",
        },
      }
    end,
  },

  -- File explorer
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup {
        filters = {
          dotfiles = false,
        },
      }
    end,
  },

  -- Delete, change and add surrounding pairs (paranetheses, brackets, etc.)
  "tpope/vim-surround",

  -- Detect tabstop and shiftwidth automatically
  "tpope/vim-sleuth",

  {
    "numToStr/Comment.nvim",
    module = "Comment",
    keys = { "gcc" },
    config = function()
      require("Comment").setup()
    end,
    init = function()
      require("core.keymaps").comment()
    end,
  },

  {
    "ethanholz/nvim-lastplace",
    config = function()
      require("nvim-lastplace").setup {}
    end,
  },

  -- HCL
  "jvirtanen/vim-hcl",

  -- Jsonnet
  "google/vim-jsonnet",

  -- GitHub Copilot
  "github/copilot.vim",

  -- Scala
  {
    "scalameta/nvim-metals",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  },
}

require("lazy").setup(plugins, {
  lockfile = "/Users/gm/projects/dotfiles/config/nvim/lazy-lock.json",
})
