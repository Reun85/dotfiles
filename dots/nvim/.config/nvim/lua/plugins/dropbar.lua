--- @type LazySpec
return {
  {
    "Bekaboo/dropbar.nvim",
    event = "UIEnter",
    opts = {},
    dependencies = {
      {
        "AstroNvim/astrocore",
        --- @type AstroCoreOpts
        opts = {
          mappings = {
            n = {
              ["<leader>s"] = {
                function() require("dropbar.api").pick() end,
                desc = "Dropbar",
              },
            },
          },
        },
      },
    },
  },
  {
    "rebelot/heirline.nvim",
    optional = true,
    opts = function(_, opts) opts.winbar = nil end,
  },
}
