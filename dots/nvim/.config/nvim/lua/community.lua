-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",

  -- ╭─────────────────────────────────────────────────────────╮
  -- │                          Packs                          │
  -- ╰─────────────────────────────────────────────────────────╯
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.cmake" },
  -- { import = "astrocommunity.pack.docker" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.python" },
  -- { import = "astrocommunity.pack.toml" },
  -- { import = "astrocommunity.pack.sql" },
  { import = "astrocommunity.pack.bash" },
  -- ╭─────────────────────────────────────────────────────────╮
  -- │                     simple plugins                      │
  -- ╰─────────────────────────────────────────────────────────╯
  -- Makes neo-tree unbarable
  -- { import = "astrocommunity.bars-and-lines.dropbar-nvim" },
  -- { import = "astrocommunity.code-runner.overseer-nvim" },
  { import = "astrocommunity.motion.flash-nvim" },
  { import = "astrocommunity.diagnostics.lsp_lines-nvim" },
  -- { import = "astrocommunity.diagnostics.trouble-nvim" },
  -- { import = "astrocommunity.scrolling.mini-animate" },
  { import = "astrocommunity.utility.noice-nvim" },
  { import = "astrocommunity.debugging.telescope-dap-nvim" },

  -- ╭─────────────────────────────────────────────────────────╮
  -- │                        In works                         │
  -- ╰─────────────────────────────────────────────────────────╯
  -- needs to configure
  -- { import = "astrocommunity/debugging/nvim-chainsaw" },
  --New testing
  -- { import = "astrocommunity.color.tint-nvim" },
  -- run part of code
  { import = "astrocommunity.code-runner.sniprun" },
  -- highlight words under cursor
  -- { import = "astrocommunity/color/vim-highlighter" },
  -- markdown support
  -- { import = "astrocommunity.color.headlines-nvim" },
  -- ??
  -- { import = "astrocommunity.motion.mini-surround" },
  -- make pretty boxes
  { import = "astrocommunity.editing-support.comment-box-nvim" },
  -- Regex explainer
  -- { import = "astrocommunity/editing-support/hypersonic-nvim" },
  -- Split arguments from initialiser: f(a,b)-> f( \n a \n b)
  { import = "astrocommunity.editing-support.mini-splitjoin" },
  -- Annotation generator, is this useful?
  { import = "astrocommunity.editing-support.neogen" },
  -- CPP has its documentation on websites, bring that into neovim :)
  { import = "astrocommunity.editing-support.nvim-devdocs" },
  -- rainbow parenthesis
  -- { import = "astrocommunity.editing-support.rainbow-delimiters-nvim" },
  -- incremental selection
  -- { import = "astrocommunity/editing-support/wildfire-nvim" },
  { import = "astrocommunity.file-explorer.telescope-file-browser-nvim" },
}
