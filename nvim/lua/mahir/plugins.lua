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
  {
    "junegunn/fzf.vim",
    dependencies = { "junegunn/fzf" },
  },

  -- telescope fzf
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make", -- This ensures the plugin is built after being installed
      },
    },
    config = function()
      require("telescope").setup()
      require("telescope").load_extension("fzf")
    end,
  },

  -- LuaRocks
  {
    "vhyrro/luarocks.nvim",
    priority = 1000, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
    config = true,
  },

  -- Mini.Icons
  { "echasnovski/mini.icons", version = "*" },

  -- Vim-Fugitive
  { "tpope/vim-fugitive" }
  -- Neotree
  -- {
  --   "nvim-neo-tree/neo-tree.nvim",
  --   branch = "v3.x",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
  --     "MunifTanjim/nui.nvim",
  --     "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  --   },
  -- },
}
