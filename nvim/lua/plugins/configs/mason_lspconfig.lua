local present, mason_lspconfig = pcall(require, "mason-lspconfig")

if not present then
  return
end

mason_lspconfig.setup({
  automatic_installation = true,
  ensure_installed = {
    "ansiblels", -- Ansible
    "clangd", -- C/C++
    "cmake", -- cmake
    "cssls", -- CSS
    "dockerls", -- Dockerfile
    "gopls", -- Go
    "html", -- HTML
    "jdtls", -- Java
    "jsonls", -- JSON
    "pyright", -- Python
    "rust_analyzer", -- Rust
    "lua_ls", -- Lua
    "terraformls", -- Terraform
    "texlab", -- LaTeX
    "tsserver", -- JavaScript/TypeScript
    "yamlls" -- YAML
  }
})
