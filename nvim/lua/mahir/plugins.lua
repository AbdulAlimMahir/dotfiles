return {
  "nvim-lua/plenary.nvim", -- lua functions that many plugins use
  "christoomey/vim-tmux-navigator", -- tmux & split window navigation
  { "akinsho/toggleterm.nvim", version = "*", config = true },
  {
    "ryanmsnyder/toggleterm-manager.nvim",
    dependencies = {
      "akinsho/nvim-toggleterm.lua",
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim", -- only needed because it's a dependency of telescope
    },
    -- config = true,
  },
  -- heirline-components.nvim [ui components]
  -- Collection of components to use on your heirline config.
  -- { "zeioth/heirline-components.nvim", opts = {} },
}
