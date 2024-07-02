-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  -- "AstroNvim/astrocommunity",

  -- ╭─────────────────────────────────────────────────────────╮
  -- │                          Packs                          │
  -- ╰─────────────────────────────────────────────────────────╯
  -- { import = "astrocommunity.pack.docker" },
  -- { import = "astrocommunity.pack.typescript" },
  -- { import = "astrocommunity.pack.toml" },
  -- { import = "astrocommunity.pack.sql" },
  -- ╭─────────────────────────────────────────────────────────╮
  -- │                     simple plugins                      │
  -- ╰─────────────────────────────────────────────────────────╯
  -- { import = "astrocommunity.code-runner.overseer-nvim" },
  -- { import = "astrocommunity.scrolling.mini-animate" },

  -- ╭─────────────────────────────────────────────────────────╮
  -- │                        In works                         │
  -- ╰─────────────────────────────────────────────────────────╯
  -- needs to configure
  -- { import = "astrocommunity/debugging/nvim-chainsaw" },
  --New testing
  -- { import = "astrocommunity.color.tint-nvim" },
  -- run part of code
  -- { import = "astrocommunity.code-runner.sniprun" },
  -- highlight words under cursor
  -- { import = "astrocommunity/color/vim-highlighter" },
  -- ??
  -- { import = "astrocommunity.motion.mini-surround" },
  -- CPP has its documentation on websites, bring that into neovim :)
  -- { import = "astrocommunity.editing-support.nvim-devdocs" },
  -- rainbow parenthesis
  -- { import = "astrocommunity.editing-support.rainbow-delimiters-nvim" },
  -- incremental selection
  -- { import = "astrocommunity/editing-support/wildfire-nvim" },
}
