-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

local astro_utils = require "astrocore"
local utils = require "utils.utils"
---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 500, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = false, -- lsp_linesv2
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = {
        -- set to true or false etc.
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "auto", -- sets vim.opt.signcolumn to auto
        wrap = true, -- sets vim.opt.wrap
        list = true, -- show whitespace characters
        listchars = { tab = "│→", extends = "⟩", precedes = "⟨", trail = "·", nbsp = "␣" },
        showbreak = "↪ ",
        showtabline = (vim.t.bufs and #vim.t.bufs > 1) and 2 or 1,
        conceallevel = 2,
      },
      g = { -- vim.g.<key>
        rustaceanvim = {
          tools = {
            hover_actions = { auto_focus = true },
          },
        },
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- better buffer navigation
        ["]b"] = false,
        ["[b"] = false,
        ["<S-l>"] = {
          function() require("astrocore.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
          desc = "Next buffer",
        },
        ["<S-h>"] = {
          function() require("astrocore.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
          desc = "Previous buffer",
        },
        -- better search
        n = { utils.better_search "n", desc = "Next search" },
        N = { utils.better_search "N", desc = "Previous search" },
        -- better increment/decrement
        ["-"] = { "<c-x>", desc = "Descrement number" },
        ["+"] = { "<c-a>", desc = "Increment number" },
        -- resize with arrows
        ["<Up>"] = { function() require("smart-splits").resize_up(2) end, desc = "Resize split up" },
        ["<Down>"] = { function() require("smart-splits").resize_down(2) end, desc = "Resize split down" },
        ["<Left>"] = { function() require("smart-splits").resize_left(2) end, desc = "Resize split left" },
        ["<Right>"] = { function() require("smart-splits").resize_right(2) end, desc = "Resize split right" }, -- telescope plugin mappings
        ["<leader>fx"] = {
          function() require("telescope").extensions.live_grep_args.live_grep_args() end,
          desc = "Find words (args)",
        },
        ["<leader>fB"] = { "<cmd>Telescope bibtex<cr>", desc = "Find BibTeX" },
        ["<leader>fe"] = { "<cmd>Telescope file_browser<cr>", desc = "File explorer" },
        ["<leader>fp"] = { function() require("telescope").extensions.projects.projects {} end, desc = "Find projects" },
        ["<leader>fT"] = { "<cmd>TodoTelescope<cr>", desc = "Find TODOs" },
        -- tables with the `name` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        ["<leader>b"] = { name = "Buffers" },
        -- quick save
        -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
        ["<leader>k"] = { name = "rust" },
        ["<leader>j"] = {
          name = "Misc",
        },

        --compiler
        ["<leader>m"] = { desc = "󱁤 Compiler" },
        ["<leader>mk"] = {
          function()
            vim.cmd "silent! write"
            local filename = vim.fn.expand "%:t"
            utils.async_run(
              { "compiler", vim.fn.expand "%:p" },
              function() astro_utils.notify("Compiled " .. filename) end
            )
          end,
          desc = "Compile",
        },
        ["<leader>ma"] = {
          function()
            vim.notify "Autocompile Started"
            utils.async_run(
              { "autocomp", vim.fn.expand "%:p" },
              function() astro_utils.notify "Autocompile stopped" end
            )
          end,
          desc = "Auto Compile",
        },
        ["<leader>mv"] = {
          function() vim.fn.jobstart { "opout", vim.fn.expand "%:p" } end,
          desc = "View Output",
        },
        ["<leader>mb"] = {
          function()
            local filename = vim.fn.expand "%:t"
            utils.async_run({
              "pandoc",
              vim.fn.expand "%",
              "--pdf-engine=xelatex",
              "--variable",
              "urlcolor=blue",
              "-t",
              "beamer",
              "-o",
              vim.fn.expand "%:r" .. ".pdf",
            }, function() astro_utils.notify("Compiled " .. filename) end)
          end,
          desc = "Compile Beamer",
        },
        ["<leader>mp"] = {
          function()
            local pdf_path = vim.fn.expand "%:r" .. ".pdf"
            if vim.fn.filereadable(pdf_path) == 1 then vim.fn.jobstart { "pdfpc", pdf_path } end
          end,
          desc = "Present Output",
        },
        --trouble
        ["<leader>x"] = { desc = "󰒡 Trouble" },
        ["<leader>xx"] = { "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics (Trouble)" },
        ["<leader>xX"] = { "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics (Trouble)" },
        ["<leader>xl"] = { "<cmd>TroubleToggle loclist<cr>", desc = "Location List (Trouble)" },
        ["<leader>xq"] = { "<cmd>TroubleToggle quickfix<cr>", desc = "Quickfix List (Trouble)" },
        ["<leader>xT"] = { "<cmd>TodoTrouble<cr>", desc = "TODOs (Trouble)" },
      },
      i = {
        -- signature help, fails silently so attach always
        ["<C-l>"] = { function() vim.lsp.buf.signature_help() end, desc = "Signature help" },
        ["<S-Tab>"] = { "<C-V><Tab>", desc = "Tab character" },
      },
      -- terminal mappings
      t = {
        ["<C-BS>"] = { "<C-\\><C-n>", desc = "Terminal normal mode" },
        ["<esc><esc>"] = { "<C-\\><C-n>:q<cr>", desc = "Terminal quit" },
      },
      x = {
        -- better increment/decrement
        ["+"] = { "g<C-a>", desc = "Increment number" },
        ["-"] = { "g<C-x>", desc = "Descrement number" },
        -- Easy-Align
        ga = { "<Plug>(EasyAlign)", desc = "Easy Align" },
      },
      o = {
        -- line text-objects
        ["il"] = { ":normal vil<cr>", desc = "Inside line text object" },
        ["al"] = { ":normal val<cr>", desc = "Around line text object" },
      },
    },
  },
}
