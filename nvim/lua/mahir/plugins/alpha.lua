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
      dashboard.button("e", "  | New File", "<cmd>ene<CR>"),
      dashboard.button("SPC ee", "  | File Explorer", "<cmd>NvimTreeToggle<CR>"),
      dashboard.button("SPC ff", "󰱼  | Find File", "<cmd>Telescope find_files<CR>"),
      dashboard.button("SPC fs", "  | Find Word", "<cmd>Telescope live_grep<CR>"),
      dashboard.button("SPC wr", "󰁯  | Session on CWD", "<cmd>SessionRestore<CR>"),
      dashboard.button("L", "󰒲  | Lazy", "<cmd>Lazy<CR>"),
      dashboard.button("M", "  | Mason", "<cmd>Mason<CR>"),
      dashboard.button("q", "󰿅  | Quit NVIM", "<cmd>qa<CR>"),
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
        dashboard.section.footer.val = "⚡Neovim loaded "
          .. stats.loaded
          .. "/"
          .. stats.count
          .. " plugins in "
          .. ms
          .. "ms"
        pcall(vim.cmd.AlphaRedraw)
      end,
    })
  end,
}
