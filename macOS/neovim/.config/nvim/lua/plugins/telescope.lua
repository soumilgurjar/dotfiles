return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "ahmedkhalf/project.nvim",
    "nvim-lua/plenary.nvim",
    {
      "tsakirist/telescope-lazy.nvim",
      config = function()
        require("telescope").load_extension("lazy")
      end,
    },
    {
      "nvim-telescope/telescope-github.nvim",
      config = function()
        require("telescope").load_extension("gh")
      end,
    },
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
    {
      "benfowler/telescope-luasnip.nvim",
      config = function()
        require("telescope").load_extension("luasnip")
      end,
    },
    {
      "princejoogie/dir-telescope.nvim",
      config = function()
        require("telescope").load_extension("dir")
      end,
      keys = {
        { "<leader>fs", "<Cmd>Telescope dir find_files<CR>", desc = "Find Files in Dir" },
      },
    },
    {
      "nvim-telescope/telescope-file-browser.nvim",
      config = function()
        require("telescope").load_extension("file_browser")
      end,
      keys = {
        { "<leader>fd", "<Cmd>Telescope file_browser<CR>", desc = "File Browser" },
      },
    },
  },
  opts = {
    defaults = {
      prompt_prefix = " ",
      mappings = {
        n = {
          ["|"] = function(...)
            return require("telescope.actions.layout").toggle_preview(...)
          end,
          ["l"] = require("telescope.actions").select_default,
        },
      },
    },
  },
  -- config = function()
  --   require("telescope").load_extension("luasnip")
  -- end,
}
