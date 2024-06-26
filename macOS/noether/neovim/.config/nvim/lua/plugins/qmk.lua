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

vim.api.nvim_create_autocmd("BufEnter", {
	desc = "Format Sofle keymap",
	group = group,
	pattern = "*sofle.keymap", -- this is a pattern to match the filepath of whatever board you wish to target
	callback = function()
		require("qmk").setup({
			name = "Layout_Sofle",
			auto_format_pattern = "*sofle.keymap",
			layout = {
				"x x x x x x _ _ x x x x x x",
				"x x x x x x _ _ x x x x x x",
				"x x x x x x _ _ x x x x x x",
				"x x x x x x x x x x x x x x",
				"_ _ x x x x x x x x x x _ _",
			},
			variant = "zmk",
		})
	end,
})

vim.api.nvim_create_autocmd("BufEnter", {
	desc = "Format Corax56 keymap",
	group = group,
	pattern = "*corax56.keymap", -- this is a pattern to match the filepath of whatever board you wish to target
	callback = function()
		require("qmk").setup({
			name = "Layout_Corax56",
			auto_format_pattern = "*corax56.keymap",
			layout = {
				"_ _ x x x x x _ _ x x x x x _ _",
				"_ x x x x x x _ _ x x x x x x _",
				"x x x x x x x _ _ x x x x x x x",
				"_ x x x x x x x x x x x x x x _",
				"_ _ _ _ x x x x x x x x _ _ _ _",
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
