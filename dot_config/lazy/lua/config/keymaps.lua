-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>wv", "<C-W>v", { desc = "Split window down", remap = true })
vim.keymap.set("n", "<leader>ws", "<C-W>s", { desc = "Split window right", remap = true })
vim.keymap.set("n", "<leader>wh", "<C-W>h", { desc = "Switch window left", remap = true })
vim.keymap.set("n", "<leader>wj", "<C-W>j", { desc = "Switch window down", remap = true })
vim.keymap.set("n", "<leader>wk", "<C-W>k", { desc = "Switch window up", remap = true })
vim.keymap.set("n", "<leader>wl", "<C-W>l", { desc = "Switch window right", remap = true })

vim.keymap.set("n", "U", "<C-r>", { remap = true })

vim.keymap.set("n", "<leader>gg", ":Neogit<cr>", { desc = "Open Neogit" })

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

vim.keymap.set("n", "<leader>ub", function()
  local cat = require("catppuccin")
  cat.options.transparent_background = not cat.options.transparent_background
  cat.compile()
  vim.cmd.colorscheme(vim.g.colors_name)
end, { desc = "Toggle transpaent background" })

-- smart-splits recommended mappings
-- resizing splits
-- these keymaps will also accept a range,
-- for example `10<A-h>` will `resize_left` by `(10 * config.default_amount)`
vim.keymap.set("n", "<A-h>", require("smart-splits").resize_left)
vim.keymap.set("n", "<A-j>", require("smart-splits").resize_down)
vim.keymap.set("n", "<A-k>", require("smart-splits").resize_up)
vim.keymap.set("n", "<A-l>", require("smart-splits").resize_right)
-- moving between splits
vim.keymap.set("n", "<C-h>", require("smart-splits").move_cursor_left)
vim.keymap.set("n", "<C-j>", require("smart-splits").move_cursor_down)
vim.keymap.set("n", "<C-k>", require("smart-splits").move_cursor_up)
vim.keymap.set("n", "<C-l>", require("smart-splits").move_cursor_right)
-- swapping buffers between windows
vim.keymap.set("n", "<leader><leader>h", require("smart-splits").swap_buf_left)
vim.keymap.set("n", "<leader><leader>j", require("smart-splits").swap_buf_down)
vim.keymap.set("n", "<leader><leader>k", require("smart-splits").swap_buf_up)
vim.keymap.set("n", "<leader><leader>l", require("smart-splits").swap_buf_right)

vim.keymap.set("n", "<leader>rr", "<cmd>Rest run<cr>", { desc = "Run request under the cursor" })
vim.keymap.set("n", "<leader>rl", "<cmd>Rest run last<cr>", { desc = "Re-run latest request" })
vim.keymap.set("n", "<leader>re", "<cmd>Telescope rest select_env<cr>", { desc = "Select rest.nvim environment" })
