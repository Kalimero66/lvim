local M = {}

M.setup = function()
	local config = require("user.plugin-configs")
	lvim.plugins = {
    -- Debug Adapter
    { "leoluz/nvim-dap-go" ,
      requires = { "mfussenegger/nvim-dap" },
      disable = not lvim.builtin.dap.active,
      config = function()
        require("dap-go").setup()
      end,
    },
    { "rcarriga/nvim-dap-ui",
      requires = {"mfussenegger/nvim-dap"} ,
      ft = { "python", "rust", "go" },
      event = "BufReadPost",
      requires = { "mfussenegger/nvim-dap" },
      disable = not lvim.builtin.dap.active,
      config = function()
        require("dapui").setup()
      end
    },
    {"simrat39/symbols-outline.nvim",
      setup = function()
        require("user.symbols-outline").config()
      end,
      event = "BufReadPost",
    },
    {
      "simrat39/rust-tools.nvim",
      config = function()
        require("user.rust-tools").config()
      end,
      ft = { "rust", "rs" },
    },
    {
      "RishabhRD/nvim-cheat.sh",
      requires = "RishabhRD/popfix",
      config = function()
        vim.g.cheat_default_window_layout = "vertical_split"
      end,
      opt = true,
      cmd = { "Cheat", "CheatWithoutComments", "CheatList", "CheatListWithoutComments" },
      keys = "<leader>?",
      -- disable = not lvim.builtin.cheat.active,
    },
    -- =====================================================================
    { "f-person/git-blame.nvim",
      config = function()
        vim.g.gitblame_enabled = true
        vim.g.gitblame_message_template = "<summary> • <date> • <author>"
        vim.g.gitblame_highlight_group = "LineNr"
      end,
    },
    -- Replace  Globally
    {
      "windwp/nvim-spectre",
      event = "BufRead",
      config = function()
        require("user.spectre").config()
      end,
    },
    {  -- jump
      "ggandor/lightspeed.nvim",
      config = function()
        require("user.lightspeed").config()
      end,
      -- disable = lvim.builtin.motion_provider ~= "lightspeed",
    },
    {"kdheepak/lazygit.nvim", cmd = "LazyGit", },
    {"ojroques/vim-oscyank",
        config = function()
          vim.g.oscyank_term = 'tmux'
        end
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
      setup = function()
        vim.g.indent_blankline_char = "▏"
      end,
      config = function()
        require("user.indent-blankline").config()
      end,
      event = "BufRead",
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
    {"kdheepak/lazygit.nvim", cmd = "LazyGit", },
		{ "sindrets/diffview.nvim",
			cmd = { "DiffviewOpen", "DiffViewClose", "DiffviewToggleFiles", "DiffviewFocusFiles", "DiffviewRefresh" },
      config = config.diffview, },
    { "tamago324/lir.nvim", requires = "nvim-lua/plenary.nvim",
      config = config.lir},
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
    },
    {
      'ntpeters/vim-better-whitespace',
        config = function()
          vim.g.better_whitespace_enabled = 1
          vim.g.strip_whitespace_on_save = 1
        end,
    }
	}
end

return M
