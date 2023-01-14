local opt = vim.opt
local g = vim.g

g.mapleader = " "                    -- Set leader key to space

-- UI
opt.cursorline = true                -- Enable cursor line
opt.mouse = "a"                      -- Enable mouse usage in all modes
opt.number = true                    -- Enable line numbers
opt.relativenumber = true            -- Use relative line numbers
opt.shortmess:append "sI"            -- Disable nvim intro
opt.splitbelow = true                -- Open new windows to the bottom
opt.splitright = true                -- Open new windows to the right
opt.termguicolors = true             -- Enable 24-bit RGB colors
opt.title = true                     -- Show filename in terminal title bar

-- Indentation
opt.expandtab = true                 -- Convert tabs into spaces
opt.shiftround = true                -- Round indent to multiple of shiftwidth
opt.shiftwidth = 2                   -- Number of spaces to use for indenting
opt.smartindent = true               -- Smartly indent next line
opt.softtabstop = 2                  -- Number of spaces to use when inserting a tab
opt.tabstop = 2                      -- Show tab as 2 spaces

-- Search
opt.hlsearch = false                 -- Don't highlight search results
opt.ignorecase = true                -- Ignore case when searching
opt.smartcase = true                 -- Ignore ignorecase when search has uppercase letters
