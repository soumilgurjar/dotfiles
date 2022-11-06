-- local colorscheme = "gruvbox"
local colorscheme = "catppuccin"

if colorscheme == "gruvbox" then
	require(colorscheme).setup({
		-- Overrides needed so that gitsigns does not have weird background in signcolumn
		overrides = {
			SignColumn = { bg = "NONE" },
			GruvboxGreenSign = { bg = "NONE" },
			GruvboxAquaSign = { bg = "NONE" },
			GruvboxRedSign = { bg = "NONE" },
		},
	})
end

if colorscheme == "catppuccin" then
	require(colorscheme).setup({
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
			cmp = true,
			gitsigns = true,
			leap = true,
			lsp_saga = true,
			lsp_trouble = true,
			markdown = true,
			mason = true,
			notify = true,
			nvimtree = true,
			telescope = true,
			treesitter = true,
			treesitter_context = true,
			ts_rainbow = true,
			vimwiki = true,
			which_key = false,
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
					errors = { "underline" },
					hints = { "underline" },
					warnings = { "underline" },
					information = { "underline" },
				},
			},
			navic = {
				enabled = true,
				custom_bg = "NONE",
			},
		},
	})
end

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	print("Colorscheme " .. colorscheme .. " not found")
	return
end
