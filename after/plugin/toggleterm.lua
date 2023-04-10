require("toggleterm").setup {
    size = 20,
    hide_numbers = true,
    open_mapping = [[<C-\>]],
    shade_filetypes = {},
    shade_terminals = false,
    shading_factor = 0.3,
    start_in_insert = true,
    persist_size = true,
    direction = "horizontal",
    winbar = {
        enabled = false,
        name_formatter = function(term)
            return term.name
        end,
    },
}
vim.keymap.set("n", "<leader>x", vim.cmd.ToggleTerm)
vim.keymap.set("n", "1<leader>x", ":1ToggleTerm<CR>")
vim.keymap.set("n", "2<leader>x", ":2ToggleTerm<CR>")
vim.keymap.set("n", "3<leader>x", ":3ToggleTerm<CR>")
vim.keymap.set("n", "4<leader>x", ":4ToggleTerm<CR>")
vim.keymap.set("n", "5<leader>x", ":5ToggleTerm<CR>")
vim.keymap.set("n", "6<leader>x", ":6ToggleTerm<CR>")
vim.keymap.set("n", "7<leader>x", ":7ToggleTerm<CR>")
