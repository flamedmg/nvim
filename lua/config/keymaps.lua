-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- macOS standard save keybindings
-- Works with terminals that support kitty keyboard protocol (Ghostty, WezTerm with enable_kitty_keyboard)
vim.keymap.set({ "n", "i", "v" }, "<D-s>", "<Cmd>w<CR>", { desc = "Save current buffer", silent = true })

-- Cmd+Shift+S to save all buffers
vim.keymap.set({ "n", "i", "v" }, "<D-S-s>", "<Cmd>wa<CR>", { desc = "Save all buffers", silent = true })

-- Terminal in tab (reuse existing or create new)
vim.keymap.set("n", "<leader>ot", function()
  for _, tabpage in ipairs(vim.api.nvim_list_tabpages()) do
    for _, win in ipairs(vim.api.nvim_tabpage_list_wins(tabpage)) do
      local buf = vim.api.nvim_win_get_buf(win)
      if vim.bo[buf].buftype == "terminal" then
        vim.api.nvim_set_current_tabpage(tabpage)
        vim.api.nvim_set_current_win(win)
        vim.cmd("startinsert")
        return
      end
    end
  end
  vim.cmd("tabnew | terminal")
  vim.cmd("startinsert")
end, { desc = "Terminal (tab)" })

-- Terminal in right split (reuse existing or create new)
vim.keymap.set("n", "<leader>ov", function()
  local current_tab = vim.api.nvim_get_current_tabpage()
  for _, win in ipairs(vim.api.nvim_tabpage_list_wins(current_tab)) do
    local buf = vim.api.nvim_win_get_buf(win)
    if vim.bo[buf].buftype == "terminal" then
      vim.api.nvim_set_current_win(win)
      vim.cmd("startinsert")
      return
    end
  end
  vim.cmd("botright vsplit | terminal")
  vim.cmd("startinsert")
end, { desc = "Terminal (right split)" })
