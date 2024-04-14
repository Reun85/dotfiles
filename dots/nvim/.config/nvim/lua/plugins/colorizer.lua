return {
  {
    "NvChad/nvim-colorizer.lua",
    lazy = false,
    config = function()
      require("colorizer").setup {
        filetypes = {
          "*",
          css = { names = true },
        },
        user_default_options = {
          names = false,
        },
      }
    end,
  },
}
