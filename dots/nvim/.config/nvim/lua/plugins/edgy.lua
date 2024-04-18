return {
  --- @type LazyPlugin
  {
    "folke/edgy.nvim",
    --- @type Edgy.Config
    opts = {
      exit_when_last = true,
      -- animate = {},
      bottom = {
        { ft = "qf", title = "QuickFix" },
        {
          ft = "help",
          size = { height = 20 },
          -- don't open help files in edgy that we're editing
          filter = function(buf) return vim.bo[buf].buftype == "help" end,
        },
        "Trouble",
      },
      left = {
        "neo-tree",
      },
      right = {
        {
          ft = "aerial",
          title = "Symbol Outline",
          pinned = true,
          open = function() require("aerial").open() end,
        },
      },
      keys = {
        -- increase width
        ["<C-Right>"] = function(win) win:resize("width", 2) end,
        -- decrease width
        ["<C-Left>"] = function(win) win:resize("width", -2) end,
        -- increase height
        ["<C-Up>"] = function(win) win:resize("height", 2) end,
        -- decrease height
        ["<C-Down>"] = function(win) win:resize("height", -2) end,
      },
    },
  },
  --- @type LazyPlugin
  {
    "nvim-neo-tree/neo-tree.nvim",
    optional = true,
    opts = {
      source_selector = {
        winbar = true,
        statusline = false,
      },
    },
  },
}
