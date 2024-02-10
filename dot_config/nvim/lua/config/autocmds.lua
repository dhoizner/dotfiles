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

vim.api.nvim_create_autocmd("BufEnter", {
  desc = "relic",
  group = group,
  pattern = "*/dactyl/keymap.c",
  callback = function()
    require("qmk").setup({
      name = "LAYOUT_split_3x5_2",
      layout = {
        "x x x x x _ _ _ x x x x x",
        "x x x x x _ _ _ x x x x x",
        "x x x x x _ _ _ x x x x x",
        "_ _ _ x x _ _ _ x x _ _ _",
      },
    })
  end,
})

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { "*tmux.conf" },
  command = "execute 'silent !tmux source <afile> --silent'",
})

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { "config.fish" },
  command = "execute 'silent !source <afile> --silent'",
})

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { ".yabairc" },
  command = "!yabai --restart-service",
})

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { ".skhdrc" },
  command = "!brew services restart skhd",
})

-- vim.api.nvim_create_autocmd({ "BufNewFile", "BufFilePre", "BufRead" }, {
--   pattern = { "bubu" },
--   callback = function()
--     vim.cmd([[set filetype=javascript]])
--   end,
-- })

vim.api.nvim_create_autocmd({ "BufNewFile", "BufFilePre", "BufRead" }, {
  pattern = { "*.mdx", "*.md" },
  callback = function()
    vim.cmd([[set filetype=markdown wrap linebreak nolist nospell]])
  end,
})

vim.api.nvim_create_autocmd({ "BufRead" }, {
  pattern = { "*.conf" },
  callback = function()
    vim.cmd([[set filetype=sh]])
  end,
})
