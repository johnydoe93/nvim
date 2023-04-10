-- windows to close
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "help",
    "startuptime",
    "qf",
    "lspinfo",
    "vim",
    "OverseerList",
    "OverseerForm",
    "fugitive",
    "toggleterm",
    "floggraph",
    "git",
    "neotest-summary",
    "query",
    "tsplayground",
  },
  command = [[nnoremap <buffer><silent> q :close<CR>]],
})
vim.api.nvim_create_autocmd("FileType", { pattern = "man", command = [[nnoremap <buffer><silent> q :quit<CR>]] })
vim.api.nvim_create_autocmd("FileType", { pattern = "cheat", command = [[nnoremap <buffer><silent> q :bdelete!<CR>]] })
