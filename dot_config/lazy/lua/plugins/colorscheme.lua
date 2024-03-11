return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      background = {
        -- :h background
        light = "latte",
        dark = "mocha",
      },
      transparent_background = true,
      custom_highlights = function(cp)
        return {
          LineNr = { fg = cp.lavender },
          PmenuSel = { bg = cp.mantle, fg = cp.green },
          PmenuSbar = { bg = cp.lavender }, -- Popup menu: scrollbar.
          PmenuThumb = { bg = cp.lavender }, -- Popup menu: scrollbar.
          Visual = { bg = cp.surface2, style = { "bold" } },
          Whitespace = { fg = cp.red }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
          CursorLineNr = { fg = cp.green },
          WinSeparator = { fg = cp.blue },
          TelescopeNormal = {
            bg = cp.transparent_background,
          },
          TelescopeSelection = {
            style = { "italic" },
            bg = cp.mantle,
            fg = cp.green,
          },
          TelescopePromptNormal = {
            bg = cp.transparent_background,
          },
          TelescopeSelectionCaret = {
            fg = cp.green,
          },
        }
      end,
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        fidget = true,
        markdown = true,
        mason = true,
        dap = {
          enabled = true,
          enabled_ui = true,
        },
        indent_blankline = {
          enabled = true,
          colored_indent_levels = true,
        },
        which_key = true,
        noice = true,
        notify = true,
        window_picker = true,
      },
    },
  },
  {
    "nyoom-engineering/oxocarbon.nvim",
  },
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "catppuccin",
      colorscheme = "oxocarbon",
      background = "dark",
    },
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      background_colour = "#000000",
    },
  },
}
