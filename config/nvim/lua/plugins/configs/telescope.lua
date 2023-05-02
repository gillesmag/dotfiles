local present, telescope = pcall(require, "telescope")

if not present then
  return
end

local actions = require "telescope.actions"
local options = {
  defaults = {
    file_ignore_patterns = {
      "node_modules",
    },
    path_display = { "truncate" },
    sorting_strategy = "ascending",
    layout_strategy = "flex",
    mappings = {
      i = {
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      },
      n = { ["q"] = actions.close },
    },
  },
  borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
  pickers = {
    find_files = {
      -- hidden = true,
      no_ignore = true,
    },
  },
}

telescope.setup(options)
