log("Start plugins.lua")

require 'utils/bootstrap_packer'

return require('packer').startup(function()
	use "wbthomason/packer.nvim"
	use "phaazon/hop.nvim"

	-- Colorschemes
	use "dracula/vim"
	use "rakr/vim-one"
	use "tyrannicaltoucan/vim-deep-space"
	use "romainl/Apprentice"
	use "yorickpeterse/happy_hacking.vim"
	use "arcticicestudio/nord-vim"
	use "sainnhe/sonokai"
	use "Mangeshrex/uwu.vim"

	use {
		"Th3Whit3Wolf/onebuddy",
		requires = "tjdevries/colorbuddy.vim"
	}

	use {
		"kyazdani42/nvim-web-devicons",
	}

	use {
		"nvim-treesitter/nvim-treesitter",
		event = "BufRead",
		config = function()
			require "config/treesitter"
		end
	}

	use {
		"kabouzeid/nvim-lspinstall",
		config = function()
			require("lspinstall").setup()
		end
	}

	use {
		"onsails/lspkind-nvim",
		after = "nvim-lspinstall",
		config = function()
			require "config/lsp-kind"
		end
	}

	use {
		"neovim/nvim-lspconfig",
		config = function()
			require "config/lsp"
		end
	}

	use {
		"kyazdani42/nvim-tree.lua",
		config = function()
			require "config/nvim-tree"
		end
	}

	use {
		"nvim-telescope/telescope.nvim",
		requires = {
			{
				"nvim-telescope/telescope-media-files.nvim",
				"nvim-lua/plenary.nvim"
			},
		},
		config = function()
			require "config/telescope"
		end
	}

	use {
		"karb94/neoscroll.nvim",
		event = "WinScrolled",
		config = function()
			require("neoscroll").setup()
		end
	}

	use {
		"famiu/feline.nvim",
		after = "nvim-web-devicons",
		config = function()
			require('feline').setup()
		end
	}

	use {
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/vim-vsnip",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			--require("cmp").setup {
			--	sources = {
			--		{ name = "nvim_lsp" }
			--	}
			--}
			local settings = require("config/autocomplete")()

			require("cmp").setup(settings)
		end,
	}
	--
	--use {
	--	"glepnir/lspsaga.nvim",
	--	config = function()
	--		require("lspsaga").init_lsp_saga()
	--	end
	--}

end)
