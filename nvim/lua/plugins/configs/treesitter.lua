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
    "sql",
    "toml",
    "typescript",
    "vim",
    "yaml",
  },
  highlight = {
    enable = true,
    use_languagetree = true,
  },
}

treesitter.setup(default)
