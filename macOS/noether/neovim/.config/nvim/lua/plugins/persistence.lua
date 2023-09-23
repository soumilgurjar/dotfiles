return {
	"folke/persistence.nvim",
	enabled = true,
	event = "BufReadPre",
	init = function()
		vim.api.nvim_create_autocmd("FileType", {
			desc = "Disable persistence session saving with gitcommit filetype",
			group = vim.api.nvim_create_augroup("persistence_disable_gitcommit", { clear = true }),
			pattern = { "gitcommit" },
			callback = function()
				require("persistence").stop()
			end,
		})
	end,
}
