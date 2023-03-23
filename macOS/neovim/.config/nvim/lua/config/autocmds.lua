-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local keymap = vim.keymap.set
local opts = { buffer = true, silent = true }

-- Need to set this here as it gets overwritten when set with vim.opt
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  desc = "No continuation of comments on next line",
  callback = function()
    vim.cmd("set formatoptions-=cro")
    vim.cmd("setlocal keywordprg=:help")
  end,
})

vim.api.nvim_create_autocmd({ "VimResized" }, {
  desc = "Equal window sizes",
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})

vim.api.nvim_create_autocmd({ "CmdWinEnter" }, {
  desc = "Quits immediately after entering Command-line Window",
  callback = function()
    vim.cmd("quit")
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  desc = "Wrap and spell on for prose filetypes",
  pattern = { "text" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spelllang = "en_gb,de_ch" -- Set spell language to English and German
    -- vim.opt_local.spell = true
    keymap({ "n", "v" }, "j", "gj", opts)
    keymap({ "n", "v" }, "k", "gk", opts)
    keymap({ "n" }, "<Right>", "g$", opts)
    keymap({ "n" }, "<Left>", "g^", opts)
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  desc = "Wrap and spell on for tex filetypes",
  pattern = { "markdown", "tex" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spelllang = "en_gb,de_ch" -- Set spell language to English and German
    -- vim.opt_local.spell = true
    keymap({ "n", "v" }, "j", "gj", opts)
    keymap({ "n", "v" }, "k", "gk", opts)
    keymap({ "n" }, "<Right>", "g$", opts)
    keymap({ "n" }, "<Left>", "g^", opts)
  end,
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  desc = "Refresh codelens on saving java files",
  pattern = { "*.java" },
  callback = function()
    vim.lsp.codelens.refresh()
  end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  desc = "Auto filetype detect for gitlab and github configs",
  pattern = { "*.gitconfig-*" },
  callback = function()
    vim.opt_local.filetype = "gitconfig"
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  desc = "No tab expansion for devicetree filetypes",
  pattern = { "devicetree" },
  callback = function()
    vim.opt_local.wrap = false
    vim.opt_local.expandtab = false
  end,
})
