local M = {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "AndreM222/copilot-lualine",
  },
}

function M.config()
  local colors = {
    bg = "#2A2A37",
    fg = "#DCD7BA",
    red = "#FF5D62",
    green = "#98BB6C",
    blue = "#7E9CD8",
    yellow = "#E6C384",
    orange = "#FFA066",
    cyan = "#7FB4CA",
    violet = "#957FB8",
    magenta = "#D27E99",
  }
  local mode_color = {
    -- n = colors.red,
    -- v = colors.blue,
    -- i = colors.green,
    -- r = colors.cyan,
    -- t = colors.red,
    -- V = colors.blue,
    -- [""] = colors.blue,
    -- c = colors.red,
    -- no = colors.red,
    -- s = colors.orange,
    -- S = colors.orange,
    -- [""] = colors.orange,
    -- ic = colors.yellow,
    -- R = colors.violet,
    -- Rv = colors.violet,
    -- cv = colors.red,
    -- ce = colors.red,
    -- rm = colors.cyan,
    -- ["r?"] = colors.cyan,
    -- ["!"] = colors.red,
  }
  local mode_icon = {
    n = "", -- 
    v = "",
    i = "",
    r = "󰛔",
    t = "",
    V = "󰝠",
    c = "❯",
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
    -- padding = { left = 1, right = 1 },
  }

  local bufferName = {
    "filename",
    color = { fg = "#CFC9C2" },

    file_status = false, -- Displays file status (readonly status, modified status)
    newfile_status = false, -- Display new file status (new file means no write after created)
    shorting_target = 40, -- Shortens path to leave 40 spaces in the window
    symbols = {
      modified = "", -- Text to show when the file is modified.
      readonly = "󰌾", -- Text to show when the file is non-modifiable or readonly.
      unnamed = "", -- Text to show for unnamed buffers.
      newfile = "󰎔", -- Text to show for newly created file before first write
    },
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
    diagnostics_color = {
      color_error = { fg = colors.red },
      color_warn = { fg = colors.orange },
      color_info = { fg = colors.cyan },
      color_hint = { fg = colors.green },
    },
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
    color = function()
      -- auto change color according to neovims mode
      return { fg = "#16161D", bg = mode_color[vim.fn.mode()] }
    end,
    -- padding = { left = 1, right = 1 },
  }

  local lazyUpdate = {
    require("lazy.status").updates,
    cond = require("lazy.status").has_updates,
  }
  -- check for mason package upgrades
  local function lualine_mason_updates()
    local registry = require("mason-registry")
    local installed_packages = registry.get_installed_package_names()
    local upgrades_available = false
    local packages_outdated = 0
    function myCallback(success, result_or_err)
      if success then
        upgrades_available = true
        packages_outdated = packages_outdated + 1
      end
    end

    for _, pkg in pairs(installed_packages) do
      local p = registry.get_package(pkg)
      if p then
        p:check_new_version(myCallback)
      end
    end

    if upgrades_available then
      return packages_outdated
    else
      return ""
    end
  end
  local MasonUpdate = {
    lualine_mason_updates,
    icon = "󰟾 ",
    on_click = function()
      vim.cmd("Mason")
    end,
  }
  require("lualine").setup({
    options = {
      component_separators = { left = "|", right = "|" },
      section_separators = { left = "", right = "" },
      ignore_focus = { "NvimTree" },
    },
    sections = {
      lualine_a = { Mode },
      lualine_b = { bufferName },
      lualine_c = { branch, changes },
      lualine_x = { "searchcount" },
      lualine_y = { diagnos, lazyUpdate, MasonUpdate, LSP },
      lualine_z = { lineNumber },
    },
  })
end
return M
