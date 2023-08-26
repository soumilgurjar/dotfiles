return {
	"hrsh7th/nvim-cmp",
	opts = function(_, opts)
		local luasnip = require("luasnip")
		local cmp = require("cmp")
		local has_words_before = function()
			if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
				return false
			end
			local line, col = unpack(vim.api.nvim_win_get_cursor(0))
			return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
			-- return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
		end

		opts.sources = {
			{ name = "path" },
			{ name = "nvim_lsp", keyword_length = 1 },
			{ name = "luasnip", keyword_length = 2 },
			{ name = "buffer", keyword_length = 3 },
			{ name = "copilot" }, -- For some reason this needs to be at the end in order to make sure <C-y> works.
		}

		opts.completion = {
			completeopt = "menu,menuone,noinsert,noselect", --noselect option needed to not select first item automatically
		}

		opts.mapping = vim.tbl_extend("force", opts.mapping, {
			-- Enable super-tab functionality
			["<Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() and has_words_before() then
					cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
				elseif cmp.visible() then
					cmp.select_next_item()
					-- You could replace select_next_item() with confirm({ select = true }) to get VS Code autocompletion behavior
					-- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
					-- this way you will only jump inside the snippet region
				elseif luasnip.expand_or_jumpable() then
					luasnip.expand_or_jump()
				else
					fallback()
				end
			end, { "i", "s" }),
			["<S-Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() and has_words_before() then
					cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
				elseif cmp.visible() then
					cmp.select_prev_item()
				elseif luasnip.jumpable(-1) then
					luasnip.jump(-1)
				else
					fallback()
				end
			end, { "i", "s" }),
			["<CR>"] = cmp.mapping.confirm({ select = false }), -- Does not prevent from creating new line
			["<C-y>"] = cmp.mapping.confirm({ select = true }), -- Allows autocompletion of first suggestion
			["<C-;>"] = cmp.mapping.confirm({ select = true }), -- Allows autocompletion of first suggestion
			["<Up>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
			["<Down>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
		})
	end,
}
