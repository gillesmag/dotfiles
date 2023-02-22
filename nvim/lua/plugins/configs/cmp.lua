local present, cmp = pcall(require, "cmp")

require("luasnip.loaders.from_vscode").lazy_load()

if not present then
  return
end

cmp.setup({
  window = {
    documentation = cmp.config.window.bordered()
  },
  mapping = cmp.mapping.preset.insert(
    require("core.keymaps").cmp(cmp)
  ),
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = 'luasnip' },
  }, {
    { name = "buffer" },
  }),

})
