require("core.options")
require("core.mappings").setup()

-- setup packer + plugins
require("core.packer").bootstrap()
require("plugins")
