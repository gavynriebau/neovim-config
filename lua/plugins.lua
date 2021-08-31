log("Start plugins.lua")

require 'utils/bootstrap_packer'

return require('packer').startup(function()
	use "wbthomason/packer.nvim"
	use {
		"chriskempson/base16-vim",
		config = function()
			require "colors"
		end
	}

	use {
		"kyazdani42/nvim-web-devicons",
		after = "base16-vim"
	}

	use {
		"nvim-treesitter/nvim-treesitter",
		event = "BufRead"
	}

	use {
		"kabouzeid/nvim-lspinstall",
		event = "BufRead"
	}

	use {
		"neovim/nvim-lspconfig",
		after = "nvim-lspinstall",
		config = function()
			require "config/lsp"
		end
	}

	use {
		"onsails/lspkind-nvim",
		event = "BufEnter"
	}

	use "phaazon/hop.nvim"
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
				"nvim-lua/plenary.nvim",
				"nvim-lua/popup.nvim"
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

end)
