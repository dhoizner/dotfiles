return {
  -- {
  --   "NeogitOrg/neogit",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-telescope/telescope.nvim",
  --   },
  --   opts = {
  --     disable_builtin_notifications = true,
  --     integrations = {
  --       telescope = true,
  --     },
  --   },
  -- },
  {
    "pwntester/octo.nvim",
    requires = {
      "nvim-lua/popup.nvim",
      "nvim-telescope/telescope.nvim",
      -- OR 'ibhagwan/fzf-lua',
      "kyazdani42/nvim-web-devicons",
    },
    config = function()
      require("octo").setup()
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      integrations = {
        neogit = true,
        octo = true,
      },
    },
  },
}
