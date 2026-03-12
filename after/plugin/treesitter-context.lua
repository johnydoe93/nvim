require('treesitter-context').setup({
  enable = true,
  max_lines = 5,
  multiline_threshold = 1,
  trim_scope = 'outer',
  mode = 'topline',
})
