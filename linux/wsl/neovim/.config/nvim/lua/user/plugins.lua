local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	pattern = { "plugins.lua" },
	callback = function()
		vim.cmd("source <afile> | PackerInstall") -- Auto sync on save
		-- vim.cmd("source <afile> | PackerSync") -- Auto sync on save
		-- vim.cmd("source <afile>") -- No auto sync on save
	end,
})

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
	git = {
		clone_timeout = 300, -- Timeout, in seconds, for git clones
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here

	use({ "wbthomason/packer.nvim" }) -- Have packer manage itself
	use({ "nvim-lua/plenary.nvim" }) -- Useful lua functions used by lots of plugins
	use({ "Shatur/neovim-session-manager", requires = { "nvim-lua/plenary.nvim" } }) -- Helps autosave neovim sessions
	use({ "kyazdani42/nvim-tree.lua", requires = { "kyazdani42/nvim-web-devicons" } }) -- File tree
	use({ "ahmedkhalf/project.nvim" }) -- Auto-changes CWD based on .git, .vimroot markers
	use({ "lewis6991/impatient.nvim" }) -- Better neovim startup time
	use({ "ggandor/leap.nvim", requires = { "tpope/vim-repeat" } }) -- Better motions without being too intrusive
	use({ "ggandor/flit.nvim" }) -- Better f/t motions without being too intrusive
	use({ "folke/which-key.nvim" }) -- Popup for showing possible keymaps relevant to current state
	use({ "karb94/neoscroll.nvim" }) -- Smooth scroll
	use({ "famiu/bufdelete.nvim" }) -- Keep window layout after closing buffers
	use({ "goolord/alpha-nvim" }) -- Start screen for neovim
	use({ "akinsho/toggleterm.nvim" }) -- Terminal inside neovim that can be triggered with <C-\>
	use({ "edluffy/hologram.nvim" }) -- Inline image viewer
	use({ "ja-ford/delaytrain.nvim" }) -- Delay repeat execution of certain keys
	use({ "folke/lsp-colors.nvim" }) -- Add colors if missing for LSP symbols
	use({ "folke/trouble.nvim" }) -- Better looking lists for many things
	use({ "folke/todo-comments.nvim" }) -- Highlight and Navigate To-dos
	use({ "lewis6991/hover.nvim" }) -- Context aware hover

	-- Colorschemes
	use({ "catppuccin/nvim", as = "catppuccin" }) -- Catpuccin theme
	use({ "ellisonleao/gruvbox.nvim" }) -- Gruvbox plugin in lua

	-- Appearance
	use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons" } }) -- Tab line with buffernames and mouse interaction (should be loaded after catppuccin)
	use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } }) -- Status line with useful information
	use({ "stevearc/dressing.nvim" }) -- Better UI for input
	use({ "SmiteshP/nvim-navic" }) -- Show code context in winbar
	-- use({ "rcarriga/nvim-notify" }) -- Notification UI

	-- cmp plugins
	use({ "hrsh7th/nvim-cmp" }) -- The completion plugin
	use({ "hrsh7th/cmp-buffer" }) -- buffer completions
	use({ "hrsh7th/cmp-cmdline" }) -- commandline completions
	use({ "hrsh7th/cmp-path" }) -- path completions
	use({ "saadparwaiz1/cmp_luasnip" }) -- snippet completions
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-nvim-lsp-signature-help" }) -- Source for displaying function signatures
	use({ "hrsh7th/cmp-nvim-lsp-document-symbol" }) -- Customise / search by nvim-cmp
	use({ "hrsh7th/cmp-nvim-lua" })
	use({ "hrsh7th/cmp-omni" }) -- path completions

	-- snippets
	use({ "L3MON4D3/LuaSnip" }) --snippet engine
	use({ "rafamadriz/friendly-snippets" }) -- a bunch of snippets to use
	use({ "shlemiel/telescope-luasnip.nvim" }) -- Telescope extension for searching snippets

	-- LSP
	use({ "williamboman/mason.nvim" }) -- Upgrade from nvim-lsp-installer; simple to use language server installer
	use({ "williamboman/mason-lspconfig.nvim" }) -- Upgrade from nvim-lsp-installer; simple to use language server installer
	use({ "neovim/nvim-lspconfig" }) -- enable LSP
	use({ "jose-elias-alvarez/null-ls.nvim" }) -- for formatters and linters
	use({ "jayp0521/mason-null-ls.nvim" }) -- Easy Null-ls server installer
	use({ "p00f/clangd_extensions.nvim" }) -- C++ LSP settings
	use({ "glepnir/lspsaga.nvim" }) -- Better UI for LSP-related stuff

	-- DAP
	-- use({ "mfussenegger/nvim-dap" })
	-- use({ "rcarriga/nvim-dap-ui" })
	-- use({ "ravenxrz/DAPInstall.nvim" })

	-- Telescope
	use({ "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } }) -- Fuzzy file finder and other modules
	use({ "nvim-telescope/telescope-packer.nvim", requires = { "nvim-lua/plenary.nvim" } }) -- Packer integration for telescope
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- Make telescope fuzzy finding faster and provide fzf mappings
	use({ "nvim-telescope/telescope-frecency.nvim", requires = { "kkharji/sqlite.lua" } }) -- Access Most FRecent Files
	use({ "nvim-telescope/telescope-file-browser.nvim" }) -- Fuzzy file browser
	use({ "nvim-telescope/telescope-github.nvim" }) -- Integration with Github CLI
	use({ "princejoogie/dir-telescope.nvim" })

	-- Commenting
	use({ "numToStr/Comment.nvim" }) -- Commenting as lines or blocks
	use({ "JoosepAlviste/nvim-ts-context-commentstring" }) -- Get comment string from treesitter

	-- Code writing utilities
	use({ "windwp/nvim-autopairs" }) -- Autopairs, integrates with both cmp and treesitter
	use({ "lukas-reineke/indent-blankline.nvim" }) -- Shows indent for easier code formatting
	use({ "p00f/nvim-ts-rainbow", requires = { "nvim-treesitter/nvim-treesitter" } }) -- Colorful brackets
	use({ "kylechui/nvim-surround" }) -- Easier modification of surrounding characters
	use({ "gbprod/substitute.nvim" }) -- Exchange words with cx,X
	use({ "kevinhwang91/nvim-hlslens" }) -- Shows better search highlights and occurences
	use({ "norcalli/nvim-colorizer.lua" }) -- Shows Colors within buffer with :ColorizerToggle
	use({ "michaeljsmith/vim-indent-object" }) -- Vimscript Plugin; Change if possible

	-- Text Objects
	use({ "nvim-treesitter/nvim-treesitter-textobjects", requires = { "nvim-treesitter/nvim-treesitter" } })
	use({ "RRethy/nvim-treesitter-textsubjects", requires = { "nvim-treesitter/nvim-treesitter" } })

	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }) -- Parsing Library
	use({ "nvim-treesitter/playground" }) -- Show treesitter information with :TSPlaygroundToggle

	-- Git
	use({ "tpope/vim-fugitive" }) -- Vimscript Plugin; Git plugin for easier commit and push from within vim
	use({ "kdheepak/lazygit.nvim" }) -- Lazygit plugin for neovim
	use({ "lewis6991/gitsigns.nvim" }) -- Shows signs to indicate modifications from last commit
	use({ "TimUntersberger/neogit" }) -- Git integration for neovim
	use({ "pwntester/octo.nvim" }) -- Edit and review Github issues and pull requests

	-- Vimwiki
	use({ "vimwiki/vimwiki", branch = "dev" }) -- Vimscript Plugin; Change if possible
	use({ "tools-life/taskwiki" }) -- Vimscript Plugin; Need to provide python virtualenv path with packages installed; See vimwiki;

	-- Vimtex
	use({ "lervag/vimtex" }) -- Vimscript Plugin; Compile latex from inside neovim

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
