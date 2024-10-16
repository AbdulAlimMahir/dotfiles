return {
  -- Store themes of the world
  "folke/tokyonight.nvim",
  -- "rebelot/kanagawa.nvim",

  -- Themes initials
  lazy = false,
  priority = 1000,

  config = function()
    -- --------------------------
    -- --> Config per Themes <--|
    -- -------------------------
    --|> Tokyonight
    require("tokyonight").setup({
      transparent = true,
      --  terminal_colors = true,
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
        --  sidebars = true and "transparent" or "dark",
        --floats = true and "transparent" or "dark",
      },
      sidebars = { "qf", "help" },
      day_brightness = 0.3,
      hide_inactive_statusline = true,
      dim_inactive = true,
      lualine_bold = true,
    })

    --|> Kanagawa
    -- require("kanagawa").setup({
    --   transparent = true,
    --   compile = true,
    --   undercurl = true,
    --   commentStyle = { italic = true },
    --   functionStyle = {},
    --   keywordStyle = { italic = true },
    --   statementStyle = { bold = true },
    -- })

    -- Let's callout theme for today
    vim.cmd("colorscheme tokyonight-storm")
    -- vim.cmd([[colorscheme kanagawa]])
  end,
}
