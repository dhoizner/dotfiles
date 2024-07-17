require("lspconfig")

return {
  { "justinsgithub/wezterm-types", lazy = true },
  { "luaCATS/luassert", name = "luassert-types", lazy = true },
  {
    "folke/lazydev.nvim",
    opts = function(_, opts)
      opts.debug = true
      vim.list_extend(opts.library, {
        { path = "wezterm-types", mods = { "wezterm" } },
        { path = "luassert-types/library", words = { "assert" } },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      diagnostics = { virtual_text = { prefix = "icons" } },
      capabilities = {
        workspace = {
          didChangeWatchedFiles = {
            dynamicRegistration = false,
          },
        },
      },
      ---@type lspconfig.options
      servers = {
        lua_ls = {
          settings = {
            Lua = {
              misc = {
                -- parameters = { "--loglevel=trace" },
              },
              -- hover = { expandAlias = false },
              type = {
                castNumberToInteger = true,
              },
              diagnostics = {
                disable = { "incomplete-signature-doc", "trailing-space" },
                -- enable = false,
                groupSeverity = {
                  strong = "Warning",
                  strict = "Warning",
                },
                groupFileStatus = {
                  ["ambiguity"] = "Opened",
                  ["await"] = "Opened",
                  ["codestyle"] = "None",
                  ["duplicate"] = "Opened",
                  ["global"] = "Opened",
                  ["luadoc"] = "Opened",
                  ["redefined"] = "Opened",
                  ["strict"] = "Opened",
                  ["strong"] = "Opened",
                  ["type-check"] = "Opened",
                  ["unbalanced"] = "Opened",
                  ["unused"] = "Opened",
                },
                unusedLocalExclude = { "_*" },
              },
            },
          },
        },
      },
    },
  },
}
