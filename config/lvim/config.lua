--[[
lvim is the global options object
Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
-- general
require('onedark').setup {
    style = 'darker'
}
require('onedark').load()

lvim.log.level = "warn"
lvim.format_on_save = true
--lvim.colorscheme = "material"
--lvim.lsp.diagnostics.virtual_text = false
-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<C-p>"] = ":Telescope find_files<cr>"
lvim.keys.normal_mode["<C-b>"] = ":Telescope buffers<cr>"
lvim.keys.normal_mode["<C-f>"] = ":Telescope grep_string<cr>"
vim.g.ackprg = 'rg --vimgrep --no-heading'
vim.g.maplocalleader='\\'
-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = false
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"
-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
-- lvim.builtin.dashboard.active = true
--lvim.builtin.notify.active = false
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.bufferline.active = false
--lvim.transparent_window = true
-- lvim.builtin.nvimtree.show_icons.git = 0

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- Additional Plugins
lvim.plugins = {
  { "marko-cerovac/material.nvim" },
  { "navarasu/onedark.nvim" },
  { "benmills/vimux" },
  { "mileszs/ack.vim"},
  { "folke/trouble.nvim" },
  { "patstockwell/vim-monokai-tasty"},
  { "sainnhe/sonokai" },
  {
    "vim-test/vim-test",
    cmd = { "TestNearest", "TestFile", "TestSuite", "TestLast", "TestVisit" },
    keys = { "<localleader>tf", "<localleader>tn", "<localleader>ts" },
  },
  { "tpope/vim-rails" },
  { 'brooth/far.vim' },
  { 'tpope/vim-dadbod' },
  { 'kristijanhusak/vim-dadbod-ui' },
  { 'kristijanhusak/vim-dadbod-completion' },
  { 'jceb/vim-orgmode' },
  { 'jmfryan/vim-embertest' },
  { 'christoomey/vim-tmux-navigator' }
}

local trouble = require("trouble.providers.telescope")
local _, actions = pcall(require, "telescope.actions")
lvim.builtin.telescope.defaults.mappings = {
  -- for input mode
  i = {
    ["<c-j>"] = actions.move_selection_next,
    ["<c-k>"] = actions.move_selection_previous,
    ["<c-n>"] = actions.cycle_history_next,
    ["<c-p>"] = actions.cycle_history_prev,
    ["<c-t>"] = trouble.open_with_trouble,
  },
  -- for normal mode
  n = {
    ["<c-j>"] = actions.move_selection_next,
    ["<c-k>"] = actions.move_selection_previous,
    ["<c-t>"] = trouble.open_with_trouble,
  },
}

vim.g["test#strategy"] = "vimux"

vim.cmd [[
    let test#ruby#rspec#executable = 'pilot exec intercom bundle exec rspec -- --no-profile'
    let test#custom_runners = {'javascript': ['ember'], 'typescript': ['ember']}
]]

vim.g.material_style = "darker"
lvim.builtin.terminal.active = true
lvim.builtin.which_key.mappings["t"] = {
  name = "test",
  t = { "<cmd>testlast<cr>", "last" },
  f = { "<cmd>testfile<cr>", "file" },
  n = { "<cmd>testnearest<cr>", "nearest" },
  s = { "<cmd>testsuite<cr>", "suite" },
}

lvim.builtin.which_key.mappings["f"] = {
  name = "find",
  f = { ":ack! -f \"<c-r><c-w>\"<cr>", "word under cursor" },
  a = { ":ack! -f \"<c-r><c-w>\" app<cr>", "word under cursor (/app only)" },
}

vim.opt.showtabline = 0

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  {
    command = "eslint_d",
    ---@usage specify which filetypes to enable. by default a providers will attach to all the filetypes it supports.
    filetypes = { "javascript", "typescript" },
  },
}

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    command = "prettier",
    filetypes = { "javascript", "typescript", "typescriptreact" },
  },
}
