return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  -- TODO: Setup keys
  opts = {},
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    wk.register(opts.defaults)
  end,
}
