return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  opts = {
    window = {
      border = "single",
    },
    key_labels = {
      ["<space>"] = "SPACE",
      ["<C>"] = "CTRL",
      ["<S"] = "SHIFT",
      ["<tab>"] = "TAB",
      ["<cr>"] = "RET",
      ["<esc>"] = "ESC",
    },
    icons = {
      breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
      separator = "", -- symbol used between a key and it's label
      group = "+", -- symbol prepended to a group
    },
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "^:", "^ ", "^call ", "^lua " }, -- hide mapping boilerplate
    show_keys = true,
  },
  -- local wk = require("which-key").register
  -- wk({
  --   ["<leader>c"] = { name = "Code Actions" }
  -- })
}
