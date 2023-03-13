local present, lspconfig = pcall(require, "lspconfig")

if not present then
  return
end

local configs = {
  lua_ls = {
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
  }
}

local on_attach = function(_, bufnr)
    require("core.keymaps").lspconfig(bufnr)
end

local servers = require("core.lsp")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

for _, server in ipairs(servers) do
  local config = configs[server] or {}
  config.on_attach = on_attach
  config.capabilities = vim.tbl_deep_extend("keep", config.capabilities or {}, capabilities)
  lspconfig[server].setup(config)
end
