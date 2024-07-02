return {

  {
    "nvim-treesitter/nvim-treesitter",
    optional = true,
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "glsl" })
      end
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "glsl_analyzer" })
    end,
  },
  {
    "https://github.com/nolanderc/glsl_analyzer",
    -- config = function() require("mason-lspconfig").glsl_analyzer.setup { filetypes = { "glsl", "vert", "frag" } } end,
  },
}
