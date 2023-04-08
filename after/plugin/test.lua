vim.keymap.set("n", "<leader>l", ':TestNearest<ENTER>G')
vim.keymap.set("n", "<leader>T", ':TestFile<ENTER>G')

vim.g['test#strategy'] = "neovim"
vim.g['test#neovim#start_normal'] = 1
vim.g['test#neovim#term_position'] = "horizontal bot 20"
