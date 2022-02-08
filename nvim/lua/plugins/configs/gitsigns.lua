local present, gitsigns = pcall(require, "gitsigns")

if not present then
	return
end

local M = {}
M.setup = function()
  gitsigns.setup()
end

return M
