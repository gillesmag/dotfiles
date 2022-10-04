local present, lspconfig = pcall(require, "lspconfig")

if not present then return end

local M = {}

M.servers = {
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
    "terraformls", -- Terraform
    "texlab", -- LaTeX
    "tsserver", -- JavaScript/TypeScript
    "yamlls" -- YAML
}

M.on_attach = function(client, bufnr)
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false

    require("core.keymaps").lspconfig({buffer = bufnr})
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()

M.capabilities.textDocument.completion.completionItem = {
    documentationFormat = {"markdown", "plaintext"},
    snippetSupport = true,
    preselectSupport = true,
    insertReplaceSupport = true,
    labelDetailsSupport = true,
    deprecatedSupport = true,
    commitCharactersSupport = true,
    tagSupport = {valueSet = {1}},
    resolveSupport = {
        properties = {"documentation", "detail", "additionalTextEdits"}
    }
}

lspconfig.sumneko_lua.setup {
    on_attach = M.on_attach,
    capabilities = M.capabilities,

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

for _, lsp in ipairs(M.servers) do
    lspconfig[lsp].setup {
        on_attach = M.on_attach,
        capabilities = M.capabilities
    }
end

return M
