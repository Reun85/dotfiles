return {
  "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  event = "LspAttach",
  dependencies = {
    {
      "AstroNvim/astrocore",
      --- @type AstroCoreOpts
      opts = {
        diagnostics = {
          virtual_text = false,
        },
        mappings = {
          n = {
            ["<Leader>uD"] = { function() require("lsp_lines").toggle() end, desc = "Toggle virtual diagnostic lines" },
          },
        },
      },
    },
  },
  opts = {},
}
