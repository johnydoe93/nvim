vim.g.copilot_no_tab_map = true
vim.keymap.set("i", ",,", '<Plug>(copilot-next)')
vim.api.nvim_set_keymap('i', 'qq', 'copilot#Accept("<CR>")', {expr=true, silent=true})
