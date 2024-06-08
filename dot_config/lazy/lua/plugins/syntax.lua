return {
  {
    "NoahTheDuke/vim-just",
    ft = { "just" },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "graphql",
        "http",
        "hurl",
        "json",
        "lua",
        "xml",
        "sql",
      },
    },
  },
}
