--vim.keymap.set("n", "<leader>E", vim.cmd.NvimTreeCollapse)
--vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeToggle)
--local nvim_tree = require('nvim-tree')
--local nvim_tree_config = require('nvim-tree.config')
--local tree_cb = nvim_tree_config.nvim_tree_callback
--require'nvim-web-devicons'.get_icons()


---- examples for your init.lua

---- disable netrw at the very start of your init.lua (strongly advised)
--vim.g.loaded_netrw = 1
--vim.g.loaded_netrwPlugin = 1

---- set termguicolors to enable highlight groups
--vim.opt.termguicolors = true

---- empty setup using defaults
--nvim_tree.setup {
    --disable_netrw = true,
    --hijack_netrw = true,
    --ignore_ft_on_setup = {
        --"startify",
        --"dashboard",
        --"alpha",
    --},
    --open_on_tab = false,
    --hijack_cursor = false,
    --update_cwd = true,
    --hijack_directories = {
        --enable = true,
        --auto_open = true,
    --},
    --diagnostics = {
        --enable = true,
        --icons = {
            --hint = "",
            --info = "",
            --warning = "",
            --error = "",
        --},
    --},
    --sync_root_with_cwd = true,
    --respect_buf_cwd = true,
    --update_focused_file = {
        --enable = true,
        --update_cwd = true,
        --update_root = true,
        --ignore_list = {},
    --},
    --git = {
        --enable = true,
        --ignore = false,
        --timeout = 500,
    --},
    --view = {
        --width = 30,
        --hide_root_folder = false,
        --side = "left",
        --mappings = {
            --custom_only = false,
            --list = {
            --{ key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
            --{ key = "h", cb = tree_cb "close_node" },
            --{ key = "v", cb = tree_cb "vsplit" },
            --},
        --},
        --number = false,
        --relativenumber = false,
    --},
    --renderer = {
        --highlight_git = true,
        --root_folder_modifier = ":t",
        --icons = {
            --show = {
                --file = true,
                --folder = true,
                --folder_arrow = true,
                --git = true,
            --},
            --glyphs = {
                --default = "",
                --symlink = "",
                --git = {
                    --unstaged = "",
                    --staged = "S",
                    --unmerged = "",
                    --renamed = "➜",
                    --deleted = "",
                    --untracked = "U",
                    --ignored = "◌",
                --},
                --folder = {
                    --default = "",
                    --open = "",
                    --empty = "",
                    --empty_open = "",
                    --symlink = "",
                --},
            --}
        --}
    --}
--}
vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeToggle)
vim.keymap.set("n", "<leader>E", vim.cmd.NvimTreeCollapse)

local nvim_tree = require("nvim-tree")
require("nvim-web-devicons").get_icons()

-- Strongly recommended by nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

-- Custom keybindings using on_attach
local function my_on_attach(bufnr)
  local api = require("nvim-tree.api")


  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
  vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Open"))
  vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Directory"))
  vim.keymap.set("n", "v", api.node.open.vertical, opts("Open: Vertical Split"))

  vim.keymap.set("n", "r", api.fs.rename, opts("Rename"))
  vim.keymap.set("n", "d", api.fs.remove, opts("Delete"))
  vim.keymap.set("n", "c", api.fs.copy.node, opts("Copy"))
  vim.keymap.set("n", "p", api.fs.paste, opts("Paste"))
  vim.keymap.set("n", "x", api.fs.cut, opts("Cut"))
  vim.keymap.set("n", "a", api.fs.create, opts("Create File or Directory"))

end

-- Setup with updated config
nvim_tree.setup({
  on_attach = my_on_attach,
  disable_netrw = true,
  hijack_netrw = true,
  open_on_tab = false,
  hijack_cursor = false,
  update_cwd = true,
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
  diagnostics = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  sync_root_with_cwd = true,
  respect_buf_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true,
    update_root = true,
    ignore_list = {},
  },
  git = {
    enable = true,
    ignore = false,
    timeout = 500,
  },
  view = {
    width = 30,
    side = "left",
    number = false,
    relativenumber = false,
  },
  renderer = {
    highlight_git = true,
    root_folder_label = ":t", -- updated from root_folder_modifier
    icons = {
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },
      glyphs = {
        default = "",
        symlink = "",
        git = {
          unstaged = "",
          staged = "S",
          unmerged = "",
          renamed = "➜",
          deleted = "",
          untracked = "U",
          ignored = "◌",
        },
        folder = {
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
        },
      },
    },
  },
})

