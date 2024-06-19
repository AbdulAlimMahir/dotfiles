return {
  -- Store themes of the world
  "folke/tokyonight.nvim",
  -- "rebelot/kanagawa.nvim",
  -- "catppuccin/nvim",
  -- "EdenEast/nightfox.nvim",
  -- "rose-pine/neovim",
  -- "LunarVim/darkplus.nvim",
  -- "Mofiqul/vscode.nvim",

  -- Themes initials
  lazy = false,
  priority = 1000,
  -- ===========================
  -- --> Config per Themes <-- |
  -- ===========================
  config = function()
    --|> Tokyonight
    require("tokyonight").setup({
      transparent = true, -- Enable this to disable setting the background color
      terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
        sidebars = true and "transparent" or "dark",
        --floats = true and "transparent" or "dark",
      },
      sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
      day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
      hide_inactive_statusline = true, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
      dim_inactive = true, -- dims inactive windows
      lualine_bold = true, -- When `true`, section headers in the lualine theme will be bold
    })

    --|>Catppuccin
    -- require("catppuccin").setup({
    --   flavour = "auto", -- latte, frappe, macchiato, mocha
    --   background = { -- :h background
    --     light = "latte",
    --     dark = "mocha",
    --   },
    --   transparent_background = true, -- disables setting the background color.
    --   show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
    --   term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
    --   no_italic = false, -- Force no italic
    --   no_bold = false, -- Force no bold
    --   no_underline = false, -- Force no underline
    --   styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
    --     comments = { "italic" }, -- Change the style of comments
    --     conditionals = { "italic" },
    --     loops = {},
    --     functions = {},
    --     keywords = {},
    --     strings = {},
    --     variables = {},
    --     numbers = {},
    --     booleans = {},
    --     properties = {},
    --     types = {},
    --     operators = {},
    --   },
    --   color_overrides = {},
    --   custom_highlights = {},
    --   default_integrations = true,
    --   integrations = {
    --     cmp = true,
    --     gitsigns = true,
    --     nvimtree = true,
    --     treesitter = true,
    --     notify = true,
    --     mini = {
    --       enabled = true,
    --       indentscope_color = "",
    --     },
    --   },
    -- })

    --|> Kanagawa
    -- require("kanagawa").setup({
    --   compile = true, -- enable compiling the colorscheme
    --   undercurl = true, -- enable undercurls
    --   commentStyle = { italic = true },
    --   functionStyle = {},
    --   keywordStyle = { italic = true },
    --   statementStyle = { bold = true },
    --   typeStyle = {},
    --   transparent = true, -- do not set background color
    --   -- dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
    --   terminalColors = true, -- define vim.g.terminal_color_{0,17}
    --   colors = { -- add/modify theme and palette colors
    --     palette = {},
    --     theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
    --   },
    --   theme = "wave", -- Load "wave" theme when 'background' option is not set
    --   background = { -- map the value of 'background' option to a theme
    --     dark = "wave", -- try "dragon" !
    --     light = "lotus",
    --   },
    -- })

    --|> Nightfox
    -- require("nightfox").setup({
    --   options = {
    --     -- Compiled file's destination location
    --     compile_path = vim.fn.stdpath("cache") .. "/nightfox",
    --     compile_file_suffix = "_compiled", -- Compiled file suffix
    --     transparent = true, -- Disable setting background
    --     terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
    --     dim_inactive = false, -- Non focused panes set to alternative background
    --     module_default = true, -- Default enable value for modules
    --     styles = { -- Style to be applied to different syntax groups
    --       comments = "NONE", -- Value is any valid attr-list value `:help attr-list`
    --       conditionals = "NONE",
    --       constants = "NONE",
    --       functions = "NONE",
    --       keywords = "NONE",
    --       numbers = "NONE",
    --       operators = "NONE",
    --       strings = "NONE",
    --       types = "NONE",
    --       variables = "NONE",
    --     },
    --     inverse = { -- Inverse highlight for different types
    --       match_paren = false,
    --       visual = false,
    --       search = false,
    --     },
    --     modules = { -- List of various plugins and additional options
    --       -- ...
    --     },
    --   },
    --   palettes = {},
    --   specs = {},
    --   groups = {},
    -- })

    --|>Rose-Pine
    -- require("rose-pine").setup({
    --   variant = "auto", -- auto, main, moon, or dawn
    --   dark_variant = "main", -- main, moon, or dawn
    --   dim_inactive_windows = false,
    --   extend_background_behind_borders = true,
    --
    --   enable = {
    --     terminal = true,
    --     legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
    --     migrations = true, -- Handle deprecated options automatically
    --   },
    --
    --   styles = {
    --     bold = true,
    --     italic = true,
    --     transparency = true,
    --   },
    --
    --   groups = {
    --     border = "muted",
    --     link = "iris",
    --     panel = "surface",
    --
    --     error = "love",
    --     hint = "iris",
    --     info = "foam",
    --     note = "pine",
    --     todo = "rose",
    --     warn = "gold",
    --
    --     git_add = "foam",
    --     git_change = "rose",
    --     git_delete = "love",
    --     git_dirty = "rose",
    --     git_ignore = "muted",
    --     git_merge = "iris",
    --     git_rename = "pine",
    --     git_stage = "iris",
    --     git_text = "rose",
    --     git_untracked = "subtle",
    --
    --     h1 = "iris",
    --     h2 = "foam",
    --     h3 = "rose",
    --     h4 = "gold",
    --     h5 = "pine",
    --     h6 = "foam",
    --   },
    -- })

    --|>VSCode
    -- require("vscode").setup({
    --   transparent = true,
    --   italic_comments = true,
    --   underline_links = true,
    --   disable_nvimtree_bg = true,
    --   color_overrides = {
    --     vscLineNumber = "#FFFFFF",
    --   },
    -- })

    --> Let's callout theme for today
    -- vim.cmd("colorscheme tokyonight-storm")
    vim.cmd([[colorscheme tokyonight-storm]])
  end,
}
