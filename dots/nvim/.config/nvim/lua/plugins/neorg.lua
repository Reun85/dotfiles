return {
  {
    "nvim-neorg/neorg",
    version = "^8",
    dependencies = {
      {
        "vhyrro/luarocks.nvim",
        priority = 1000, -- We'd like this plugin to load first out of the rest
        config = true,
      },
      "nvim-treesitter/nvim-treesitter",
    },
    event = "VeryLazy",
    opts = {
      load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.concealer"] = {}, -- Adds pretty icons to your documents
        ["core.keybinds"] = {}, -- Adds default keybindings
        ["core.completion"] = {
          config = {
            engine = "nvim-cmp",
          },
        }, -- Enables support for completion plugins
        ["core.journal"] = {}, -- Enables support for the journal module
        ["core.dirman"] = { -- Manages Neorg workspaces
          config = {
            workspaces = {
              notes = "~/all/dev/notes",
            },
          },
        },
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    optional = true,
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "norg" })
      end
    end,
  },
  {
    "lukas-reineke/headlines.nvim",
    dependencies = "nvim-treesitter/nvim-treesitter",
    ft = { "markdown", "norg", "org", "rmd" },
    opts = {},
  },
}
