vim.cmd("set encoding=utf-8")
vim.cmd("set nocompatible")
vim.cmd("set showmatch")
vim.cmd("set ignorecase")
vim.cmd("set mouse=v")
vim.cmd("set hlsearch")
vim.cmd("set incsearch")
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set autoindent")
vim.cmd("set number")
vim.g.mapleader = " "

-- lazy.nvim plugin manager
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

local plugins = {
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
    {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    }
    },
}
local opts = {}

require("lazy").setup(plugins, opts)

-- Load Telescope (Fuzzy Finder, etc)
local builtin = require("telescope.builtin")
vim.keymap.set('n', '<C-p>', builtin.find_files,{})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

-- Neo Tree Keymaps  
vim.keymap.set('n', '<C-t>', ':Neotree show toggle reveal <CR>', {}) -- Neotree Toggle
vim.keymap.set('n', '<C-f>', ':Neotree focus<CR>', {}) -- Neotree focus
vim.keymap.set('n', '<C-g>', ':Neotree git_status bottom toggle<CR>', {}) -- Neotree git
--vim.keymap.set('n', '<C-t>', ':Neotree filesystem reveal left<CR>', {})
--vim.keymap.set('n', '<C-t>', ':Neotree filesystem reveal left<CR>', {})
--vim.keymap.set('n', '<C-t>', ':Neotree filesystem reveal left<CR>', {})

require("neo-tree").setup({
    enable_git_status = true,
    default_component_configs = {
      indent = {
        with_markers = true,
        indent_marker = "│",
        last_indent_marker = "└",
        indent_size = 2,
      },
    },
})



-- Local Config for TreeSitter
local config = require("nvim-treesitter.configs")

config.setup({
          ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html" },
          highlight = { enable = true },
          indent = { enable = true },  
})

-- Load Themes
require("catppuccin").setup()
vim.cmd.colorscheme "catppuccin"
