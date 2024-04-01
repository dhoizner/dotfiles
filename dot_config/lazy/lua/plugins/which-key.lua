return {
  {
    "folke/which-key.nvim",
    enabled = false,
    opts = {
      defaults = {
        ["gp"] = { name = "+peek" },
        ["<leader>r"] = { name = "+rest" },
      },
    },
  },
  {
    "echasnovski/mini.clue",
    config = function()
      local miniclue = require("mini.clue")
      miniclue.setup({
        triggers = {
          -- Leader triggers
          { mode = "n", keys = "<Leader>" },
          { mode = "x", keys = "<Leader>" },
          -- Built-in completion
          { mode = "i", keys = "<C-x>" },

          -- Marks
          { mode = "n", keys = "'" },
          { mode = "n", keys = "`" },
          { mode = "x", keys = "'" },
          { mode = "x", keys = "`" },

          -- Registers
          { mode = "n", keys = '"' },
          { mode = "x", keys = '"' },
          { mode = "i", keys = "<C-r>" },
          { mode = "c", keys = "<C-r>" },

          -- Window commands
          { mode = "n", keys = "<C-w>" },
          --
          -- Completion commands
          { mode = "n", keys = "<C-x>" },

          -- `g` key
          { mode = "n", keys = "g" },
          { mode = "x", keys = "g" },

          -- `z` key
          { mode = "n", keys = "z" },
          { mode = "x", keys = "z" },
          { mode = "n", keys = "\\" },
          { mode = "x", keys = "\\" },

          { mode = "n", keys = "]" },
          { mode = "x", keys = "]" },
        },

        clues = {
          miniclue.gen_clues.g(),
          miniclue.gen_clues.builtin_completion(),
          miniclue.gen_clues.marks(),
          miniclue.gen_clues.registers(),
          miniclue.gen_clues.windows(),
          miniclue.gen_clues.z(),
          { mode = "n", keys = "<Leader>b", desc = "[B]uffer" },
          { mode = "n", keys = "<Leader>c", desc = "[C]ode" },
          { mode = "n", keys = "<Leader>d", desc = "[D]ebug" },
          { mode = "n", keys = "<Leader>f", desc = "[F]iles" },
          { mode = "n", keys = "<Leader>g", desc = "[G]it" },
          { mode = "n", keys = "<Leader>o", desc = "[O]verseer" },
          { mode = "n", keys = "<Leader>q", desc = "Session" },
          { mode = "n", keys = "<Leader>r", desc = "[R]est" },
          { mode = "n", keys = "<Leader>s", desc = "[S]earch" },
          { mode = "n", keys = "<Leader>t", desc = "[T]est" },
          { mode = "n", keys = "<Leader>u", desc = "[U]I" },
          { mode = "n", keys = "<Leader>w", desc = "[W]indow" },
          { mode = "n", keys = "<Leader>x", desc = "Trouble" },
          { mode = "n", keys = "<Leader><tab>", desc = "[T]ab" },
          { mode = "n", keys = "gp", desc = "[P]eek" },
        },
        window = {
          delay = 300,
          -- config = { width = "auto" },
        },
      })
    end,
  },
}
