return {
  {
    "NoahTheDuke/vim-just",
    ft = { "just" },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "http",
        "hurl",
      },
    },
  },
}
