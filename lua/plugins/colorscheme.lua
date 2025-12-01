-- Colorscheme configuration
return {
  -- Kanagawa Paper colorscheme
  {
    "sho-87/kanagawa-paper.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },

  -- Vague colorscheme
  {
    "vague2k/vague.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("vague").setup({
        transparent = false,
        style = {
          boolean = "none",
          number = "none",
          float = "none",
          error = "none",
          comments = "italic",
          conditionals = "none",
          functions = "none",
          headings = "bold",
          operators = "none",
          strings = "italic",
          variables = "none",
          keywords = "none",
          keyword_return = "none",
          keywords_loop = "none",
          keywords_label = "none",
          keywords_exception = "none",
          builtin_constants = "none",
          builtin_functions = "none",
          builtin_types = "none",
          builtin_variables = "none",
        },
        colors = {
          -- Override colors here if desired
        },
      })
    end,
  },

  -- Zenbones colorscheme collection
  {
    "zenbones-theme/zenbones.nvim",
    lazy = false,
    priority = 1000,
    dependencies = { "rktjmp/lush.nvim" },
    config = function()
      -- Set to dark background (change to "light" for light mode)
      vim.o.background = "dark"

      -- Zenbones configuration
      -- Using "stark" for darker background, increased lightening for brighter colors
      vim.g.zenbones = {
        darkness = "stark", -- Darker background
        lighten_comments = 55, -- Brighter comments
        lighten_line_nr = 50, -- Brighter line numbers
        italic_comments = true,
        italic_strings = false,
        solid_line_nr = false,
        colorize_diagnostic_underline_text = true,
      }

      -- Apply same config to kanagawabones and seoulbones
      vim.g.kanagawabones = {
        darkness = "stark",
        lighten_comments = 55,
        lighten_line_nr = 50,
        italic_comments = true,
        italic_strings = false,
        colorize_diagnostic_underline_text = true,
      }

      vim.g.seoulbones = {
        darkness = "stark",
        lighten_comments = 55,
        lighten_line_nr = 50,
        italic_comments = true,
        italic_strings = false,
        colorize_diagnostic_underline_text = true,
      }
    end,
  },

  -- Override LazyVim's default colorscheme setting
  {
    "LazyVim/LazyVim",
    opts = {
      -- Options: "vague", "kanagawa-paper", "zenbones", "zenwritten",
      -- "kanagawabones", "rosebones", "forestbones", "seoulbones"
      colorscheme = "vague",
    },
  },
}
