vim.env.PATH = vim.env.PATH .. ":" .. vim.fn.stdpath "data" .. "/mason/bin"

require("core.options")
require("core.keymaps").setup()
require("core.packer").bootstrap()
