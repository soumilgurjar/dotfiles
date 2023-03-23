-- Plugins to Add or Configure
-- TODO: Reformat with 4 space; Add enable switch to all manually configured plugins
-- TODO: Change vim-illuminate highlight delaytrain
-- TODO: Fix devicetree syntax highlighting using treesitter instead of after
-- TODO: Fix issue with persistence keeping extra files
-- TODO: Learn all mini plugins better
-- TODO: Set Illuminate plugin options
return {
  --   { "Shatur/neovim-session-manager", dependencies = { "nvim-lua/plenary.nvim" } }, -- Helps autosave neovim sessions
  --   { "lewis6991/impatient.nvim" }, -- Better neovim startup time
  --   { "ggandor/leap-spooky.nvim" }, -- Leap for remote operations on text objects
  --   { "karb94/neoscroll.nvim" }, -- Smooth scroll
  --   { "ja-ford/delaytrain.nvim" }, -- Delay repeat execution of certain keys
  --   { "lewis6991/hover.nvim" }, -- Context aware hover
  { "norcalli/nvim-colorizer.lua" }, -- Shows Colors within buffer with :ColorizerToggle
  { "HiPhish/nvim-ts-rainbow2" },
}
