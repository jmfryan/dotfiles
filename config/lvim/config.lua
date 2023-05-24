--[[
 THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
 `lvim` is the global options object
]]

-- vim options
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.relativenumber = true

-- general
lvim.log.level = "info"
lvim.format_on_save = {
  enabled = true,
  pattern = "*.lua",
  timeout = 1000,
}
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings <https://www.lunarvim.org/docs/configuration/keybindings>
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-p>"] = ":Telescope find_files<cr>"
lvim.keys.normal_mode["<C-b>"] = ":Telescope buffers<cr>"
lvim.keys.normal_mode["<C-f>"] = ":Telescope grep_string<cr>"

-- lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
-- lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"

-- -- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["W"] = { "<cmd>noautocmd w<cr>", "Save without formatting" }
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }

-- -- Change theme settings
-- lvim.colorscheme = "lunar"

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- Automatically install missing parsers when entering buffer
lvim.builtin.treesitter.auto_install = true

-- lvim.builtin.treesitter.ignore_install = { "haskell" }

-- -- always installed on startup, useful for parsers without a strict filetype
-- lvim.builtin.treesitter.ensure_installed = { "comment", "markdown_inline", "regex" }

-- -- generic LSP settings <https://www.lunarvim.org/docs/languages#lsp-support>

-- --- disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---see the full default list `:lua =lvim.lsp.automatic_configuration.skipped_servers`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  {
    command = "eslint",
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

lvim.plugins = {
  { "navarasu/onedark.nvim" },
  { "benmills/vimux" },
  { "folke/trouble.nvim" },
  { "mileszs/ack.vim"},
  {
    "vim-test/vim-test",
    cmd = { "TestNearest", "TestFile", "TestSuite", "TestLast", "TestVisit" },
    keys = { "<localleader>tf", "<localleader>tn", "<localleader>ts" },
  },
  { 'jmfryan/vim-embertest' },
  { "tpope/vim-rails" },
  { 'tpope/vim-dadbod' },
  { 'kristijanhusak/vim-dadbod-ui' },
  --{ 'nvim-orgmode/orgmode' },
  { 'jceb/vim-orgmode' },
  { 'christoomey/vim-tmux-navigator' },
  { 'github/copilot.vim' },
}

require('onedark').setup {
    style = 'darker'
}
require('onedark').load()

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


vim.g.material_style = "darker"
lvim.builtin.terminal.active = true
lvim.builtin.which_key.mappings["t"] = {
  name = "test",
  t = { "<cmd>TestLast<cr>", "last" },
  f = { "<cmd>TestFile<cr>", "file" },
  n = { "<cmd>TestNearest<cr>", "nearest" },
  s = { "<cmd>TestSuite<cr>", "suite" },
}

lvim.builtin.which_key.mappings["f"] = {
  name = "find",
  f = { ":Ack! -f \"<c-r><c-w>\"<cr>", "word under cursor" },
  a = { ":Ack! -f \"<c-r><c-w>\" app<cr>", "word under cursor (/app only)" },
}

vim.opt.showtabline = 0

vim.g["test#strategy"] = "vimux"

vim.cmd [[
    let test#ruby#rspec#executable = 'pilot exec intercom bundle exec rspec -- --no-profile'
    let test#custom_runners = {'javascript': ['ember'], 'typescript': ['ember']}
]]
-- -- Autocommands (`:help autocmd`) <https://neovim.io/doc/user/autocmd.html>
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
