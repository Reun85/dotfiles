return {
  "https://github.com/xeluxee/competitest.nvim",
  dependencies = "MunifTanjim/nui.nvim",
  opts = {
    popup_ui = {
      layout = {
        {
          1,
          {
            { 1, "so" },
            { 1, {
              { 1, "tc" },
              { 1, "se" },
            } },
          },
        },
        { 1, {
          { 1, "eo" },
          { 1, "si" },
        } },
      },
    },
    template_file = {
      cpp = "~/.config/nvim/lua/utils/other/cppcomptemplate.cpp",
    },
    evaluate_template_modifiers = true,
    testcases_directory = "./testcases",
  },
}
