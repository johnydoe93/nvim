local neogit = require('neogit')

neogit.setup {
    kind = 'split_above',
    disable_commit_confirmation = true,
}

vim.keymap.set("n", "<leader>gs", vim.cmd.Neogit)
