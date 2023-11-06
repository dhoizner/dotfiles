-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local group = vim.api.nvim_create_augroup("MyQMK", {})

vim.api.nvim_create_autocmd("BufEnter", {
  desc = "relic",
  group = group,
  pattern = "*/relic/keymap.c",
  callback = function()
    require("qmk").setup({
      name = "LAYOUT_split_4space",
      layout = {
        "x x x x x _ _ _ x x x x x x",
        "x x x x x _ _ _ x x x x x^x",
        "x^x x x x x _ _ _ x x x x x",
        "_ _ x x x x^x x^x x x x _ _",
      },
    })
  end,
})
