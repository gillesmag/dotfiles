local present, telescope = pcall(require, "telescope")

if not present then
  return
end

local options = {
  borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
}

telescope.setup(options)

local extensions = {
  "file_browser",
  "project",
  "projects",
}

for _, ext in ipairs(extensions) do
  telescope.load_extension(ext)
end
