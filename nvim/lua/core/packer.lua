local M = {}

M.bootstrap = function()
  local fn = vim.fn
  local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

  if fn.empty(fn.glob(install_path)) > 0 then
    print "Cloning packer..."
    fn.system { "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path }

    vim.cmd "packadd packer.nvim"
    require "plugins"
    vim.cmd "PackerSync"
  end
end

M.run = function(plugins)
  local present, packer = pcall(require, "packer")

  if not present then
    return
  end

  packer.startup(function(use)
    for _, v in ipairs(plugins) do
      use(v)
    end
  end)
end

return M
