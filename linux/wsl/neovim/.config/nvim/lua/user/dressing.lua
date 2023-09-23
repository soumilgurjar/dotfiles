local status_ok, dressing = pcall(require, "dressing")
if not status_ok then
	return
end

dressing.setup({
	input = {
		-- Set to false to disable the vim.ui.input implementation
		enabled = true,

		-- Can be 'left', 'right', or 'center'
		prompt_align = "center",

		-- When true, <Esc> will close the modal
		insert_only = false,

		-- Set to `false` to disable
		mappings = {
			n = {
				["<Esc>"] = "Close",
				["<CR>"] = "Confirm",
				["<C-c>"] = "Close",
			},
			i = {
				["<C-c>"] = "Close",
				["<CR>"] = "Confirm",
				["<Up>"] = "HistoryPrev",
				["<Down>"] = "HistoryNext",
			},
		},
	},
})
