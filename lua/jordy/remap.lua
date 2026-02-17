vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "'a", "'azz")
vim.keymap.set("n", "'q", "'qzz")
vim.keymap.set("v", "<leader>{", "c{<Esc>pa}")
vim.keymap.set("v", "<leader>[", "c[<Esc>pa]")
vim.keymap.set("v", "<leader>(", "c(<Esc>pa)")
vim.keymap.set("v", "<leader>'", "c'<Esc>pa'")
vim.keymap.set("v", '<leader>"', 'c"<Esc>pa"')
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-o>", "<C-o>zz")
vim.keymap.set("n", "<C-i>", "<C-i>zz")
vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("v", "<leader>p", "\"_dP")
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")
vim.keymap.set("n", "<leader>w", "<C-w>")
vim.keymap.set("i", "zz", "<Esc>zza")
vim.keymap.set("n", "<leader><Up>", ":resize -2<CR>")
vim.keymap.set("n", "<leader><Down>", ":resize +2<CR>")
vim.keymap.set("n", "<leader><Left>", ":vertical resize -2<CR>")
vim.keymap.set("n", "<leader><Right>", ":vertical resize +2<CR>")
vim.keymap.set("t", "<leader><Up>", "<cmd>resize -2<CR>")
vim.keymap.set("t", "<leader><Down>", "<cmd>resize +2<CR>")
vim.keymap.set("t", "<leader><Left>", "<cmd>vertical resize -2<CR>")
vim.keymap.set("t", "<leader><Right>", "<cmd>vertical resize +2<CR>")
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("t", "<Esc>", '<C-\\><C-n>')
vim.keymap.set("t", "<leader>ss<leader>", 'show-source ')
--vim.keymap.set("n", "<leader>S", "<Esc><Cmd>lua require('jordy.cht').cht()<CR>")
vim.keymap.set("n", "<leader>s", "<Esc><Cmd>lua require('jordy.cht').so_input()<CR>")
--vim.keymap.set("n", "<leader>gg", ":ChatGPT<CR>")
vim.keymap.set("n", "<leader>i", ":lua vim.diagnostic.open_float()<CR>")

local cmp = require("cmp")
local luasnip = require("luasnip")

local function jumpable(direction)
    if luasnip.jumpable(direction) then
        luasnip.jump(direction)
        return true
    end
    return false
end

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        -- ✅ Ctrl+Space to accept completion or expand snippet
        ["<C-;>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.confirm({ select = true })
            elseif luasnip.expandable() then
                luasnip.expand()
            elseif luasnip.jumpable(1) then
                luasnip.jump(1)
            else
                fallback()
            end
        end, { "i", "s" }),

        -- ✅ Ctrl+J → next completion OR snippet jump forward
        ["<C-j>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { "i", "s" }),

        -- ✅ Ctrl+K → previous completion OR snippet jump backward
        ["<C-k>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),

        -- Optional scroll doc mappings
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    }),



    sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
    },
})

