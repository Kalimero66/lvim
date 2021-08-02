local M = {}

M.setup = function()
	local config = require("user.plugin-configs")
	lvim.plugins = {
    { "ekalinin/Dockerfile.vim"},
		{ "tpope/vim-commentary", keys = "g" },
		{ "tpope/vim-surround", keys = { "c", "d", "y" }, },
		{ "tpope/vim-repeat", keys = { "%." }, },
		{ "tpope/vim-fugitive",
			cmd = {
				"G",
				"Git",
				"Gdiffsplit",
				"Gread",
				"Gwrite",
				"Ggrep",
				"GMove",
				"GDelete",
				"GBrowse",
				"GRemove",
				"GRename",
				"Glgrep",
				"Gedit",
			},
		},
    { "simrat39/symbols-outline.nvim", },
		{ "sindrets/diffview.nvim",
			cmd = { "DiffviewOpen", "DiffViewClose", "DiffviewToggleFiles", "DiffviewFocusFiles", "DiffviewRefresh" },
      config = config.diffview, },
    { "tamago324/lir.nvim", requires = "nvim-lua/plenary.nvim", 
      config = config.lir},
    {"kdheepak/lazygit.nvim", cmd = "LazyGit", },
    {"ojroques/vim-oscyank",
        config = function()
          vim.g.oscyank_term = 'tmux'
        end
    },
    {"ray-x/lsp_signature.nvim",
        config = function() require"lsp_signature".on_attach() end,
        event = "InsertEnter" },
    { "folke/trouble.nvim", cmd = "TroubleToggle" },
    { 'folke/todo-comments.nvim',
      requires = "nvim-lua/plenary.nvim",
      config = function() require("todo-comments").setup {} end },
	}
end

return M
