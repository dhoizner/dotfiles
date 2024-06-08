return {
  {
    "neovim/nvim-lspconfig",
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      keys[#keys + 1] = {
        "K",
        function()
          print("hello")
          local winid = require("ufo").peekFoldedLinesUnderCursor()
          if not winid then
            vim.lsp.buf.hover()
          end
        end,
        { desc = "Peek fold under cursor or open LSP hover" },
      }
      -- -- peek fold under cursor or open LSP hover
      -- vim.keymap.set("n", "K", function()
      --   local winid = require("ufo").peekFoldedLinesUnderCursor()
      --   if not winid then
      --     vim.lsp.buf.hover()
      --   end
      -- end)
    end,
  },
}
