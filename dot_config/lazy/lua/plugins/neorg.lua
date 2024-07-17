return {
  {
    "nvim-neorg/neorg",
    opts = {
      load = {
        ["core.defaults"] = {},
        ["core.concealer"] = {
          config = {
            icon_preset = "basic",
          },
        },
        ["core.dirman"] = {
          config = {
            workspaces = {
              notes = "~/git/dan/notes",
            },
            default_workspace = "notes",
          },
        },
        ["core.keybinds"] = {
          config = {
            default_keybinds = true,
          },
        },
      },
    },
  },
}
