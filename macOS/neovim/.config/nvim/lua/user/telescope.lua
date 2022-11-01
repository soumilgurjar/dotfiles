local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

local actions = require("telescope.actions")
local action_layout = require("telescope.actions.layout")
local trouble = require("trouble.providers.telescope")
local home = os.getenv("HOME")
-- local action_generate = require("telescope.actions.generate")

--[[ local path_opts = {
    prompt_title = "~ Insert file path ~",
    shorten_path = false,
    -- cwd = "path2search",
    attach_mappings = function(_, map)
        map("i", "<CR>", function(prompt_bufnr)
            -- filename is available at entry[1]
            local entry = require("telescope.actions.state").get_selected_entry()
            require("telescope.actions").close(prompt_bufnr)
            local filename = entry[1]
            -- Insert filename in current cursor position
            vim.cmd('normal i' .. filename)
        end
        )
        return true
    end,
} ]]

telescope.setup({
	defaults = {

		layout_strategy = "horizontal",
		layout_config = {
			prompt_position = "top",
			horizontal = {
				height = 0.9,
				preview_cutoff = 100,
				prompt_position = "top",
				width = 0.9,
				preview_width = 0.5,
			},
			vertical = {
				height = 0.9,
				preview_cutoff = 20,
				prompt_position = "top",
				width = 0.9,
			},
		},
		sorting_strategy = "ascending",
		prompt_prefix = "  ",
		selection_caret = " ",
		-- path_display = { shorten = { len = 6, exclude = { 1, 2, -1, -2 } }, "truncate" },
		-- path_display = { "smart" },
		path_display = { "truncate" },
		dynamic_preview_title = true,

		mappings = {
			i = {
				["<C-n>"] = actions.cycle_history_next,
				["<C-p>"] = actions.cycle_history_prev,

				["<C-c>"] = actions.close,

				["<Down>"] = actions.move_selection_next,
				["<Up>"] = actions.move_selection_previous,

				["<CR>"] = actions.select_default,
				["<C-x>"] = actions.select_horizontal,
				["<C-v>"] = actions.select_vertical,
				-- ["<C-t>"] = actions.select_tab,

				["<PageUp>"] = actions.preview_scrolling_up,
				["<PageDown>"] = actions.preview_scrolling_down,

				["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
				["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
				["<C-q>"] = trouble.open_with_trouble,
				-- ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
				["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
				["<C-l>"] = actions.complete_tag,

				["<C-t>"] = trouble.open_with_trouble,
				["?"] = actions.which_key,
				["|"] = action_layout.toggle_preview,
			},

			n = {
				["<esc>"] = actions.close,
				["q"] = actions.close,
				["<CR>"] = actions.select_default,
				["<C-x>"] = actions.select_horizontal,
				["<C-v>"] = actions.select_vertical,
				["<C-t>"] = actions.select_tab,

				["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
				["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
				["<C-q>"] = trouble.open_with_trouble,
				-- ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
				["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

				["j"] = actions.move_selection_next,
				["k"] = actions.move_selection_previous,
				["l"] = actions.select_default,
				["H"] = actions.move_to_top,
				["M"] = actions.move_to_middle,
				["L"] = actions.move_to_bottom,
				["s"] = actions.toggle_selection,

				["<Down>"] = actions.move_selection_next,
				["<Up>"] = actions.move_selection_previous,

				["<PageUp>"] = actions.preview_scrolling_up,
				["<PageDown>"] = actions.preview_scrolling_down,

				["?"] = actions.which_key, -- keys from pressing <C-/>
				["|"] = action_layout.toggle_preview,
			},
		},
	},
	pickers = {

		-- Default configuration for builtin pickers goes here:
		-- picker_name = {
		--   picker_config_key = value,
		--   ...
		-- }
		-- Now the picker_config_key will be applied every time you call this
		-- builtin picker
	},
	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		},
		frecency = {
			db_root = vim.fn.stdpath("data"),
			show_scores = false,
			show_unindexed = true,
			ignore_patterns = { "*.git/*", "*.github/*", "*/tmp/*" },
			disable_devicons = false,
			show_filter_column = { "LSP", "CWD" },
			workspaces = {
				["config"] = home .. "/.config",
				["dotfiles"] = home .. "/.dotfiles",
				["dropbox"] = home .. "/Dropbox",
				["home"] = home .. "/",
				["packer"] = home .. "/.local/share/nvim/site/pack/packer/start/",
				["repos"] = home .. "/Github_Repositories",
				["thesis"] = home .. "/Github_Repositories/Overleaf/DoctoralThesis-Overleaf/",
				["wiki"] = home .. "/Dropbox/Apps/vimwiki",
			},
		},
		file_browser = {
			hijack_netrw = true,
			cwd_to_path = true,
			mappings = {
				["i"] = {
					-- your custom insert mode mappings
				},
				["n"] = {
					-- your custom normal mode mappings
					["<esc>"] = actions.close,
					["q"] = actions.close,
					["<CR>"] = actions.select_default,
					["l"] = actions.select_default,
					["?"] = actions.which_key, -- keys from pressing <C-/>
				},
			},
		},
	},
})

-- load_extension, somewhere after setup function:
telescope.load_extension("fzf")
telescope.load_extension("frecency")
telescope.load_extension("projects")
telescope.load_extension("packer")
telescope.load_extension("file_browser")
telescope.load_extension("lazygit")
telescope.load_extension("luasnip")
telescope.load_extension("gh")
telescope.load_extension("dir")
-- telescope.load_extension("noice")
-- telescope.load_extension("notify")
