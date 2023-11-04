-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.del("n", "<leader>w-")
vim.keymap.del("n", "<leader>w|")
vim.keymap.del("n", "<leader>-")
vim.keymap.del("n", "<leader>|")

vim.keymap.set("n", "<leader>wv", "<C-W>v", { desc = "Split window down", remap = true })
vim.keymap.set("n", "<leader>ws", "<C-W>s", { desc = "Split window right", remap = true })

vim.keymap.set("n", "gpd", function()
  require("goto-preview").goto_preview_definition({})
end, { desc = "Peek definition" })
vim.keymap.set("n", "gpt", function()
  require("goto-preview").goto_preview_type_definition({})
end, { desc = "Peek type definition" })
vim.keymap.set("n", "gpi", function()
  require("goto-preview").goto_preview_implementation({})
end, { desc = "Peek implementation" })
vim.keymap.set("n", "gpD", function()
  require("goto-preview").goto_preview_declaration({})
end, { desc = "Peek declaration" })
vim.keymap.set("n", "gpr", function()
  require("goto-preview").goto_preview_references()
end, { desc = "Peek references" })
vim.keymap.set("n", "gP", function()
  require("goto-preview").close_all_win()
end, { desc = "Close peek windows" })
