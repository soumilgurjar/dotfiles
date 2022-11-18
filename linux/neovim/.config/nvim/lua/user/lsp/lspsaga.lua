local keymap = vim.keymap.set
local status_ok, saga = pcall(require, "lspsaga")
if not status_ok then
	return
end

saga.init_lsp_saga({
	border_style = "rounded",
	diagnostic_header = { " ", " ", " ", "" },
	code_action_lightbulb = {
		enable = false,
	},
	symbol_in_winbar = {
		in_custom = false,
		in_enable = false,
		enable = false,
		separator = " > ",
		show_file = false,
		file_formatter = "",
		-- click_support = function(node, clicks, button, modifiers)
		--  -- To see all avaiable details: vim.pretty_print(node)
		--  local st = node.range.start
		--  local en = node.range["end"]
		--  if button == "l" then
		--      if clicks == 2 then
		--      -- double left click to do nothing
		--      else -- jump to node's starting line+char
		--          vim.fn.cursor(st.line + 1, st.character + 1)
		--      end
		--  elseif button == "r" then
		--      if modifiers == "s" then
		--          print("lspsaga") -- shift right click to print "lspsaga"
		--      end -- jump to node's ending line+char
		--      vim.fn.cursor(en.line + 1, en.character + 1)
		--  elseif button == "m" then
		--      -- middle click to visual select node
		--      vim.fn.cursor(st.line + 1, st.character + 1)
		--      vim.cmd("normal v")
		--      vim.fn.cursor(en.line + 1, en.character + 1)
		--  end
		-- end,
	},
})

-- Make background match colorscheme background
vim.cmd("highlight LspFloatWinNormal guibg=NONE")

-- Lsp finder find the symbol definition implement reference
-- if there is no implement it will hide
-- when you use action in finder like open vsplit then you can
-- use <C-t> to jump back
keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })

-- Code action
keymap({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })

-- Peek Definition
-- you can edit the definition file in this flaotwindow
-- also support open/vsplit/etc operation check definition_action_keys
-- support tagstack C-t jump back
keymap("n", "gd", "<cmd>Lspsaga peek_definition<CR>", { silent = true })

-- -- Show line diagnostics
-- keymap("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })

-- Show cursor diagnostic
keymap("n", "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { silent = true })

-- Diagnsotic jump can use `<c-o>` to jump back
keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })
keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })

-- Only jump to error
keymap("n", "[E", function()
	require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })
keymap("n", "]E", function()
	require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })

-- Outline
keymap("n", "<leader>ot", "<cmd>LSoutlineToggle<CR>", { silent = true })

-- Hover Doc
keymap("n", "<leader>K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })
