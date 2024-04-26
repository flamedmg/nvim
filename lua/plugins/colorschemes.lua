return {

  -- Use last-used colorscheme
  {
    "rafi/theme-loader.nvim",
    lazy = false,
    priority = 99,
    opts = { initial_colorscheme = "neohybrid" },
  },

  { "rafi/neo-hybrid.vim", priority = 100, lazy = false },
  { "rafi/awesome-vim-colorschemes", lazy = false },
  { "AlexvZyl/nordic.nvim" },
  { "folke/tokyonight.nvim", opts = { style = "night" } },
  { "rebelot/kanagawa.nvim" },
  { "olimorris/onedarkpro.nvim" },
  { "EdenEast/nightfox.nvim" },
  { "nyoom-engineering/oxocarbon.nvim" },
  {
    "gmr458/vscode_modern_theme.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("vscode_modern").setup({
        cursorline = true,
        transparent_background = false,
        nvim_tree_darker = true,
      })
      vim.cmd.colorscheme("vscode_modern")
    end,
  },
  {
    "ribru17/bamboo.nvim",
    config = function()
      require("bamboo").setup({})
      require("bamboo").load()
    end,
  },
  { "almo7aya/neogruvbox.nvim" },
  {
    "echasnovski/mini.nvim",
    version = false,
    lazy = false,
    config = function()
      require("mini.hues").setup({ background = "#0E0E0E", foreground = "#c4c6cd", accent = "blue" })
      -- require('mini.hues').setup { background = '#002734', foreground = '#c0c8cc', accent = 'blue' }
      -- require('mini.hues').setup { background = '#002923', foreground = '#c0c9c7' } -- cyan
      -- require('mini.hues').setup { background = '#002734', foreground = '#c0c8cc' } -- azure
      -- require('mini.hues').setup { background = '#19213a', foreground = '#c4c6cd' } -- blue
    end,
  },
}
