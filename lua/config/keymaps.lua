-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- macOS standard save keybindings
-- Works with terminals that support kitty keyboard protocol (Ghostty, WezTerm with enable_kitty_keyboard)
vim.keymap.set({ "n", "i", "v" }, "<D-s>", "<Cmd>w<CR>", { desc = "Save current buffer", silent = true })

-- Cmd+Shift+S to save all buffers
vim.keymap.set({ "n", "i", "v" }, "<D-S-s>", "<Cmd>wa<CR>", { desc = "Save all buffers", silent = true })
