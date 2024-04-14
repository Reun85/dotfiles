return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
    require("tokyonight").setup {
      -- sidebars = { "qf", "vista_kind", "terminal", "packer" },
      -- Change the "hint" color to the "orange" color, and make the "error" color bright red
      --
      -- --- @param colors ColorScheme
      -- on_colors = function(colors) colors.LspInlayHint = "#bbbbbb" end,
      --- @param colors ColorScheme
      --- @param highlights Highlights
      on_highlights = function(highlights, colors)
        -- highlights.LspInlayHint = {
        --   -- bg = "#24283c",
        --   bg = require("tokyonight.util").lighten(colors.bg_dark, 0.3),
        --   -- -- bg = "#545c7e",
        --   -- fg = "#b69e8b",
        --   fg = "#a4acce",
        -- }
        local utils = require "tokyonight.util"
        highlights.LspInlayHint = {
          -- bg = utils.lighten("#24283c", 0.9),
          fg = utils.lighten("#545c7e", 0.7),
        }
      end,
    }
  end,
}
