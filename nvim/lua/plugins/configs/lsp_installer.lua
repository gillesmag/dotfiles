local present, lsp_installer = pcall(require, "nvim-lsp-installer")

if not present then
  return
end

local options = {
  ensure_installed = require("core.lsp").servers,

  automatic_installation = true,

  ui = {
    icons = {
      server_installed = " ",
      server_pending = " ",
      server_uninstalled = " ﮊ",
    },
    keymaps = {
      toggle_server_expand = "<CR>",
      install_server = "i",
      update_server = "u",
      check_server_version = "c",
      update_all_servers = "U",
      check_outdated_servers = "C",
      uninstall_server = "X",
    },
  },

  max_concurrent_installers = 10,
}

lsp_installer.setup(options)
