return {
  {
    "echasnovski/mini.nvim",
    version = false,
    config = function()
      require("mini.pick").setup()
    end,
  },
  {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html",
    dependencies = {
      "ibhagwan/fzf-lua",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    opts = {
      ---@type lc.lang
      lang = "golang",
    },
  },
}
