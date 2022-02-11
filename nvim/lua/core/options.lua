local opt = vim.opt
local g = vim.g

local options = require("core.mappings").options

opt.title = true

g.mapleader = options.mapleader

-- Numbers
opt.number = true                    -- enable line numbers

opt.cul = true                       -- enable cursor line

opt.mouse = "a"                      -- enable mouse usage in all modes

-- Indent
opt.shiftwidth = 2                   -- number of spaces to use for indenting
opt.softtabstop = 2                  -- number of spaces to use when inserting a tab
opt.tabstop = 2                      -- show tab as 2 spaces
opt.expandtab = true                 -- convert tabs into spaces
opt.smartindent = true               -- smartly indent next line

opt.splitbelow = true                -- open new windows to the bottom
opt.splitright = true                -- open new windows to the right

opt.termguicolors = true

opt.shortmess:append "sI"            -- disable nvim intro
