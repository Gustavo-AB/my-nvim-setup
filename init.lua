
vim.g.mapleader = " "
vim.g.maplocalleader = ' '
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


local opts = {}
require("lazy").setup("plugins", opts)
local config = require("nvim-treesitter.configs")
local builtin = require("telescope.builtin")

vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

vim.opt.number = true
vim.opt.relativenumber = true

vim.keymap.set('i', 'jj', '<ESC>', {})
vim.keymap.set('n', '<C-s>', ':w<CR>')
vim.keymap.set('n', '<leader>n', ':Neotree<CR>', {})
vim.keymap.set('n', '<leader>nn', ':Neotree close<CR>', {})


vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.showmode = false
vim.opt.clipboard = 'unnamedplus'
vim.opt.breakindent = true


vim.cmd("colorscheme cyberdream")

vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

config.setup {
  ensure_installed = { "lua", "vim", "javascript", "typescript", "html", "css" }, -- ou o que você quiser
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
