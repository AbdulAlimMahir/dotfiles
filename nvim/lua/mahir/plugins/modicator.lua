local M = {
  "mawkler/modicator.nvim",
  event = "BufEnter",
}

function M.config()
  require("modicator").setup({
    show_warnings = false,
    highlights = {
      defaults = {
        bold = true,
        italic = false,
      },
    },
    integration = {
      lualine = {
        enabled = true,
        -- Letter of lualine section to use (if `nil`, gets detected automatically)
        mode_section = "a",
        -- Whether to use lualine's mode highlight's foreground or background
        highlight = "bg",
      },
    },
  })
end

return M
