local status_ok, todo = pcall(require, "todo-comments")
if not status_ok then
	return
end

local function keymap(mode, lhs, rhs, opts)
	opts = vim.tbl_extend("keep", opts, { silent = true })
	vim.keymap.set(mode, lhs, rhs, opts)
end

todo.setup({
	signs = true, -- show icons in the signs column
	keywords = {
		FIX = {
			icon = " ", -- icon used for the sign, and in search results
			color = "error", -- can be a hex color, or a named color (see below)
			alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
			-- signs = false, -- configure signs for some keywords individually
		},
		TODO = { icon = " ", color = "info" },
		HACK = { icon = " ", color = "warning" },
		WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
		PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
		NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
		TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
	},
	highlight = {
		before = "empty", -- "fg" or "bg" or empty
		keyword = "empty", -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
		after = "empty", -- "fg" or "bg" or empty
		pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlightng (vim regex)
		comments_only = true, -- uses treesitter to match keywords in comments only
		max_line_len = 400, -- ignore lines longer than this
		exclude = {}, -- list of file types to exclude highlighting
	},
})

keymap("n", "<leader>xt", "<cmd>TodoTrouble<cr>", { desc = "To-do Trouble" })
keymap("n", "]t", function()
	todo.jump_next()
end, { desc = "Next todo comment" })
keymap("n", "[t", function()
	todo.jump_prev()
end, { desc = "Previous todo comment" })
