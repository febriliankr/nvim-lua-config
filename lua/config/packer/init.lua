-- bootstraping
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
end

require("packer").startup(function()
	-- package manager
	use("wbthomason/packer.nvim")

	-- Scope NVIM to the opened project
	use({
		"ahmedkhalf/project.nvim",
		config = function()
			require("project_nvim").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})

	-- colorscheme
	use({
		"folke/tokyonight.nvim",
		config = [[require("config.interface.colorscheme")]],
	})

	-- statusline
	use({
		"feline-nvim/feline.nvim",
		config = [[require("config.interface.statusline")()]],
		event = "VimEnter",
	})

	-- bufferline
	use({
		"noib3/nvim-cokeline",
		config = [[require("config.interface.bufferline")()]],
	})

	-- git signs
	use({
		"lewis6991/gitsigns.nvim",
		config = [[require("config.editor.gitsigns")()]],
	})

	-- indentline
	use({
		"lukas-reineke/indent-blankline.nvim",
		config = [[require("config.interface.indentline")()]],
		event = "BufRead",
	})

	-- file manager
	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		requires = "MunifTanjim/nui.nvim",
		config = [[require("config.interface.filemanager")()]],
		after = "nui.nvim",
	})

	-- fuzzy finder
	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			"nvim-telescope/telescope-ui-select.nvim",
		},
		config = [[require("config.interface.telescope")()]],
	})

	-- improve experience (lol)
	use({
		"nvim-treesitter/nvim-treesitter",
		requires = "p00f/nvim-ts-rainbow",
		config = [[require("config.interface.treesitter")()]],
	})
	use({
		"windwp/nvim-autopairs",
		config = [[require("config.completion.autopairs")()]],
	})

	-- comment
	use({ "preservim/nerdcommenter" })

	-- language server
	-- use({
	-- 	"williamboman/mason.nvim",
	-- 	cmd = { "Mason", "MasonInstall", "MasonUninstall" },
	-- 	config = [[require("config.lsp.installer")]],
	-- })
	-- use({
	-- 	"neovim/nvim-lspconfig",
	-- 	requires = {
	-- 		"jose-elias-alvarez/null-ls.nvim",
	-- 		"hrsh7th/cmp-nvim-lsp",
	-- 	},
	-- 	config = [[require("config.lsp")()]],
	-- })
	-- use({
	-- 	"folke/trouble.nvim",
	-- 	config = [[require("config.lsp.trouble")]],
	-- 	after = "nvim-lspconfig",
	-- })

	-- completion
	-- use({
	-- 	"hrsh7th/nvim-cmp",
	-- 	requires = {
	-- 		"hrsh7th/cmp-buffer",
	-- 		"hrsh7th/cmp-nvim-lua",
	-- 		"hrsh7th/cmp-path",
	-- 	},
	-- 	config = [[require("config.completion.cmp")()]],
	-- 	after = "nvim-autopairs",
	-- })

	-- snippet
	-- use({
	-- 	"saadparwaiz1/cmp_luasnip",
	-- 	requires = "L3MON4D3/LuaSnip",
	-- 	config = [[require("config.completion.snippet")()]],
	-- })

	-- golang
	-- use({
	-- 	"ray-x/go.nvim",
	-- 	ft = "go",
	-- 	config = [[require("config.languages.go")()]],
	-- })

	-- completion
	use({
		"neoclide/coc.nvim",
		branch = "release",
		config = [[require("config.completion.coc")()]],
	})

	--  stelve
	-- use("leafOfTree/vim-svelte-plugin")

	-- easymotion (Vim motions on speed!)
	-- use("easymotion/vim-easymotion")

	-- run async shell command
	use("skywind3000/asyncrun.vim")

	-- multi cursor
	-- use("mg979/vim-visual-multi")

	-- fix cursor hold
	-- use("antoinemadec/FixCursorHold.nvim")

	-- improve syntax hightlight on typescript
	-- use("HerringtonDarkholme/yats.vim")

	--dependencies
	use("kyazdani42/nvim-web-devicons")
	use("nvim-lua/popup.nvim")
	use("nvim-lua/plenary.nvim")
end)
