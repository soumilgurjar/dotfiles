local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local navic_ok, navic = pcall(require, "nvim-navic")
if not navic_ok then
	return
end

local catppuccin_ok, catppuccin = pcall(require, "catppuccin")
if not catppuccin_ok then
	return
end

local bg_none = { bg = "NONE" }

-- Following is required to have a blended background for lualine_c and the actual buffer window
local catppuccin_config = catppuccin.options
local cp = require("catppuccin.palettes").get_palette()
local custom_catppuccin = require("lualine.themes.catppuccin")
-- local bg_cp_mantle = { bg = catppuccin_config.transparent_background and "NONE" or cp.mantle }
custom_catppuccin.normal.c.bg = catppuccin_config.transparent_background and "NONE" or cp.base

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn" },
	symbols = { error = " ", warn = " " },
	colored = true,
	update_in_insert = false,
	always_visible = true,
	color = bg_none,
}

local diff = {
	"diff",
	colored = true,
	symbols = { added = " ", modified = "柳 ", removed = " " }, -- changes diff symbols
	cond = hide_in_width,
}

local mode = {
	"mode",
	fmt = function(str)
		return "" .. str .. ""
	end,
}

local filetype = {
	"filetype",
	icons_enabled = true,
	colored = true, -- Displays filetype icon in color if set to true
	icon_only = false, -- Display only an icon for filetype
	icon = { align = "right" }, -- Display filetype icon on the right hand side
	color = bg_none,
}

local filename_winbar = {
	"filename",
	file_status = true, -- Displays file status (readonly status, modified status)
	newfile_status = true, -- Display new file status (new file means no write after created)
	path = 0, -- 0: Just the filename 1: Relative path 2: Absolute path 3: Absolute path, with tilde as the home directory
	shorting_target = 40, -- Shortens path to leave 40 spaces in the window for other components
	symbols = {
		modified = " ●", -- Text to show when the file is modified.
		readonly = " ", -- Text to show when the file is non-modifiable or readonly.
		unnamed = "[No Name]", -- Text to show for unnamed buffers.
		newfile = "  ", -- Text to show for new created file before first writing
	},
	color = bg_none,
	cond = navic.is_available,
}

local filename = {
	"filename",
	file_status = true, -- Displays file status (readonly status, modified status)
	newfile_status = true, -- Display new file status (new file means no write after created)
	path = 3, -- 0: Just the filename 1: Relative path 2: Absolute path 3: Absolute path, with tilde as the home directory
	shorting_target = 40, -- Shortens path to leave 40 spaces in the window for other components
	symbols = {
		modified = " ●", -- Text to show when the file is modified.
		readonly = " ", -- Text to show when the file is non-modifiable or readonly.
		unnamed = "[No Name]", -- Text to show for unnamed buffers.
		newfile = "  ", -- Text to show for new created file before first writing
	},
	color = bg_none,
	-- color = bg_cp_mantle,
}

local branch = {
	"branch",
	icons_enabled = true,
	icon = "",
}

local location = {
	"location",
	padding = 1,
}

local fileformat = {
	"fileformat",
	color = bg_none,
}
--[[ -- cool function for progress
local progress = function()
	local current_line = vim.fn.line(".")
	local total_lines = vim.fn.line("$")
	local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
	local line_ratio = current_line / total_lines
	local index = math.ceil(line_ratio * #chars)
	return chars[index]
end ]]

--[[ local spaces = function()
	return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end
]]

local winbar_cfg = {}
local inactive_winbar_cfg = {}
if navic_ok then
	winbar_cfg = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {
			filename_winbar,
			-- { filename_winbar, color = bg_none, cond = navic.is_available },
			{ navic.get_location, color = bg_none, cond = navic.is_available },
		},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	}
	inactive_winbar_cfg = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {
			filename_winbar,
		},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	}
end

lualine.setup({
	options = {
		icons_enabled = true,
		theme = custom_catppuccin,
		-- theme = "auto",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "alpha", "dashboard" },
		always_divide_middle = true,
		globalstatus = true,
	},
	sections = {
		lualine_a = { mode },
		lualine_b = { branch, diff },
		lualine_c = { filename },
		lualine_x = { diagnostics, filetype, fileformat },
		lualine_y = { "progress" },
		lualine_z = { location },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { { "filename", color = bg_none } },
		lualine_x = { { "location", color = bg_none } },
		lualine_y = {},
		lualine_z = {},
	},
	-- tabline = {},
	winbar = winbar_cfg,
	inactive_winbar = inactive_winbar_cfg,
	extensions = { "nvim-tree", "fugitive", "man" },
})
