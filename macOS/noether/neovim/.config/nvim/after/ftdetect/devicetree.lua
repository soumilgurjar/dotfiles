vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	group = vim.api.nvim_create_augroup("devicetree set filetype", { clear = true }),
	pattern = { "*.keymap" },
	callback = function()
		vim.cmd("set filetype=dts")
	end,
})
