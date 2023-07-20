return {
	"folke/persistence.nvim",
	enabled = true,
	event = "BufReadPre",
	opts = { options = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp" } },
    -- stylua: ignore
    keys = {
        { "<leader>qs", function() require("persistence").load() end, desc = "Restore Session" },
        { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
        { "<leader>qd", function() require("persistence").stop() end, desc = "Don't Save Current Session" },
    },
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
