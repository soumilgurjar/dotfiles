local group = vim.api.nvim_create_augroup("ZMK", {})

vim.api.nvim_create_autocmd("BufEnter", {
	desc = "Format Swweeep keymap",
	group = group,
	pattern = "*swweeep.keymap", -- this is a pattern to match the filepath of whatever board you wish to target
	callback = function()
		require("qmk").setup({
			name = "Layout_Sweep",
			auto_format_pattern = "*swweeep.keymap",
			layout = {
				"x x x x x _ _ x x x x x",
				"x x x x x _ _ x x x x x",
				"x x x x x _ _ x x x x x",
				"_ _ _ x x x x x x _ _ _",
			},
			variant = "zmk",
		})
	end,
})

vim.api.nvim_create_autocmd("BufEnter", {
	desc = "Format Lily58 keymap",
	group = group,
	pattern = "*lily58.keymap", -- this is a pattern to match the filepath of whatever board you wish to target
	callback = function()
		require("qmk").setup({
			name = "Layout_Lily58",
			auto_format_pattern = "*lily58.keymap",
			layout = {
				"x x x x x x _ _ x x x x x x",
				"x x x x x x _ _ x x x x x x",
				"x x x x x x _ _ x x x x x x",
				"x x x x x x x x x x x x x x",
				"_ _ _ x x x x x x x x _ _ _",
			},
			variant = "zmk",
		})
	end,
})

return {
	"codethread/qmk.nvim",
	enabled = true,
	event = "VeryLazy",
	config = function(_, opts)
		require("qmk").setup(opts)
	end,
	opts = {
		name = "Layout_Sweep",
		layout = {
			"x x x x x _ _ x x x x x",
			"x x x x x _ _ x x x x x",
			"x x x x x _ _ x x x x x",
			"_ _ _ x x x x x x _ _ _",
		},
		variant = "zmk",
	},
}
