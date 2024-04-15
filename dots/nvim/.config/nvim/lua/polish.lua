-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Set up custom filetypes
require("aerial").open()
local wkl = require "which-key"

vim.filetype.add { extension = { tese = "glsl", tesc = "glsl", comp = "glsl", vert = "glsl", frag = "glsl" } }

vim.api.nvim_create_autocmd({ "FileType", "VimEnter" }, {
  pattern = "*",
  callback = function()
    local fileTy = vim.api.nvim_buf_get_option(0, "filetype")

    if fileTy == "rust" then
      wkl.register({
        k = {
          name = "rust",
          -- TODO: this is not yet working
          d = { "<cmd>RustLsp debug<cr>", "Debug" },
          h = { "<cmd>RustLsp debuggables<cr>", "Debuggables" },
          m = { "<cmd>RustLsp expandMacro<cr>", "Expand macro" },
          o = { "<cmd>RustLsp openCargo<cr>", "Open TOML" },
          s = { "<cmd>RustLsp ssr<cr>", "Search & Replace" },
          r = { "<cmd>RustLsp runnables<cr>", "Runnables" },
          p = { "<cmd>RustLsp parentModule<cr>", "Parent module" },
          y = { "<cmd>RustLsp externalDocs<cr>", "Parent module" },
          w = { "<cmd>RustLsp workspaceSymbol<cr>", "workspaceSymbol" },
          --
        },
      }, { prefix = "<leader>", buffer = 0 })
    end
    if fileTy == "cpp" or fileTy == "h" or fileTy == "hpp" or fileTy == "c" then
      wkl.register({
        k = {
          name = "cpp",
          o = { "<cmd>ClangdSwitchSourceHeader<cr>", "Header-Source" },
          d = { "<cmd>CMakeDebug<cr>", "Start Debug" },
          r = { "<cmd>CMakeRun<cr>", "Run" },
        },
      }, { prefix = "<leader>", buffer = 0 })
    end
  end,
})
require("utils.telescopetheme").setup()

require("telescope").setup {
  defaults = {
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--ignore-file",
      ".gitignore",
    },
  },
}

-- vim.filetype.add {
--   extension = {
--     foo = "fooscript",
--   },
--   filename = {
--     ["Foofile"] = "fooscript",
--   },
--   pattern = {
--     ["~/%.config/foo/.*"] = "fooscript",
--   },
-- }
