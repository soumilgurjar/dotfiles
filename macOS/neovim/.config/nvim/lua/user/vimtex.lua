vim.g.vimtex_quickfix_autoclose_after_keystrokes = 1
vim.g.vimtex_quickfix_open_on_warning = 1
vim.g.vimtex_compiler_latexmk = { build_dir = "build" }
-- vim.g.vimtex_view_method = "zathura"

-- Need to run 'xattr -d com.apple.quarantine /Applications/sioyek.app' for permissions
-- Or install with 'brew install --cask --no-quarantine sioyek'
vim.g.vimtex_view_method = "sioyek"
vim.g.vimtex_view_sioyek_exe = "/Applications/sioyek.app/Contents/MacOS/sioyek"

-- vim.g.tex_flavor = "latex" -- Default tex file format
-- vim.g.vimtex_view_method = "skim" -- Choose which program to use to view PDF file
-- vim.g.vimtex_view_skim_sync = 1 -- Value 1 allows forward search after every successful compilation
-- vim.g.vimtex_view_skim_activate = 1 -- Value 1 allows change focus to skim after command `:VimtexView` is given
