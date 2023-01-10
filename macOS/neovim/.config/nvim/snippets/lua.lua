local luasnip = require("luasnip") --{{{
local s = luasnip.s --> snippet
local i = luasnip.i --> insert node
local t = luasnip.t --> text node

local d = luasnip.dynamic_node
local c = luasnip.choice_node
local f = luasnip.function_node
local sn = luasnip.snippet_node

local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

local snippets, autosnippets = {}, {} --}}}

local group = vim.api.nvim_create_augroup("Lua Snippets", { clear = true })
local file_pattern = "*.lua"

local function cs(trigger, nodes, opts) --{{{
	local snippet = s(trigger, nodes)
	local target_table = snippets

	local pattern = file_pattern
	local keymaps = {}

	if opts ~= nil then
		-- check for custom pattern
		if opts.pattern then
			pattern = opts.pattern
		end

		-- if opts is a string
		if type(opts) == "string" then
			if opts == "auto" then
				target_table = autosnippets
			else
				table.insert(keymaps, { "i", opts })
			end
		end

		-- if opts is a table
		if opts ~= nil and type(opts) == "table" then
			for _, keymap in ipairs(opts) do
				if type(keymap) == "string" then
					table.insert(keymaps, { "i", keymap })
				else
					table.insert(keymaps, keymap)
				end
			end
		end

		-- set autocmd for each keymap
		if opts ~= "auto" then
			for _, keymap in ipairs(keymaps) do
				vim.api.nvim_create_autocmd("BufEnter", {
					pattern = pattern,
					group = group,
					callback = function()
						vim.keymap.set(keymap[1], keymap[2], function()
							luasnip.snip_expand(snippet)
						end, { noremap = true, silent = true, buffer = true })
					end,
				})
			end
		end
	end

	table.insert(target_table, snippet) -- insert snippet into appropriate table
end --}}}

-- Start Refactoring --

cs("CMD", { -- [CMD] multiline vim.cmd{{{
	t({ "vim.cmd[[", "  " }),
	i(1, ""),
	t({ "", "]]" }),
}) --}}}

cs("cmd", fmt("vim.cmd[[{}]]", { i(1, "") })) -- single line vim.cmd

cs({ -- github import for packer{{{
	trig = "https://github.com/([%w-%._]+)/([%w-%._]+)!",
	regTrig = true,
	hidden = true,
}, {
	t([[use({ "]]),
	f(function(_, snip)
		return snip.captures[1]
	end),
	t("/"),
	f(function(_, snip)
		return snip.captures[2]
	end),
	t({ [[" }) -- ]] }),
	i(1, "Plugin description"),
}, "auto") --}}}

cs( -- {regexSnippet} LuaSnippet{{{
	"regexSnippet",
	fmt(
		[=[
cs( -- {}
{{ trig = "{}", regTrig = true, hidden = true }}, fmt([[ 
{}
]], {{
  {}
}}))
      ]=],
		{
			i(1, "Description"),
			i(2, ""),
			i(3, ""),
			i(4, ""),
		}
	),
	{ pattern = "*/snippets/*.lua", "<C-d>" }
) --}}}

cs( -- [luaSnippet] LuaSnippet{{{
	"luaSnippet",
	fmt(
		[=[
cs("{}", fmt( -- {}
[[
{}
]], {{
  {}
  }}){})
    ]=],
		{
			i(1, ""),
			i(2, "Description"),
			i(3, ""),
			i(4, ""),
			c(5, {
				t(""),
				fmt([[, "{}"]], { i(1, "keymap") }),
				fmt([[, {{ pattern = "{}", {} }}]], { i(1, "*/snippets/*.lua"), i(2, "keymap") }),
			}),
		}
	),
	{ pattern = "*/snippets/*.lua", "jcs" }
) --}}}

cs( -- choice_node_snippet luaSnip choice node{{{
	"choice_node_snippet",
	fmt(
		[[ 
c({}, {{ {} }}),
]],
		{
			i(1, ""),
			i(2, ""),
		}
	),
	{ pattern = "*/snippets/*.lua", "jcn" }
) --}}}

cs( -- [function] Lua function snippet{{{
	"function",
	fmt(
		[[ 
function {}({})
  {}
end
]],
		{
			i(1, ""),
			i(2, ""),
			i(3, ""),
		}
	),
	"jff"
) --}}}

cs( -- [local_function] Lua function snippet{{{
	"local_function",
	fmt(
		[[
local function {}({})
  {}
end
]],
		{
			i(1, ""),
			i(2, ""),
			i(3, ""),
		}
	),
	"jlf"
) --}}}

cs( -- [local] Lua local variable snippet{{{
	"local",
	fmt(
		[[
local {} = {}
  ]],
		{ i(1, ""), i(2, "") }
	),
	"jlv"
) --}}}

-- Soumil's snippets go here --
cs( -- [keymap_function] Keymap function{{{
	"keymap_function",
	fmt(
		[=[
local function keymap(mode, lhs, rhs, opts)
    opts = vim.tbl_extend("keep", opts, {{ noremap = true, silent = true }})
    vim.keymap.set(mode, lhs, rhs, opts)
end
  ]=],
		{}
	),
	nil
) --}}}

cs( -- [local] Keymap reference{{{
	"keymap_reference",
	fmt(
		[=[
keymap( "{}" , "{}" , "{}" , {{ desc = "{}" }} )
  ]=],
		{
			i(1, "n"),
			i(2, "lhs_key"),
			i(3, "rhs_map"),
			i(4, "description"),
		}
	),
	nil
) --}}}

cs( -- [local] Keymap reference{{{
	"pcall",
	fmt(
		[=[
local {}, {} = pcall(require, "{}")
if not {} then
	return
end

  ]=],
		{
			-- c(1, { t("status_ok"), t("status_ok_2") }),
			i(1, "status_ok"),
			i(2, "plugin"),
			i(3, "plugin_name"),
			d(4, function(args)
				return sn(nil, {
					i(1, args[1]),
				})
			end, { 1 }),
		}
	),
	nil
) --}}}

cs( -- [todo] Quick todo{{{
	"todo",
	fmt(
		[=[
-- TODO: {}
]=],
		{
			i(1, ""),
		}
	),
	nil
) --}}}

cs( -- [fix] Quick todo{{{
	"fix",
	fmt(
		[=[
-- FIX: {}
]=],
		{
			i(1, ""),
		}
	),
	nil
) --}}}

cs( -- [bug] Quick bug{{{
	"bug",
	fmt(
		[=[
-- BUG: {}
]=],
		{
			i(1, ""),
		}
	),
	nil
) --}}}

cs( -- [hack] Quick hack{{{
	"hack",
	fmt(
		[=[
-- HACK: {}
]=],
		{
			i(1, ""),
		}
	),
	nil
) --}}}

-- TODO: Add better date and time snippets
-- End Refactoring --

return snippets, autosnippets
