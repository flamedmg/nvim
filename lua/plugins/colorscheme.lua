-- Colorscheme configuration
return {
  -- Mellifluous colorscheme
  {
    "ramojus/mellifluous.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("mellifluous").setup({
        -- Optional configuration
        dim_inactive = false,
        color_set = "mellifluous", -- Options: 'mellifluous', 'alduin', 'mountain', 'tender', 'kanagawa_dragon'
        styles = {
          comments = { italic = true },
          keywords = { italic = false },
          functions = {},
          variables = {},
        },
        transparent_background = {
          enabled = false,
          floating_windows = true,
          telescope = true,
          file_tree = true,
          cursor_line = true,
          status_line = false,
        },
        flat_background = {
          line_numbers = false,
          floating_windows = false,
          file_tree = false,
          cursor_line_number = false,
        },
        plugins = {
          cmp = true,
          gitsigns = true,
          indent_blankline = true,
          nvim_tree = {
            enabled = true,
            show_root = false,
          },
          neo_tree = {
            enabled = true,
          },
          telescope = {
            enabled = true,
            nvchad_like = true,
          },
          startify = true,
        },
      })
    end,
  },

  -- Evergarden colorscheme
  {
    "everviolet/nvim",
    name = "evergarden",
    lazy = false,
    priority = 1000,
    opts = {
      theme = {
        variant = "fall", -- Options: 'winter', 'fall', 'spring', 'summer'
        accent = "green",
      },
      editor = {
        transparent_background = false,
        sign = { color = "none" },
        float = {
          color = "mantle",
          solid_border = false,
        },
        completion = {
          color = "surface0",
        },
      },
    },
  },

  -- Kanagawa colorscheme
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("kanagawa").setup({
        compile = false, -- enable compiling the colorscheme
        undercurl = true, -- enable undercurls
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        typeStyle = {},
        transparent = false, -- do not set background color
        dimInactive = false, -- dim inactive window `:h hl-NormalNC`
        terminalColors = true, -- define vim.g.terminal_color_{0,17}
        colors = { -- add/modify theme and palette colors
          palette = {},
          theme = {
            wave = {},
            lotus = {},
            dragon = {},
            all = {}
          },
        },
        overrides = function(colors) -- add/modify highlights
          return {}
        end,
        theme = "wave", -- Load "wave" theme when 'background' option is not set
        background = { -- map the value of 'background' option to a theme
          dark = "wave", -- try "dragon" or "wave"
          light = "lotus",
        },
      })
    end,
  },

  -- Apprentice colorscheme
  {
    "romainl/Apprentice",
    lazy = false,
    priority = 1000,
  },

  -- Override LazyVim's default colorscheme setting
  -- You can change this to "evergarden" or "kanagawa" to use those themes instead
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "mellifluous", -- Change this to "evergarden" or "kanagawa" as desired
    },
  },
}