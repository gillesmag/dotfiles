local M = {}

local autocmd = vim.api.nvim_create_autocmd

M.lazy_load = function(tb)
   autocmd(tb.events, {
      pattern = "*",
      group = vim.api.nvim_create_augroup(tb.augroup_name, {}),
      callback = function()
         if tb.condition() then
            vim.api.nvim_del_augroup_by_name(tb.augroup_name)

            -- dont defer for treesitter as it will show slow highlighting
            -- This deferring only happens only when we do "nvim filename"
            if tb.plugins ~= "nvim-treesitter" then
               vim.defer_fn(function()
                  vim.cmd("PackerLoad " .. tb.plugins)
               end, 0)
            else
               vim.cmd("PackerLoad " .. tb.plugins)
            end
         end
      end,
   })
end

M.on_file_open = function(plugin_name)
   M.lazy_load {
      events = { "BufRead", "BufWinEnter", "BufNewFile" },
      augroup_name = "BeLazyOnFileOpen" .. plugin_name,
      plugins = plugin_name,
      condition = function()
         local file = vim.fn.expand "%"
         return file ~= "NvimTree_1" and file ~= "[packer]" and file ~= ""
      end,
   }
end

M.lsp_cmds = {
  "LspInfo",
  "LspStart",
  "LspRestart",
  "LspStop",
  "LspInstall",
  "LspUnInstall",
  "LspUnInstallAll",
  "LspInstall",
  "LspInstallInfo",
  "LspInstallLog",
  "LspLog",
  "LspPrintInstalled",
}

return M
