local present, treesitter = pcall(require, "nvim-treesitter.configs")

if not present then
  return
end

local default = {
  ensure_installed = {
    "bash",
    "c",
    "cpp",
    "dot",
    "go",
    "hcl",
    "html",
    "javascript",
    "json",
    "lua",
    "python",
    "rust",
    "scala",
    "sql",
    "toml",
    "typescript",
    "vim",
    "yaml",
  },
  auto_install = true,
  indent = { enable = true, disable = { "python" } },
  highlight = {
    enable = true,
  },
}

treesitter.setup(default)
