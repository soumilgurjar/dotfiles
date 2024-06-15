return {
	"HiPhish/nvim-ts-rainbow2",
	event = "VeryLazy", -- Needed due to some error in disabled filetypes e.g cpp
}, {
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
			config = function()
				-- Disable class keymaps in diff mode
				vim.api.nvim_create_autocmd("BufReadPost", {
					callback = function(event)
						if vim.wo.diff then
							for _, key in ipairs({ "[c", "]c", "[C", "]C" }) do
								pcall(vim.keymap.del, "n", key, { buffer = event.buf })
							end
						end
					end,
				})
			end,
		},
		{
			"nvim-treesitter/playground",
		},
		{
			"RRethy/nvim-treesitter-textsubjects",
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
			disable = { "jsx", "cpp" }, -- list of languages you want to disable the plugin for
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
					-- You can use the capture groups defined in textobjects.scm
					["a="] = { query = "@assignment.outer", desc = "Select outer part of an assignment" },
					["i="] = { query = "@assignment.inner", desc = "Select inner part of an assignment" },
					["l="] = { query = "@assignment.lhs", desc = "Select left hand side of an assignment" },
					["r="] = { query = "@assignment.rhs", desc = "Select right hand side of an assignment" },

					["aa"] = { query = "@parameter.outer", desc = "Select outer part of a parameter/argument" },
					["ia"] = { query = "@parameter.inner", desc = "Select inner part of a parameter/argument" },

					["ai"] = { query = "@conditional.outer", desc = "Select outer part of a conditional" },
					["ii"] = { query = "@conditional.inner", desc = "Select inner part of a conditional" },

					["ao"] = { query = "@loop.outer", desc = "Select outer part of a loop" },
					["io"] = { query = "@loop.inner", desc = "Select inner part of a loop" },

					-- ["af"] = { query = "@call.outer", desc = "Select outer part of a function call" },
					-- ["if"] = { query = "@call.inner", desc = "Select inner part of a function call" },

					["af"] = { query = "@function.outer", desc = "Select outer part of a method/function definition" },
					["if"] = { query = "@function.inner", desc = "Select inner part of a method/function definition" },

					["ac"] = { query = "@class.outer", desc = "Select outer part of a class" },
					["ic"] = { query = "@class.inner", desc = "Select inner part of a class" },

					["ak"] = { query = "@comment.outer", desc = "Select outer part of a comment" },
					["ik"] = { query = "@comment.inner", desc = "Select inner part of a comment" },

					["az"] = { query = "@code_cell.outer", desc = "around block" },
					["iz"] = { query = "@code_cell.inner", desc = "in block" },
				},
			},
			move = {
				enable = true,
				set_jumps = true,
				-- Granular control over motions on key-values and dictionaries
				goto_next_start = {
					["]f"] = "@function.outer",
					["]]"] = "@class.outer",
					["]z"] = { query = "@code_cell.inner", desc = "next code block" },
				},
				goto_next_end = {
					["]F"] = "@function.outer",
					["]["] = "@class.outer",
				},
				goto_previous_start = {
					["[f"] = "@function.outer",
					["[["] = "@class.outer",
					["[z"] = { query = "@code_cell.inner", desc = "previous code block" },
				},
				goto_previous_end = {
					["[f"] = "@function.outer",
					["[]"] = "@class.outer",
				},
			},
			swap = {
				enable = true,
				-- Swap parameters; ie. if a key-value has multiple values
				-- and you want to swap them
				swap_next = {
					[",a"] = "@parameter.inner",
					["<leader>sbl"] = "@code_cell.outer",
				},
				swap_previous = {
					[",A"] = "@parameter.inner",
					["<leader>sbh"] = "@code_cell.outer",
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
				goto_node = "<CR>",
				show_help = "?",
			},
		},
		navic = {
			enable = true,
			custom_bg = "NONE",
		},
	},
}
