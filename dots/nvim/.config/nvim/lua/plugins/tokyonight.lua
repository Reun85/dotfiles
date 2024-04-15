return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {
      -- sidebars = { "qf", "vista_kind", "terminal", "packer" },
      -- Change the "hint" color to the "orange" color, and make the "error" color bright red
      --
      --- @param highlights Highlights
      on_highlights = function(highlights, _)
        local utils = require "tokyonight.util"
        highlights.LspInlayHint = {
          -- bg = utils.lighten("#24283c", 0.9),
          fg = utils.lighten("#545c7e", 0.7),
        }
      end,
    }
}
