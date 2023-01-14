local present, lspconfig = pcall(require, "lspconfig")

if not present then
  return
end

local servers = {
  ansiblels = {},
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

local on_attach = function(client, _)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false

    require("core.keymaps").lspconfig()
end

-- local client_capabilities = vim.lsp.protocol.make_client_capabilities()

-- client_capabilities.capabilities.textDocument.completion.completionItem = {
--   documentationFormat = { "markdown", "plaintext" },
--   snippetSupport = true,
--   preselectSupport = true,
--   insertReplaceSupport = true,
--   labelDetailsSupport = true,
--   deprecatedSupport = true,
--   commitCharactersSupport = true,
--   tagSupport = { valueSet = { 1 } },
--   resolveSupport = {
--     properties = {
--       "documentation",
--       "detail",
--       "additionalTextEdits",
--     },
--   },
-- }


local client_capabilities = require("cmp_nvim_lsp").default_capabilities()

-- lspconfig.sumneko_lua.setup {
--     on_attach = M.on_attach,
--     capabilities = capabilities,
--
-- }

for server, config in pairs(servers) do
  config.on_attach = on_attach
  config.capabilities = vim.tbl_deep_extend("keep", config.capabilities or {}, client_capabilities)
  lspconfig[server].setup(config)
end
