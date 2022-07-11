local present, lspconfig = pcall(require, "lspconfig")

if not present then
  return
end

local config = require("core.lsp")

local opts = {}

for _, lsp in ipairs(config.servers) do
  opts = {
    on_attach = config.on_attach,
    capabilities = config.capabilities(),
  }

  if lsp == "sumneko_lua" then
    local sumneko_opts = {
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            library = {
              [vim.fn.expand "$VIMRUNTIME/lua"] = true,
              [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
            },
            maxPreload = 100000,
            preloadFileSize = 10000,
          },
        },
      },
    }
    opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
  end

  lspconfig[lsp].setup {
    on_attach = config.on_attach,
    capabilities = config.capabilities(),
  }
end
