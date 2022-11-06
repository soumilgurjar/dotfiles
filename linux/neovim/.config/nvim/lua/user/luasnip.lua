local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
	return
end

-- local snip_status_ok_2, luasnip_types = pcall(require, "luasnip.util.types")
-- if not snip_status_ok_2 then
-- 	return
-- end

require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets/" })
-- TODO: Modify luasnip boilerplate code
vim.cmd([[command! LuaSnipEdit :lua require("luasnip.loaders.from_lua").edit_snippet_files()]]) --}}}

luasnip.config.setup({
	history = true, --keep around last snippet local to jump back
	updateevents = "TextChanged,TextChangedI", --update changes as you type
	enable_autosnippets = true,
	store_selection_keys = "<A-p>",
	-- ext_opts = {
	-- 	[luasnip_types.choiceNode] = {
	-- 		active = {
	-- 			virt_text = { { "●", "GruvboxOrange" } },
	-- 		},
	-- 	},
	-- 	[luasnip_types.insertNode] = {
	-- 		active = {
	-- 			virt_text = { { "●", "GruvboxBlue" } },
	-- 		},
	-- 	},
	-- },
})

vim.keymap.set("n", "<Leader><CR>", "<cmd>LuaSnipEdit<cr>", { silent = true })
vim.keymap.set("i", "<C-Down>", function()
	if luasnip.choice_active() then
		luasnip.change_choice(1)
	end
end, { silent = true })
vim.keymap.set("i", "<C-Up>", function()
	if luasnip.choice_active() then
		luasnip.change_choice(-1)
	end
end, { silent = true })
