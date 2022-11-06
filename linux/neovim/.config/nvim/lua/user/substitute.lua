local status_ok, substitute = pcall(require, "substitute")
if not status_ok then
	return
end

substitute.setup({})

local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

-- Substitute in normal mode
keymap("n", "cx", "<cmd>lua require('substitute.exchange').operator()<cr>", opts)
keymap("n", "cxx", "<cmd>lua require('substitute.exchange').line()<cr>", opts)
keymap("n", "cxc", "<cmd>lua require('substitute.exchange').cancel()<cr>", opts)

-- Substitute in visual block mode
keymap("x", "X", "<cmd>lua require('substitute.exchange').visual()<cr>", opts)
