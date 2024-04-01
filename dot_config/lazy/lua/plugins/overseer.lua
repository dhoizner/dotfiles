return {
  {
    "stevearc/overseer.nvim",
    opts = {},
    keys = {
      { "<leader>oa", "<cmd>OverseerQuickAction<cr>", desc = "Quick Action" },
      { "<leader>ob", "<cmd>OverseerBuild<cr>", desc = "Build" },
      { "<leader>oi", "<cmd>OverseerInfo<cr>", desc = "Info" },
      {
        "<leader>ol",
        function()
          local overseer = require("overseer")
          local tasks = overseer.list_tasks({ recent_first = true })
          if vim.tbl_isempty(tasks) then
            vim.notify("No tasks found", vim.log.levels.WARN)
          else
            overseer.run_action(tasks[1], "restart")
          end
        end,
        desc = "Restart Last",
      },
      { "<leader>or", "<cmd>OverseerRun<cr>", desc = "Run" },
      { "<leader>ot", "<cmd>OverseerToggle<cr>", desc = "Toggle" },
    },
  },
}
