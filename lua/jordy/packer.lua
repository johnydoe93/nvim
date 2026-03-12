-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  ---------------------------------------------------------------------------
  -- 🧩 Snippets and Completion
  ---------------------------------------------------------------------------
  use {
    'greggh/claude-code.nvim',
    requires = {
      'nvim-lua/plenary.nvim', -- Required for git operations
    },
    config = function()
      require('claude-code').setup()
    end
  }

  use({
    "L3MON4D3/LuaSnip",
    requires = { "rafamadriz/friendly-snippets" },
    config = function()
      local luasnip = require("luasnip")

      -- ✅ Load both VSCode-format and SnipMate-format snippets
      require("luasnip.loaders.from_vscode").lazy_load()
      require("luasnip.loaders.from_vscode").lazy_load({
          paths = { vim.fn.stdpath("data") .. "/site/pack/packer/start/friendly-snippets" },
      })

      -- ✅ Optional: also load from your own custom folders later if needed
      -- require("luasnip.loaders.from_snipmate").lazy_load()
      -- require("luasnip.loaders.from_lua").lazy_load()

      -- Diagnostic log to confirm snippets loaded
      vim.defer_fn(function()
          local available = require("luasnip").available()
          print("LuaSnip loaded for filetypes: " .. table.concat(vim.tbl_keys(available), ", "))
      end, 1000)

      -- Optional: load your own custom snippets later
      -- require("luasnip.loaders.from_snipmate").lazy_load()

    end,
  })

  use({
    "hrsh7th/nvim-cmp",
    requires = {
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lua",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = {
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        },
      })
    end,
  })

  ---------------------------------------------------------------------------
  -- 🧠 LSP + Mason + LSP-Zero
  ---------------------------------------------------------------------------
  use({
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion (LuaSnip is already loaded above)
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-nvim-lua' },
      { 'saadparwaiz1/cmp_luasnip' },
    },
  })

  ---------------------------------------------------------------------------
  -- 🔍 Telescope + File Browser
  ---------------------------------------------------------------------------
  use({
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } },
  })

  use({
    "nvim-telescope/telescope-file-browser.nvim",
    requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  })

  ---------------------------------------------------------------------------
  -- 🌲 Syntax, Treesitter, and Playground
  ---------------------------------------------------------------------------
  use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })
  use('nvim-treesitter/playground')
  use('nvim-treesitter/nvim-treesitter-context')

  ---------------------------------------------------------------------------
  -- 🧭 Tools, Git, Terminal, UI
  ---------------------------------------------------------------------------
  use('theprimeagen/harpoon')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')
  use('mhinz/vim-signify')
  use('tpope/vim-rhubarb')
  use('junegunn/gv.vim')
  use({ "github/copilot.vim" })
  use({ "vim-test/vim-test" })
  use({ "EdenEast/nightfox.nvim" })
  use({ 'mhartington/oceanic-next' })
  use({ 'nvim-tree/nvim-web-devicons' })
  use({
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons',
    },
  })
  use({ 'moll/vim-bbye' })
  use({ 'nanozuki/tabby.nvim' })
  use({ 'f-person/git-blame.nvim' })
  use({ 'tpope/vim-surround' })
  use({ 'jgdavey/vim-blockle' })
  use({ 'AndrewRadev/switch.vim' })
  use({ 'AdamWhittingham/vim-copy-filename' })
  use({
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  })
  use({ 'preservim/nerdcommenter' })
  use({ 'bogado/file-line' })
  use({ 'toppair/peek.nvim', run = 'deno task --quiet build:fast' })
  use({
    "akinsho/toggleterm.nvim",
    tag = '*',
    config = function() require("toggleterm").setup() end
  })
  use({ 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' })
  use({ 'tpope/vim-endwise' })
  use({ 'ctrlpvim/ctrlp.vim' })
  use({ 'kchmck/vim-coffee-script' })
  use({ 'tpope/vim-rails' })
  use({ 'honza/vim-snippets' }) -- Legacy, optional
  use({
    "williamboman/mason.nvim",
    run = ":MasonUpdate"
  })
  use({ 'vim-ruby/vim-ruby' })

end)
