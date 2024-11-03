return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Set header
    dashboard.section.header.val = {
      "::::::::::::::::::::::::::::::::::::::::::::::::::",
      "::      ╔╦╗┌─┐┬ ┬┬┬─┐    ╔╗╔┌─┐┌─┐╦  ╦┬┌┬┐      ::",
      "::      ║║║├─┤├─┤│├┬┘    ║║║├┤ │ │╚╗╔╝││││      ::",
      "::      ╩ ╩┴ ┴┴ ┴┴┴└─    ╝╚╝└─┘└─┘ ╚╝ ┴┴ ┴      ::",
      "::::::::::::::::::::::::::::::::::::::::::::::::::",
    }

    -- Set menu
    dashboard.section.buttons.val = {
      dashboard.button("a", "   New File", "<cmd>ene<CR>"),
      -- dashboard.button("e", "   File Explorer", "<cmd>NvimTreeToggle<CR>"),
      dashboard.button("b", "   File Explorer", "<cmd>Telescope file_browser<CR>"),
      dashboard.button("f", "󰈞   Find File", "<cmd>Telescope find_files<CR>"),
      -- dashboard.button("fw", "   Find Word", "<cmd>Telescope live_grep<CR>"),
      dashboard.button("r", "󱋢   Recent Files", "<cmd>Telescope oldfiles<CR>"),
      dashboard.button("sr", "󰙰   Session on CWD", "<cmd>SessionRestore<CR>"),
      -- dashboard.button("L", "󰒲   Lazy", "<cmd>Lazy<CR>"),
      -- dashboard.button("M", "󰟾   Mason", "<cmd>Mason<CR>"),
      dashboard.button("Q", "󰿅   Quit NVIM", "<cmd>qa<CR>"),
    }

    -- Send config to alpha
    alpha.setup(dashboard.opts)

    -- Disable folding on alpha buffer
    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])

    vim.api.nvim_create_autocmd("User", {
      once = true,
      pattern = "LazyVimStarted",
      callback = function()
        local stats = require("lazy").stats()
        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        dashboard.section.footer.val = {
          "",
          -- "---------------------------------------------------",
          "[  ⚡Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" .. "  ]",
          -- "---------------------------------------------------",
        }
        pcall(vim.cmd.AlphaRedraw)
      end,
    })
  end,
}
