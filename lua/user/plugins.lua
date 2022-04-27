local M = {}

M.setup = function()
	local config = require("user.plugin-configs")
	lvim.plugins = {
    { "leoluz/nvim-dap-go" ,
      config = function()
        require("dap-go").setup()
      end,
    },
    { "rcarriga/nvim-dap-ui", 
      requires = {"mfussenegger/nvim-dap"} ,
      config = function()
        require("dapui").setup()
      end,
    },
    { "f-person/git-blame.nvim",
      config = function()
        vim.g.gitblame_enabled = true
        vim.g.gitblame_message_template = "<summary> • <date> • <author>"
        vim.g.gitblame_highlight_group = "LineNr"
      end,
    },
    {
      "windwp/nvim-spectre",
      event = "BufRead",
      config = function()
        require("user.spectre").config()
      end,
    },
    {
      "folke/zen-mode.nvim",
      config = function()
        require("user.zen").config()
      end,
    },
    {
      "monaqa/dial.nvim",
      event = "BufRead",
      config = function()
        require("user.dial").config()
      end,
    },
    {
      "lukas-reineke/indent-blankline.nvim",
      -- event = "BufReadPre",
      config = function()
        require "user.blankline"
      end,
    },
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
    {'filipdutescu/renamer.nvim',
      config = function()
        require("user.renamer").config()
      end,
      branch = "master",
    },
    {
      "MattesGroeger/vim-bookmarks",
        config = function()
        -- highlight BookmarkSign ctermbg=NONE ctermfg=160
        -- highlight BookmarkLine ctermbg=194 ctermfg=NONE
        vim.g.bookmark_sign = ""
        vim.g.bookmark_annotation_sign = '☰'
        vim.g.bookmark_no_default_key_mappings = 1
        vim.g.bookmark_auto_save = 0
        vim.g.bookmark_auto_close = 0
        vim.g.bookmark_manage_per_buffer = 0
        vim.g.bookmark_save_per_working_dir = 0
        -- vim.g.bookmark_highlight_lines = 1
        vim.g.bookmark_show_warning = 0
        vim.g.bookmark_center = 1
        vim.g.bookmark_location_list = 0
        vim.g.bookmark_disable_ctrlp = 1
        vim.g.bookmark_display_annotation = 0
        -- vim.g.bookmark_auto_save_file = '~/.config/lvim/bookmarks'
        end,
        commit = "a86f6387a5dabf0102b4cab433b414a29456f792"
    },
    {
      'tom-anders/telescope-vim-bookmarks.nvim'
    }
	}
end

return M
