-- General settings for neovim
-- =========================================

lvim.format_on_save = true
lvim.lint_on_save = true
-- vim.cmd("set timeoutlen=1000")
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set hlsearch")
vim.cmd("set inccommand=nosplit")


-- keymappings
lvim.leader = "space"

-- lvim.keys.normal_mode["<esc><esc>"] = "<cmd>nohlsearch<cr>"
-- lvim.keys.normal_mode["Y"] = "y$"
-- lvim.keys.visual_mode["p"] = [["_dP]]

vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.list = false

lvim.builtin.dap.active = false
lvim.builtin.dashboard.active = true
lvim.builtin.bufferline.active = true
lvim.builtin.terminal.active = true
lvim.builtin.bufferline.active = true
lvim.builtin.galaxyline.active = true
lvim.builtin.gitsigns.active = true
lvim.lsp.default_keybinds = true

lvim.builtin.treesitter.ensure_installed =  {"bash", "go" ,"lua", "python", "javascript", "rust"}
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.nvimtree.auto_open = false
lvim.builtin.treesitter.highlight.additional_vim_regex_highlighting = false
lvim.builtin.treesitter.playground.enable = true
lvim.builtin.treesitter.textsubjects.enable = true
lvim.builtin.treesitter.textsubjects.keymaps[";"] = "textsubjects-big"
lvim.builtin.treesitter.textsubjects.keymaps["."] = "textsubjects-smart"

-- lvim.builtin.treesitter.indent = { enable = false }

-- plugins
-- =========================================
require("user.plugins").setup()

-- general keybindings
-- =========================================

require("user.keybindings").setup()

-- Whichkey
lvim.builtin.which_key.mappings.l.d = { "<cmd>TroubleToggle<cr>", "Diagnostics" }
lvim.builtin.which_key.mappings.l.R = { "<cmd>TroubleToggle lsp_references<cr>", "References" }
lvim.builtin.which_key.mappings.l.o = { "<cmd>SymbolsOutline<cr>", "Outline" }
lvim.builtin.which_key.mappings.T.h = { "<cmd>TSHighlightCapturesUnderCursor<cr>", "Highlight" }
lvim.builtin.which_key.mappings.T.p = { "<cmd>TSPlaygroundToggle<cr>", "Playground" }
lvim.builtin.which_key.mappings["z"] = { "<cmd>ZenMode<cr>", "Zen" }
lvim.builtin.which_key.mappings["r"] = {
  name = "Replace",
  r = { "<cmd>lua require('spectre').open()<cr>", "Replace" },
  w = { "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", "Replace Word" },
  f = { "<cmd>lua require('spectre').open_file_search()<cr>", "Replace Buffer" },
}


-- whichkey bindings
-- =========================================
-- require("user.whichkey").setup()

-- calbacks
-- require("user.callbacks").setup()

-- language

-- colorscheme
-- vim.g.onedark_style = "darker"

-- package.loaded["galaxyline"] = nil
-- lvim.lang.lua.formatters = {
-- 	{
--		exe = "stylua",
--		args = {},
--	},
--}

-- lvim.autocommands.custom_groups = {
-- 	{ "BufWinEnter", "*.lua", "lua require('user.execs').bind_lua()" },
-- }
