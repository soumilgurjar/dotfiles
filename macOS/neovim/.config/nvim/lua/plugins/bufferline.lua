return {
  "akinsho/bufferline.nvim",
  enabled = true,
  opts = {
    options = {
      numbers = "ordinal", -- | "none" | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
      -- highlights = require("catppuccin.groups.integrations.bufferline").get({
      --   custom = {
      --     machiatto = {
      --       background = { bg = require("catppuccin.palettes").get_palette().base },
      --     },
      --   },
      -- }),
    },
  },
}
