return {
	"nvim-treesitter/nvim-treesitter",
	enabled = true,
	dependencies = {
		{
			"JoosepAlviste/nvim-ts-context-commentstring",
			event = "VeryLazy",
		},
		{
			"nvim-tree/nvim-web-devicons",
			event = "VeryLazy",
		},
		{
			"nvim-treesitter/nvim-treesitter-refactor",
			event = "VeryLazy",
		},
		{
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		{
			"nvim-treesitter/playground",
		},
		{
			"RRethy/nvim-treesitter-textsubjects",
		},
		{
			"HiPhish/nvim-ts-rainbow2",
		},
	},
	opts = {
		ensure_installed = "all", -- one of "all" or a list of languages
		ignore_install = { "" }, -- List of parsers to ignore installing
		highlight = {
			enable = true, -- false will disable the whole extension
			-- additional_vim_regex_highlighting = false, -- Catppuccin recommendation
			disable = { "latex" }, -- list of language that will be disabled; Latex recommended to be disabled for vimtex
		},
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "gnn",
				node_incremental = "grn",
				scope_incremental = "grc",
				node_decremental = "grm",
			},
		},
		autopairs = {
			enable = true,
		},
		indent = { enable = true, disable = { "" } },
		context_commentstring = {
			enable = true,
			enable_autocmd = false,
		},
		rainbow = {
			enable = true,
			disable = { "jsx" }, -- list of languages you want to disable the plugin for
			query = {
				"rainbow-parens",
				html = "rainbow-tags",
				latex = "rainbow-blocks",
			},
			strategy = require("ts-rainbow").strategy.global,
		},
		textobjects = {
			-- TODO: Check if enabled and working
			select = {
				enable = true,
				lookahead = true,
				include_surrounding_whitespace = true,
				-- iF and aF families for selecting text objects
				keymaps = {
					-- v keymaps are for key-values
					["af"] = "@function.outer",
					["if"] = "@function.inner",
					-- c keymaps are for dictionaries
					["ac"] = "@class.outer",
					["ic"] = "@class.inner",
					-- k keymaps are for comments
					["ak"] = "@comment.outer",
					["ik"] = "@comment.inner",
				},
			},
			move = {
				enable = false,
				set_jumps = true,
				-- Granular control over motions on key-values and dictionaries
				-- if you want it
				goto_next_start = {
					["]m"] = "@function.outer",
					["]]"] = "@class.outer",
				},
				goto_next_end = {
					["]M"] = "@function.outer",
					["]["] = "@class.outer",
				},
				goto_previous_start = {
					["[m"] = "@function.outer",
					["[["] = "@class.outer",
				},
				goto_previous_end = {
					["[M"] = "@function.outer",
					["[]"] = "@class.outer",
				},
			},
			swap = {
				enable = false,
				-- Swap parameters; ie. if a key-value has multiple values
				-- and you want to swap them
				swap_next = {
					[",a"] = "@parameter.inner",
				},
				swap_previous = {
					[",A"] = "@parameter.inner",
				},
			},
		},
		textsubjects = {
			-- TODO: Learn to use textsubjects and smart selection better
			-- TODO: Check if redundancy or conflict with mini.ai
			enable = true,
			prev_selection = ",", -- (Optional) keymap to select the previous selection
			keymaps = {
				["."] = "textsubjects-smart",
				[";"] = "textsubjects-container-outer",
				["i;"] = "textsubjects-container-inner",
			},
		},
		playground = {
			enable = true,
			disable = {},
			updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
			persist_queries = false, -- Whether the query persists across vim sessions
			keybindings = {
				toggle_query_editor = "o",
				toggle_hl_groups = "i",
				toggle_injected_languages = "t",
				toggle_anonymous_nodes = "a",
				toggle_language_display = "I",
				focus_language = "f",
				unfocus_language = "F",
				update = "R",
				goto_node = "<cr>",
				show_help = "?",
			},
		},
		navic = {
			enable = true,
			custom_bg = "NONE",
		},
	},
}
