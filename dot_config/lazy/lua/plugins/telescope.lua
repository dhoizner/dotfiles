return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "ThePrimeagen/harpoon",
      "joshmedeski/telescope-smart-goto.nvim",
      "nvim-telescope/telescope-live-grep-args.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
      {
        "danielfalk/smart-open.nvim",
        branch = "0.2.x",
        config = function() end,
        dependencies = {
          "kkharji/sqlite.lua",
          { "nvim-telescope/telescope-fzy-native.nvim" },
        },
      },
      {
        "debugloop/telescope-undo.nvim",
        keys = { { "<leader>U", "<cmd>Telescope undo<cr>" } },
        config = function()
          require("telescope").load_extension("undo")
        end,
      },
    },
    config = function(_, _)
      local telescope = require("telescope")
      telescope.load_extension("harpoon")
      telescope.load_extension("smart_goto")
      telescope.load_extension("smart_open")
      telescope.load_extension("live_grep_args")
      telescope.load_extension("fzf")

      local open_with_trouble = require("trouble.sources.telescope").open

      -- Use this to add more results without clearing the trouble list
      local add_to_trouble = require("trouble.sources.telescope").add

      telescope.setup({
        defaults = {
          mappings = {
            i = {
              ["<c-t>"] = open_with_trouble,
              ["<c-a>"] = add_to_trouble,
            },
            n = {
              ["<c-t>"] = open_with_trouble,
              ["<c-a>"] = add_to_trouble,
            },
          },
        },
      })
    end,
  },
}
