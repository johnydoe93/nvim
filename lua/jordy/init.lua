require("jordy.remap")
require("jordy.set")
require('jordy.packer')
vim.g.python3_host_prog = vim.fn.expand("~/.venvs/neovim/bin/python")
vim.o.mouse = ""

-- Lua version
vim.opt.expandtab = true      -- Use spaces instead of tabs
vim.opt.shiftwidth = 2        -- Indent by 2 spaces
vim.opt.tabstop = 2           -- Tabs look like 2 spaces
vim.opt.smartindent = true    -- Smart auto-indenting
vim.opt.autoindent = true
