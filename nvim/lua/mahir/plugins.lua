return {
  { "nvim-lua/plenary.nvim" }, -- lua functions that many plugins use

  -- { "christoomey/vim-tmux-navigator" }, -- tmux & split window navigation

  { "tpope/vim-fugitive" },

  { "szw/vim-maximizer" },

  { "brenoprata10/nvim-highlight-colors" },

  { "akinsho/toggleterm.nvim", version = "*", config = true },

  { "barrett-ruth/live-server.nvim", event = "VeryLazy" },

  { "stevearc/dressing.nvim", event = "VeryLazy" },

  { "echasnovski/mini.icons", version = "*" },

  { "echasnovski/mini.nvim", version = "*" },

  { "junegunn/fzf.vim", dependencies = { "junegunn/fzf" } },

  { "vhyrro/luarocks.nvim", priority = 1000, config = true },

  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  },

  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
  },

  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  {
    "ryanmsnyder/toggleterm-manager.nvim",
    dependencies = {
      "akinsho/nvim-toggleterm.lua",
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
    },
  },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "echasnovski/mini.nvim",
      "nvim-tree/nvim-web-devicons",
      "echasnovski/mini.icons",
    }, -- if you use the mini.nvim suite
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make", -- This ensures the plugin is built after being installed
      },
    },
    config = function()
      require("telescope").setup({})
      require("telescope").load_extension("fzf")
    end,
  },
}
