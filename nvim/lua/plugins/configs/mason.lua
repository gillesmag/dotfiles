local present, mason = pcall(require, "mason")

if not present then
  return
end

local options = {
  ensure_installed = {
    "lua-language-server",
    "ansible-language-server", -- Ansible
    "clangd", -- C/C++
    "cmake-language-server", -- cmake
    "css-lsp", -- CSS
    "dockerfile-language-server", -- Dockerfile
    "gopls", -- Go
    "html-lsp", -- HTML
    "jdtls", -- Java
    "json-lsp", -- JSON
    "pyright", -- Python
    "rust-analyzer", -- Rust
    "terraform-ls", -- Terraform
    "texlab", -- LaTeX
    "typescript-language-server", -- JavaScript/TypeScript
    "yaml-language-server" -- YAML
  }, -- not an option from mason.nvim

  PATH = "skip",

  ui = {
    icons = {
      package_pending = " ",
      package_installed = " ",
      package_uninstalled = " ﮊ",
    },

    keymaps = {
      toggle_server_expand = "<CR>",
      install_server = "i",
      update_server = "u",
      check_server_version = "c",
      update_all_servers = "U",
      check_outdated_servers = "C",
      uninstall_server = "X",
      cancel_installation = "<C-c>",
    },
  },

  max_concurrent_installers = 10,
}

vim.api.nvim_create_user_command("MasonInstallAll", function()
  vim.cmd("MasonInstall " .. table.concat(options.ensure_installed, " "))
end, {})

mason.setup(options)
