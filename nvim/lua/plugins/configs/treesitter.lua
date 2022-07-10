local present, ts_config = pcall(require, "nvim-treesitter.configs")

if not present then
  return
end

local default = {
  ensure_installed = {
    "lua",
    "vim",
    "rust",
    "bash",
    "javascript",
    "typescript",
    "yaml",
    "go",
  },
  highlight = {
    enable = true,
    use_languagetree = true,
  },
}

ts_config.setup(default)
