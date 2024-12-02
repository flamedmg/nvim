return {
  -- Use last-used colorscheme
  {
    "rafi/theme-loader.nvim",
    lazy = false,
    priority = 99,
    opts = { initial_colorscheme = "neohybrid" },
  },
  { "rafi/neo-hybrid.vim", priority = 100, lazy = false },

  { "rktjmp/lush.nvim" },
  -- { "rafi/awesome-vim-colorschemes", lazy = false },
  { "AlexvZyl/nordic.nvim" },
  {
    "ilof2/posterpole.nvim",
    priority = 1000,
    config = function()
      require("posterpole").setup({
        -- config here
      })
      -- if you need colorscheme without termguicolors support
      -- This variant set termguicolors to false, be aware of using it
      -- vim.cmd("colorscheme posterpole-term")
    end,
  },
  {
    "sho-87/kanagawa-paper.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    "ribru17/bamboo.nvim",
    config = function()
      require("bamboo").setup({})
    end,
  },
  {
    "slugbyte/lackluster.nvim",
    lazy = false,
    priority = 1000,
    init = function()
      -- vim.cmd.colorscheme("lackluster-hack") -- my favorite
      -- vim.cmd.colorscheme("lackluster-mint")
    end,
  },
  {
    "aktersnurra/no-clown-fiesta.nvim",
  },
  {
    "echasnovski/mini.nvim",
    version = false,
    lazy = false,
    config = function()
      -- require("mini.hues").setup({ background = "#0E0E0E", foreground = "#c4c6cd", accent = "blue" })
      -- require('mini.hues').setup { background = '#002734', foreground = '#c0c8cc', accent = 'blue' }
      -- require('mini.hues').setup { background = '#002923', foreground = '#c0c9c7' } -- cyan
      -- require('mini.hues').setup { background = '#002734', foreground = '#c0c8cc' } -- azure
      -- require('mini.hues').setup { background = '#19213a', foreground = '#c4c6cd' } -- blue
    end,
  },
}
