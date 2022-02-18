return function()
  local lsp_installer = require("nvim-lsp-installer")

  local servers = {
    "sumneko_lua",    -- Lua
    "ansiblels",      -- Ansible
    "rust_analyzer",  -- Rust
    "clangd",         -- C/C++
    "cmake",          -- cmake
    "pyright",        -- Python
    "tsserver",       -- JavaScript/TypeScript
    "dockerls",       -- Dockerfile
    "cssls",          -- CSS
    "html",           -- HTML
    "jsonls",         -- JSON
    "texlab",         -- LaTeX
    "jdtls",          -- Java
    "yamlls",         -- YAML
    --"gopls",          -- Go
  }

  -- Snippets support
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.preselectSupport = true
  capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
  capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
  capabilities.textDocument.completion.completionItem.deprecatedSupport = true
  capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
  capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = { "documentation", "detail", "additionalTextEdits" },
  }
  capabilities.textDocument.codeAction = {
    dynamicRegistration = false,
    codeActionLiteralSupport = {
      codeActionKind = {
        valueSet = {
          "",
          "quickfix",
          "refactor",
          "refactor.extract",
          "refactor.inline",
          "refactor.rewrite",
          "source",
          "source.organizeImports",
        },
      },
    },
  }

  local on_attach = function(_, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    local opts = { noremap=true, silent=true }

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    require("core.mappings").lspconfig()
  end

  local lua_lsp = require("lua-dev").setup {
    lspconfig = {
      settings = {
        Lua = {
          workspace = {
            preloadFileSize = 200,
          },
          diagnostics = {
            globals = { "packer_plugins" },
          },
        },
      },
      capabilities = capabilities,
      on_attach = on_attach,
    },
  }

  for _, server_name in pairs(servers) do
    local server_available, server = lsp_installer.get_server(server_name)
    if server_available then
      local server_config = server.name == "sumneko_lua" and lua_lsp or {
          on_attach = on_attach,
          capabilities = capabilities,
          flags = {
            debounce_text = 150,
          },
        }
      server:on_ready(function()
        server:setup(server_config)
      end)
      if not server:is_installed() then
        -- Queue server to be installed.
        server:install()
      end
    end
  end
end
