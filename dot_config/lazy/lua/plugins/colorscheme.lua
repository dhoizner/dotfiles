return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      flavour = "frappe", -- latte, frappe, macchiato, mocha
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
      -- colorscheme = "flow",
      -- colorscheme = "tokyonight",
      -- colorscheme = "cyberdream",
      colorscheme = "rose-pine",
      -- colorscheme = "catppuccin",
      -- colorscheme = "oxocarbon",
      -- background = "light",
    },
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      background_colour = "#000000",
    },
  },
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = false,
      theme = {
        variant = "auto",
      },
    },
  },
  {
    "tokyonight.nvim",
    opts = function()
      return {
        -- style = "day",
        -- light_style = "moon",
        -- transparent = true,
        -- styles = {
        --   sidebars = "transparent",
        --   floats = "transparent",
        -- },
        on_highlights = function(hl, c)
          -- hl.Normal = "Foo"
          do
            return
          end
          local prompt = "#2d3149"
          hl.TelescopeNormal = { bg = c.bg_dark, fg = c.fg }
          hl.TelescopeBorder = { bg = c.bg_dark, fg = c.bg_dark }
          hl.TelescopePromptNormal = { bg = prompt }
          hl.TelescopePromptBorder = { bg = prompt, fg = prompt }
          hl.TelescopePromptTitle = { bg = c.fg_gutter, fg = c.orange }
          hl.TelescopePreviewTitle = { bg = c.bg_dark, fg = c.bg_dark }
          hl.TelescopeResultsTitle = { bg = c.bg_dark, fg = c.bg_dark }
        end,
      }
    end,
  },
  {
    "0xstepit/flow.nvim",
    name = "Flow",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      require("flow").setup({
        transparent = false,
        fluo_color = "pink", -- pink, yellow, orange, green
        mode = "normal", -- normal, dark, bright - dark is ugly
        aggressive_spell = false,
      })
    end,
  },
  { "rose-pine/neovim", name = "rose-pine" },
}
