return {

  {
    "hrsh7th/nvim-cmp",
    dependencies = { "zbirenbaum/copilot.lua" },
    event = "User AstroFile",
    opts = function(_, opts)
      local cmp, copilot = require "cmp", require "copilot.suggestion"
      local snip_status_ok, luasnip = pcall(require, "luasnip")
      if not snip_status_ok then return end
      local function has_words_before()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
      end
      if not opts.mapping then opts.mapping = {} end
      opts.mapping["<C-2>"] = cmp.mapping(function(fallback)
        if copilot.is_visible() then
          copilot.accept()
        elseif cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, { "i", "s" })

      opts.suggestion = { auto_trigger = true, debounce = 150 }

      opts.mapping["<C-x>"] = cmp.mapping(function()
        if copilot.is_visible() then copilot.next() end
      end)

      opts.mapping["<C-z>"] = cmp.mapping(function()
        if copilot.is_visible() then copilot.prev() end
      end)

      opts.mapping["<C-right>"] = cmp.mapping(function()
        if copilot.is_visible() then copilot.accept_word() end
      end)

      opts.mapping["<C-l>"] = cmp.mapping(function()
        if copilot.is_visible() then copilot.accept_word() end
      end)

      opts.mapping["<C-down>"] = cmp.mapping(function()
        if copilot.is_visible() then copilot.accept_line() end
      end)

      opts.mapping["<C-j>"] = cmp.mapping(function()
        if copilot.is_visible() then copilot.accept_line() end
      end)

      opts.mapping["<C-c>"] = cmp.mapping(function()
        if copilot.is_visible() then copilot.dismiss() end
      end)

      return opts
    end,
  },
  {
    dependencies = { "zbirenbaum/copilot.lua" },
    "jellydn/CopilotChat.nvim",

    opts = {

      debug = true,
      mode = "split",
      prompts = {
        -- Code related prompts
        Explain = "Please explain how the following code works.",
        Review = "Please review the following code and provide suggestions for improvement.",
        Tests = "Please explain how the selected code works, then generate unit tests for it.",
        Refactor = "Please refactor the following code to improve its clarity and readability.",
        -- Text related prompts
        Summarize = "Please summarize the following text.",
        Spelling = "Please correct any grammar and spelling errors in the following text.",
        Wording = "Please improve the grammar and wording of the following text.",
        Concise = "Please rewrite the following text to make it more concise.",
      },
    },
    build = function()
      vim.defer_fn(function()
        vim.cmd "UpdateRemotePlugins"
        vim.notify "CopilotChat - Updated remote plugins. Please restart Neovim."
      end, 3000)
    end,
    lazy = "VeryLazy",
    keys = {
      { "<leader>lce", "<cmd>CopilotChatExplain<cr>", desc = "CopilotChat - Explain code" },
      { "<leader>lct", "<cmd>CopilotChatTests<cr>", desc = "CopilotChat - Generate tests" },
      { "<leader>lcr", "<cmd>CopilotChatReview<cr>", desc = "CopilotChat - Review code" },
      { "<leader>lcR", "<cmd>CopilotChatRefactor<cr>", desc = "CopilotChat - Refactor code" },
      { "<leader>lcs", "<cmd>CopilotChatSummarize<cr>", desc = "CopilotChat - Summarize text" },
      { "<leader>lcS", "<cmd>CopilotChatSpelling<cr>", desc = "CopilotChat - Correct spelling" },
      { "<leader>lcw", "<cmd>CopilotChatWording<cr>", desc = "CopilotChat - Improve wording" },
      { "<leader>lcc", "<cmd>CopilotChatConcise<cr>", desc = "CopilotChat - Make text concise" },
    },
  },
}
