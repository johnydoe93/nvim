local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
--vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})
vim.keymap.set('n', '<leader>gf', vim.cmd.GBrowse, {silent=true})
vim.keymap.set('v', '<leader>gf', ':GBrowse<ENTER>', {silent=true})

-- :command! -nargs=1 Browse silent execute '!open' shellescape(<q-args>,1)
vim.cmd('command! -nargs=1 Browse silent execute "!open" shellescape(<q-args>,1)')
