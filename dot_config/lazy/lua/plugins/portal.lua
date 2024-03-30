return {
  {
    "cbochs/portal.nvim",
    version = "*",
    cmd = { "Portal" },
    dependencies = { "cbochs/grapple.nvim" },
    keys = {
      { "<leader>n", "<cmd>Portal jumplist backward<cr>", desc = "jump: backward" },
      { "<leader>e", "<cmd>Portal jumplist forward<cr>", desc = "jump: forward" },
    },
    opts = {
      labels = { "n", "e", "i", "o" },
      window_options = {
        border = {
          { "┌", "Label" },
          { "─", "Label" },
          { "┐", "Label" },
          { "│", "Label" },
          { "┘", "Label" },
          { "─", "Label" },
          { "└", "Label" },
          { "│", "Label" },
        },
      },
    },
  },
}
