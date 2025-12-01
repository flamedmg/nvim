-- opencode.nvim - AI assistant integration
return {
  {
    "NickvanDyke/opencode.nvim",
    -- snacks.nvim is already included in LazyVim
    dependencies = {
      "folke/snacks.nvim",
    },
    config = function()
      ---@type opencode.Opts
      vim.g.opencode_opts = {
        -- Using snacks provider (default for LazyVim)
        provider = {
          enabled = "snacks",
        },
      }

      -- Required for opts.events.reload (auto-reload files edited by opencode)
      vim.o.autoread = true

      -- Keymaps using <leader>o prefix to avoid conflicts
      -- <leader>oa - Ask opencode with context
      vim.keymap.set({ "n", "x" }, "<leader>oa", function()
        require("opencode").ask("@this: ", { submit = true })
      end, { desc = "Ask opencode" })

      -- <leader>os - Select from opencode actions
      vim.keymap.set({ "n", "x" }, "<leader>os", function()
        require("opencode").select()
      end, { desc = "Select opencode action" })

      -- <leader>op - Add context to opencode prompt
      vim.keymap.set({ "n", "x" }, "<leader>op", function()
        require("opencode").prompt("@this")
      end, { desc = "Add to opencode prompt" })

      -- <leader>oo - Toggle opencode window
      vim.keymap.set({ "n", "t" }, "<leader>oo", function()
        require("opencode").toggle()
      end, { desc = "Toggle opencode" })

      -- Scroll commands (only active in normal mode)
      vim.keymap.set("n", "<leader>ou", function()
        require("opencode").command("session.half.page.up")
      end, { desc = "opencode scroll up" })

      vim.keymap.set("n", "<leader>od", function()
        require("opencode").command("session.half.page.down")
      end, { desc = "opencode scroll down" })
    end,
  },

  -- Ensure snacks.nvim has the required features enabled
  {
    "folke/snacks.nvim",
    opts = {
      input = {},
      picker = {},
      terminal = {},
    },
  },
}
