return {
  "gbprod/substitute.nvim",
  enabled = false,
  -- event = "VeryLazy",
  -- init = function()
  --   local function keymap(mode, lhs, rhs, opts)
  --     opts = vim.tbl_extend("keep", opts, { noremap = true, silent = true })
  --     vim.keymap.set(mode, lhs, rhs, opts)
  --   end
  --
  --   -- Substitute in normal mode
  --   keymap("n", "cx", "<Cmd>lua require('substitute.exchange').operator()<CR>", { desc = "Substitute" })
  --   keymap("n", "cxx", "<Cmd>lua require('substitute.exchange').line()<CR>", { desc = "Substitute Line" })
  --   keymap("n", "cxc", "<Cmd>lua require('substitute.exchange').cancel()<CR>", { desc = "Substitute Cancel" })
  --
  --   -- Substitute in visual block mode
  --   keymap("x", "X", "<cmd>lua require('substitute.exchange').visual()<cr>", { desc = "Substitute Exchange" })
  -- end,
  keys = {
    { "cx", "<Cmd>lua require('substitute').operator()<CR>", desc = "Substitute" },
    { "cxx", "<Cmd>lua require('substitute').line()<CR>", desc = "Substitute Line" },
    { "cxc", "<Cmd>lua require('substitute').cancel()<CR>", desc = "Substitute Cancel" },
  },
}
