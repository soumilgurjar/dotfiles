return {
	"ThePrimeagen/harpoon",
	enabled = true,
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("telescope").load_extension("harpoon")
	end,
	keys = {
		{ "<leader>h", desc = "+harpoon" },
		{ "<leader>hh", "<Cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", desc = "Show harpoon marks" },
		{ "<leader>hm", "<Cmd>lua require('harpoon.mark').add_file()<CR>", desc = "Mark file with harpoon" },
		{ "<leader>ha", "<Cmd>lua require('harpoon.ui').nav_file(4)<CR>", desc = "Go to harpoon mark 4" },
		{ "<leader>hs", "<Cmd>lua require('harpoon.ui').nav_file(3)<CR>", desc = "Go to harpoon mark 3" },
		{ "<leader>hd", "<Cmd>lua require('harpoon.ui').nav_file(2)<CR>", desc = "Go to harpoon mark 2" },
		{ "<leader>hf", "<Cmd>lua require('harpoon.mark').nav_file(1)<CR>", desc = "Go to harpoon mark 1" },
		{ "<leader>hn", "<Cmd>lua require('harpoon.ui').nav_next()<CR>", desc = "Go to next harpoon mark" },
		{ "<leader>hp", "<Cmd>lua require('harpoon.ui').nav_prev()<CR>", desc = "Go to previous harpoon mark" },
		{ "<leader>sf", "<Cmd>Telescope harpoon marks<CR>", desc = "Show harpoon marks in Telescope" },
	},
}
