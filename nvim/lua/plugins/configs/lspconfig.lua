local present, lspconfig = pcall(require, "lspconfig")

if not present then
  return
end

local servers = {
  ansiblels = {},
  bashls = {},
  clangd = {},
  cmake = {},
  cssls = {},
  dockerls = {},
  gopls = {},
  html = {},
  jdtls = {},
  jsonls = {},
  pyright = {},
  rust_analyzer = {},
  sumneko_lua = {
    settings = {
      Lua = {
        diagnostics = {globals = {"vim"}},
        workspace = {
          library = {
            [vim.fn.expand "$VIMRUNTIME/lua"] = true,
            [vim.fn.expand "$VIMRUNTIEM/lua/vim/lsp"] = true
           },
           maxPreload = 100000,
           preloadFileSize = 10000
        }
      }
   }
  },
  terraformls = {},
  texlab = {},
  tsserver = {},
  yamlls = {},
}

local on_attach = function(_, bufnr)
    require("core.keymaps").lspconfig(bufnr)
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

for server, config in pairs(servers) do
  config.on_attach = on_attach
  config.capabilities = vim.tbl_deep_extend("keep", config.capabilities or {}, capabilities)
  lspconfig[server].setup(config)
end
