return {
	"jalvesaq/Nvim-R",
	enabled = true,
	-- event = "VeryLazy",
	ft = { "R", "r" }, -- Only load plugin for these filetypes
	config = function()
		vim.cmd([[let R_assign = 0]]) -- This prevents auto substituion of _ to <-
	end,
}
