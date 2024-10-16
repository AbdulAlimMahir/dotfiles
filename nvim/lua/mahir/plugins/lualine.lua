local M = {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "AndreM222/copilot-lualine",
  },
}

function M.config()
  local colors = {
    bg = "#282835",
    fg = "#cdd6f4",
    yellow = "#f9e2af",
    cyan = "#89dceb",
    darkblue = "#45475a",
    green = "#a6e3a1",
    orange = "#fab387",
    violet = "#cba6f7",
    magenta = "#f5c2e7",
    blue = "#89b4fa",
    red = "#f38ba8",
  }
  local mode_color = {
    n = colors.red,
    v = colors.blue,
    i = colors.green,
    r = colors.cyan,
    t = colors.red,
    [""] = colors.blue,
    V = colors.blue,
    c = colors.magenta,
    no = colors.red,
    s = colors.orange,
    S = colors.orange,
    [""] = colors.orange,
    ic = colors.yellow,
    R = colors.violet,
    Rv = colors.violet,
    cv = colors.red,
    ce = colors.red,
    rm = colors.cyan,
    ["r?"] = colors.cyan,
    ["!"] = colors.red,
  }
  local mode_icon = {
    n = "",
    v = "",
    i = "",
    r = "󰛔",
    t = "",
    V = "V",
    c = "c",
    no = "no",
    s = "s",
    S = "S",
    ic = "ic",
    R = "R",
    Rv = "Rv",
    cv = "cv",
    ce = "ce",
    rm = "rm",
  }

  local Mode = {
    function()
      -- return vim.fn.mode():sub(1, 1)
      return mode_icon[vim.fn.mode()]
    end,
    color = function()
      -- auto change color according to neovims mode
      return { fg = "#16161D", bg = mode_color[vim.fn.mode()] }
    end,
    padding = { left = 1, right = 1 },
  }

  local bufferName = {
    "filename",
    color = { fg = "#CFC9C2" },
  }

  local branch = {
    "branch",
    icon = "",
    color = { fg = colors.red },
  }

  local changes = {
    "diff",
    colored = true,
    symbols = { added = " ", modified = " ", removed = " " },
  }

  local diagnos = {
    "diagnostics",
    sources = { "nvim_diagnostic", "coc" },
    sections = { "info", "hint", "error", "warn" },
    symbols = { error = " ", warn = " ", info = " ", hint = "󰛨 " },
    colored = true, -- Displays diagnostics status in color if set to true.
    -- diagnostics_color = {
    --   color_error = { fg = colors.red },
    --   color_warn = { fg = colors.yellow },
    --   color_info = { fg = colors.blue },
    --   color_hint = { fg = colors.green },
    -- },
    always_visible = false, -- Show diagnostics even if there are none.
    update_in_insert = true,
  }

  local LSP = function()
    local clients = vim.lsp.get_clients()
    if next(clients) == nil then
      return "󱏎"
    end

    local c = {}
    for _, client in pairs(clients) do
      table.insert(c, client.name)
    end
    return "󰒓 " .. table.concat(c, " + ")
  end

  local lineNumber = {
    function()
      -- current line number : total line
      return string.format("%d:%d", vim.fn.line("."), vim.fn.line("$"))
    end,
    padding = { left = 1, right = 1 },
  }

  require("lualine").setup {
    options = {
      component_separators = { left = "", right = "" },
      section_separators = { left = " ", right = " " },
      ignore_focus = { "NvimTree" },
    },
    sections = {
      lualine_a = { Mode },
      lualine_b = { bufferName },
      lualine_c = { branch, changes },
      -- lualine_x = { diff, "copilot", filetype },
      lualine_x = { "searchcount", diagnos },
      lualine_y = { LSP },
      lualine_z = { lineNumber },
    },
    -- extensions = { "quickfix", "man", "fugitive" },
  }
end
return M