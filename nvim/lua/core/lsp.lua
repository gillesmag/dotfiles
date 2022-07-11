local M = {}

M.servers = { 
  "ansiblels",      -- Ansible
  "clangd",         -- C/C++
  "cmake",          -- cmake
  "cssls",          -- CSS
  "dockerls",       -- Dockerfile
  "gopls",          -- Go
  "html",           -- HTML
  "jdtls",          -- Java
  "jsonls",         -- JSON
  "pyright",        -- Python
  "rust_analyzer",  -- Rust
  "sumneko_lua",    -- Lua
  "terraformls",    -- Terraform
  "texlab",         -- LaTeX
  "tsserver",       -- JavaScript/TypeScript
  "yamlls",         -- YAML
}

M.on_attach = function(client, _)
  client.resolved_capabilities.document_formatting = false
  client.resolved_capabilities.document_range_formatting = false

  -- TODO: make those mappings only work for buffer, not entire editor
  require("core.keymaps").lspconfig()
end

M.capabilities = function()
  local capabilities = vim.lsp.protocol.make_client_capabilities()

  capabilities.textDocument.completion.completionItem = {
    documentationFormat = { "markdown", "plaintext" },
    snippetSupport = true,
    preselectSupport = true,
    insertReplaceSupport = true,
    labelDetailsSupport = true,
    deprecatedSupport = true,
    commitCharactersSupport = true,
    tagSupport = { valueSet = { 1 } },
    resolveSupport = {
      properties = {
        "documentation",
        "detail",
        "additionalTextEdits",
      },
    },
  }

  return capabilities
end

return M
