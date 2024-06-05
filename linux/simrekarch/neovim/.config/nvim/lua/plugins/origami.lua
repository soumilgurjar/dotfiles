return {
    "chrisgrieser/nvim-origami",
    event = "BufReadPost", -- later or on keypress would prevent saving folds
    enabled = false,
    opts = true,        -- needed even when using default config
}
