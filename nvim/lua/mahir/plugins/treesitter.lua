return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function()
    local treesitter = require("nvim-treesitter.configs")
    treesitter.setup({
      ensure_installed = {
        "html",
        "css",
        "scss",
        "javascript",
        "json",
        "typescript",
        "tsx",
        "sql",
        "php",
        "yaml",
        "prisma",
        "markdown",
        "markdown_inline",
        "svelte",
        "graphql",
        "bash",
        "lua",
        "vim",
        "dockerfile",
        "gitignore",
        "go",
        "http",
        "java",
        "rust",
        "query",
        "vimdoc",
        "astro",
        "c",
        "cpp",
        "fish",
      },

      ignore_install = { "" },
      sync_install = false,
      auto_install = true,
      modules = {},

      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true },
      -- enable autotagging (w/ nvim-ts-autotag plugin)
      autotag = { enable = true },
      autopairs = { enable = true },
      -- List of parsers to ignore installing (or "all")
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    })
  end,
}
