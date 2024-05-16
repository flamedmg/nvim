-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<Tab>", "<cmd>bn<cr>")
vim.keymap.set("n", "<S-Tab>", "<cmd>bp<cr>")

vim.keymap.set("n", "*", "*zz")

vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

local map = vim.keymap.set

map("n", "q", function()
  local plugins = {
    "blame",
    "checkhealth",
    "fugitive",
    "fugitiveblame",
    "help",
    "httpResult",
    "lspinfo",
    "notify",
    "PlenaryTestPopup",
    "qf",
    "query",
    "spectre_panel",
    "startuptime",
    "tsplayground",
  }
  local buf = vim.api.nvim_get_current_buf()
  if vim.tbl_contains(plugins, vim.bo[buf].filetype) then
    vim.bo[buf].buflisted = false
    vim.api.nvim_win_close(0, false)
  else
    -- Find non-floating windows
    local wins = vim.fn.filter(vim.api.nvim_list_wins(), function(_, win)
      if vim.api.nvim_win_get_config(win).zindex then
        return nil
      end
      return win
    end)
    -- If last window, quit
    if #wins > 1 then
      vim.api.nvim_win_close(0, false)
    else
      vim.cmd([[quit]])
    end
  end
end, { desc = "Close window" })

map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })

vim.keymap.set("n", ";", function()
  require("telescope").extensions.smart_open.smart_open()
end, { noremap = true, silent = true })

-- Define a function to handle the Tab key
function _G.smart_tab()
  if vim.fn["copilot#Accept"]("") == "" then
    return vim.api.nvim_replace_termcodes("<Tab>", true, true, true)
  else
    return vim.fn["copilot#Accept"]("<Tab>")
  end
end
local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<c-s>", ":lua require('copilot.suggestion').toggle_auto_trigger()<CR>", opts)

-- Map the Tab key to the smart_tab function in insert mode
vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.smart_tab()", { expr = true, noremap = true })
