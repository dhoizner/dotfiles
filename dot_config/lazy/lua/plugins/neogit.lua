return {
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
    },
    cmd = "Neogit",
    opts = {
      signs = {
        hunk = { "", "" },
        item = { "", "" },
        section = { "", "" },
      },
      integrations = {
        diffview = true,
      },
    },
    keys = {
      { "<leader>gc", "<cmd>lua require('neogit').open({'commit'})<CR>", desc = "Git commit" },
      { "<leader>gg", "<cmd>lua require('neogit').open()<CR>", desc = "Git commit" },
    },
  },
  {
    "pwntester/octo.nvim",
    cmd = "Octo",
    requires = {
      "nvim-lua/popup.nvim",
      "nvim-telescope/telescope.nvim",
      -- OR 'ibhagwan/fzf-lua',
      "kyazdani42/nvim-web-devicons",
    },
    config = function()
      require("octo").setup({
        enable_builtin = true,
        mappings = {
          review_diff = {
            select_next_entry = { lhs = "<Tab>", desc = "move to previous changed file" },
            select_prev_entry = { lhs = "<S-Tab>", desc = "move to next changed file" },
          },
        },
      })
      vim.treesitter.language.register("markdown", "octo")
    end,
    keys = {
      { "<leader>o", "<cmd>Octo<cr>", desc = "Octo" },
    },
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
  -- {
  --   "lewis6991/gitsigns.nvim",
  --   event = "BufReadPre",
  --   opts = function()
  --     --- @type Gitsigns.Config
  --     local C = {
  --       signs = {
  --         add = { text = "" },
  --         change = { text = "" },
  --         delete = { text = "" },
  --         topdelete = { text = "" },
  --         changedelete = { text = "" },
  --         untracked = { text = "" },
  --       },
  --       on_attach = function(buffer)
  --         local gs = package.loaded.gitsigns
  --
  --         local function map(mode, l, r, desc)
  --           vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
  --         end
  --
  --         map({ "n", "v" }, "<leader>gx", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
  --         map({ "n", "v" }, "<leader>gs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
  --         map("n", "<leader>gS", gs.stage_buffer, "Stage Buffer")
  --         map("n", "<leader>gh", gs.preview_hunk, "Preview Hunk")
  --         map("n", "<leader>gu", gs.undo_stage_hunk, "Undo Stage Hunk")
  --         map("n", "<leader>gX", gs.reset_buffer, "Reset Buffer")
  --         map("n", "<leader>gp", gs.preview_hunk, "Preview Hunk")
  --         map("n", "<leader>gb", function()
  --           gs.blame_line({ full = true })
  --         end, "Blame Line")
  --         map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
  --       end,
  --     }
  --     return C
  --   end,
  --   keys = {
  --     -- git hunk navigation - previous / next
  --     { "gh", ":Gitsigns next_hunk<CR>", desc = "Goto next git hunk" },
  --     { "gH", ":Gitsigns prev_hunk<CR>", desc = "Goto previous git hunk" },
  --     { "]g", ":Gitsigns next_hunk<CR>", desc = "Goto next git hunk" },
  --     { "[g", ":Gitsigns prev_hunk<CR>", desc = "Goto previous git hunk" },
  --   },
  -- },
}
