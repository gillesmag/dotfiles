local present, telescope = pcall(require, "telescope")

if not present then
  return
end

local options = {
  defaults = {
    file_ignore_patterns = {
      "node_modules",
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

local extensions = {
  "file_browser",
}

for _, ext in ipairs(extensions) do
  telescope.load_extension(ext)
end
