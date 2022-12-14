local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

local setup = {
	plugins = {
		marks = true, -- shows a list of your marks on ' and `
		registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		spelling = {
			enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 20, -- how many suggestions should be shown in the list?
		},
		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
		-- No actual key bindings are created
		presets = {
			operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
			motions = true, -- adds help for motions
			text_objects = true, -- help for text objects triggered after entering an operator
			windows = true, -- default bindings on <c-w>
			nav = true, -- misc bindings to work with windows
			z = true, -- bindings for folds, spelling and others prefixed with z
			g = true, -- bindings for prefixed with g
		},
	},
	-- add operators that will trigger motion and text object completion
	-- to enable all native operators, set the preset / operators plugin above
	-- operators = { gc = "Comments" },
	key_labels = {
		-- override the label used to display some keys. It doesn't effect WK in any other way.
		-- For example:
		-- ["<space>"] = "SPC",
		-- ["<CR>"] = "RET",
		-- ["<tab>"] = "TAB",
	},
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "➜", -- symbol used between a key and it's label
		group = "+", -- symbol prepended to a group
	},
	popup_mappings = {
		scroll_down = "<c-b>", -- binding to scroll down inside the popup
		scroll_up = "<c-f>", -- binding to scroll up inside the popup
	},
	window = {
		border = "rounded", -- none, single, double, shadow
		position = "bottom", -- bottom, top
		margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
		padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
		winblend = 0,
	},
	layout = {
		height = { min = 4, max = 25 }, -- min and max height of the columns
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 3, -- spacing between columns
		align = "left", -- align columns left, center or right
	},
	ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
	show_help = true, -- show help message on the command line when the popup is visible
	triggers = "auto", -- automatically setup triggers
	-- triggers = {"<leader>"} -- or specify a list manually
	triggers_blacklist = {
		-- list of mode / prefixes that should never be hooked by WhichKey
		-- this is mostly relevant for key maps that start with a native binding
		-- most people should not need to change this
		i = { "j", "k" },
		v = { "j", "k" },
	},
}

local opts = {
	mode = "n", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
	["<localleader>"] = {
		-- "<Cmd>lua require('telescope').extensions.frecency.frecency({ sorter = require('telescope').extensions.fzf.native_fzf_sorter()})<CR>",
		"<Cmd>Telescope frecency<CR>",
		"Find frecent files",
	},
	--[[ ["a"] = { "<Cmd>Alpha<CR>", "Alpha" }, ]]
	--[[ ["e"] = { "<Cmd>NvimTreeToggle<CR>", "Explorer" }, ]]
	["qq"] = { "<Cmd>q!<CR>", "Quit" },
	["cc"] = { "<Cmd>Bdelete!<CR>", "Close Buffer" },
	["rr"] = { "<Cmd>Telescope reloader<CR>", "Reload file" },
	-- ["K"] = { "<Cmd>Telescope help_tags<CR>", "Telescope Help" },
	f = {
		name = "Telescope",
		c = { "<Cmd>Telescope command_history<CR>", "Command history" },
		d = {
			"<Cmd>lua require('telescope').extensions.frecency.frecency({ workspace = 'dotfiles' })<CR>",
			-- "<Cmd>lua require('telescope.builtin').find_files({search_dirs = {'~/.dotfiles/'} })<CR>",
			"Find frecent dotfiles",
		},
		f = {
			"<Cmd>Telescope find_files<CR>",
			"Find files in CWD",
		},
		-- f = {
		-- 	"<Cmd>lua require('telescope').extensions.frecency.frecency({ workspace = 'CWD' })<CR>",
		-- 	"Find files in CWD",
		-- },
		g = { "<Cmd>lua require('telescope.builtin').live_grep()<CR>", "Find text" },
		h = { "<Cmd>lua require('telescope.builtin').find_files({search_dirs = {'~/'} })<CR>", "Find files in home" },
		-- o = { "<Cmd>lua require('telescope.builtin').oldfiles()<CR>", "Find Old Files" },
		p = { "<Cmd>lua require('telescope').extensions.projects.projects()<CR>", "Projects" },
		r = { "<Cmd>lua require('telescope').extensions.file_browser.file_browser()<CR>", "File browser" },
		ss = { "<Cmd>lua require('telescope.builtin').grep_string()<CR>", "Find Text" },
		sw = { ":Telescope frecency workspace=", "Choose frecency workspace" },
		t = {
			"<Cmd>lua require('telescope').extensions.frecency.frecency({ workspace = 'thesis' })<CR>",
			"Find frecent thesis files",
		},
		v = { "<Cmd>lua require('telescope.builtin').vim_options()<CR>", "Change vim options" },
		w = {
			"<Cmd>lua require('telescope').extensions.frecency.frecency({ workspace = 'wiki' })<CR>",
			"Find frecent vimwiki",
		},
		x = {
			"<Cmd>lua require('telescope').extensions.frecency.frecency({ workspace = 'dropbox' })<CR>",
			"Find frecent dropbox",
		},
	},

	p = {
		name = "Packer",
		S = { "<Cmd>PackerStatus<CR>", "Status" },
		c = { "<Cmd>PackerCompile<CR>", "Compile" },
		i = { "<Cmd>PackerInstall<CR>", "Install" },
		s = { "<Cmd>PackerSync<CR>", "Sync" },
		sp = { "<Cmd>PackerSync --preview<CR>", "Sync with preview" },
		u = { "<Cmd>PackerUpdate<CR>", "Update" },
	},

	g = {
		name = "Git",
		R = { "<Cmd>lua require 'gitsigns'.reset_buffer()<CR>", "Reset Buffer" },
		b = { "<Cmd>Telescope git_branches<CR>", "Checkout branch" },
		c = { "<Cmd>Telescope git_commits<CR>", "Checkout commit" },
		d = { "<Cmd>Gitsigns diffthis HEAD<CR>", "Diff" },
		g = { "<Cmd>Git<CR>", "Git Fugitive" },
		j = { "<Cmd>lua require 'gitsigns'.next_hunk()<CR>", "Next Hunk" },
		k = { "<Cmd>lua require 'gitsigns'.prev_hunk()<CR>", "Prev Hunk" },
		l = { "<Cmd>lua require 'gitsigns'.blame_line()<CR>", "Blame" },
		o = { "<Cmd>Telescope git_status<CR>", "Open changed file" },
		p = { "<Cmd>lua require 'gitsigns'.preview_hunk()<CR>", "Preview Hunk" },
		r = { "<Cmd>lua require 'gitsigns'.reset_hunk()<CR>", "Reset Hunk" },
		s = { "<Cmd>lua require 'gitsigns'.stage_hunk()<CR>", "Stage Hunk" },
		u = { "<Cmd>lua require 'gitsigns'.undo_stage_hunk()<CR>", "Undo Stage Hunk" },
		z = { "<Cmd>LazyGit<CR>", "Lazygit" },
	},

	s = {
		name = "Search",
		c = { "<Cmd>Telescope commands<CR>", "Commands" },
		r = { "<Cmd>Telescope registers<CR>", "Registers" },
		C = { "<Cmd>Telescope colorscheme<CR>", "Colorscheme" },
		h = { "<Cmd>Telescope help_tags<CR>", "Find Help" },
		j = { "<Cmd>Telescope buffers<CR>", "Buffers" },
		k = { "<Cmd>Telescope keymaps<CR>", "Keymaps" },
		m = { "<Cmd>Telescope man_pages<CR>", "Man Pages" },
		p = { "]s<Cmd>Telescope spell_suggest<CR>", "Spell suggestion for next mistake" },
		s = { ":Telescope ", "Generic Telescope Command" },
	},
}

which_key.setup(setup)
which_key.register(mappings, opts)
