vim.keymap.set("n", "<leader>l", vim.cmd.TestNearest)
vim.keymap.set("n", "<leader>T", vim.cmd.TestFile)

vim.g['test#strategy'] = "neovim"
vim.g['test#neovim#start_normal'] = 1
vim.g['test#neovim#term_position'] = "horizontal bot 20"
