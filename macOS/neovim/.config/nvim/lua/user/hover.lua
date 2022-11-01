local status_ok, hover = pcall(require, "hover")
if not status_ok then
	return
end

hover.setup({
	init = function()
		-- Require providers
		require("hover.providers.lsp")
		require("hover.providers.gh")
		require("hover.providers.man")
		require("hover.providers.dictionary")
	end,
	preview_opts = {
		border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
		-- border = rounded,
	},
	-- Whether the contents of a currently open hover window should be moved
	-- to a :h preview-window when pressing the hover keymap.
	preview_window = true,
	title = true,
	-- TODO: Wait for easy switch option for hover sources
})

-- Setup keymaps
vim.keymap.set("n", "K", require("hover").hover, { desc = "hover.nvim" })
vim.keymap.set("n", "gK", require("hover").hover_select, { desc = "hover.nvim (select)" })
