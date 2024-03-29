return {
	"catppuccin/nvim",
	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	enabled = true,
	priority = 1000, -- make sure to load this before all the other start plugins
	name = "catppuccin",
	opts = {
		flavour = "macchiato", -- latte, frappe, macchiato, mocha
		background = { -- :h background
			light = "latte",
			dark = "macchiato",
		},
		compile_path = vim.fn.stdpath("cache") .. "/catppuccin",
		transparent_background = false,
		term_colors = true,
		dim_inactive = {
			enabled = false,
			shade = "dark",
			percentage = 0.15,
		},
		styles = {
			comments = { "italic" },
			conditionals = { "italic" },
			loops = {},
			functions = {},
			keywords = {},
			strings = {},
			variables = {},
			numbers = {},
			booleans = {},
			properties = {},
			types = {},
			operators = {},
		},
		-- color_overrides = { macchiato = { mantle = "" } },
		color_overrides = {},
		custom_highlights = {},
		integrations = {
			leap = true,
			lsp_saga = true,
			markdown = true,
			neogit = true,
			octo = true,
			treesitter_context = true,
			ts_rainbow = true,
			vimwiki = true,
			which_key = true,
			dap = { -- You NEED to override nvim-dap's default highlight groups, AFTER requiring nvim-dap; see git page
				enabled = false,
				enable_ui = false,
			},
			indent_blankline = {
				enabled = true,
				colored_indent_levels = true,
			},
			native_lsp = {
				enabled = true,
				virtual_text = {
					errors = { "italic" },
					hints = { "italic" },
					warnings = { "italic" },
					information = { "italic" },
				},
				underlines = {
					errors = { "undercurl" },
					hints = { "undercurl" },
					warnings = { "undercurl" },
					information = { "undercurl" },
				},
			},
			navic = {
				enabled = true,
				custom_bg = "NONE",
			},
		},
	},
}
