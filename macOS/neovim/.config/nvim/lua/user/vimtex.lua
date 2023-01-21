vim.g.vimtex_quickfix_autoclose_after_keystrokes = 1
vim.g.vimtex_quickfix_open_on_warning = 1
vim.g.vimtex_syntax_conceal_disable = 1
vim.g.vimtex_fold_enabled = 1
vim.g.vimtex_fold_manual = 1
-- vim.g.vimtex_syntax_conceal = { math_bounds = 0 }
-- vim.cmd([[    let g:vimtex_syntax_custom_cmds = [
--     \ {'name': 'textcite', 'conceal': v:true},
--     \ {'name': 'autocite', 'conceal': v:true},
--     \]
--  ]])
-- vim.g.vimtex_syntax_custom_cmds = { { name = "textcite", conceal = "v:true" }, { name = "autocite", conceal = "v:true" } }
vim.g.vimtex_compiler_latexmk = { build_dir = "build" }
-- vim.g.vimtex_view_method = "zathura"

-- Need to run 'xattr -d com.apple.quarantine /Applications/sioyek.app' for permissions
-- Or install with 'brew install --cask --no-quarantine sioyek'
vim.g.vimtex_view_method = "sioyek"
-- vim.g.vimtex_view_sioyek_exe = "/Applications/sioyek.app/Contents/MacOS/sioyek"

-- vim.g.tex_flavor = "latex" -- Default tex file format
-- vim.g.vimtex_view_method = "skim" -- Choose which program to use to view PDF file
-- vim.g.vimtex_view_skim_sync = 1 -- Value 1 allows forward search after every successful compilation
-- vim.g.vimtex_view_skim_activate = 1 -- Value 1 allows change focus to skim after command `:VimtexView` is given

-- FastFold settings
-- vim.g.fastfold_savehook = 1
-- vim.g.fastfold_fold_command_suffixes = { "x", "X", "a", "A", "o", "O", "c", "C" }
-- vim.g.fastfold_fold_movement_commands = { "]z", "[z", "zj", "zk" }
-- vim.g.tex_fold_enabled = 1
-- vim.cmd([[autocmd FileType tex setlocal foldmethod=expr]])

local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

-- Navigate buffers
keymap("n", "<localleader>;", "<Cmd>VimtexCompileSS<CR>", opts)
keymap("n", "<localleader>l;", "<Cmd>VimtexStop<CR>", opts)
