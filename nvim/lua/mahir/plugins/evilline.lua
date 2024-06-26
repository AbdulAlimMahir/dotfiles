return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VimEnter",
    config = function()
      -- Eviline config for lualine
      local lualine = require("lualine")

      -- Color table for highlights
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
        i = colors.green,
        v = colors.blue,
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
        r = colors.cyan,
        rm = colors.cyan,
        ["r?"] = colors.cyan,
        ["!"] = colors.red,
        t = colors.red,
      }
      local mode_icon = {
        n = "",
        v = "",
        i = "",
        r = "󰛔",
        t = "",
      }

      local conditions = {
        buffer_not_empty = function()
          return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
        end,
        hide_in_width = function()
          return vim.fn.winwidth(0) > 80
        end,
        check_git_workspace = function()
          local filepath = vim.fn.expand("%:p:h")
          local gitdir = vim.fn.finddir(".git", filepath .. ";")
          return gitdir and #gitdir > 0 and #gitdir < #filepath
        end,
      }

      -- Config
      local config = {
        options = {
          -- Disable sections and component separators
          component_separators = "",
          section_separators = "",
          theme = {
            normal = { c = { fg = colors.fg, bg = colors.bg } },
            cmd = { c = { fg = colors.fg, bg = colors.bg } },
            inactive = { c = { fg = colors.fg, bg = colors.bg } },
          },
          disabled_filetypes = { "NvimTree", "alpha" },
        },
        sections = {
          -- these are to remove the defaults
          lualine_a = {},
          lualine_b = {},
          lualine_y = {},
          lualine_z = {},
          -- These will be filled later
          lualine_c = {},
          lualine_x = {},
        },
        inactive_sections = {
          -- these are to remove the defaults
          lualine_a = {},
          lualine_b = {},
          lualine_y = {},
          lualine_z = {},
          lualine_c = {},
          lualine_x = {},
        },
      }

      -- Inserts a component in lualine_c at left section
      local function ins_left(component)
        table.insert(config.sections.lualine_c, component)
      end

      -- Inserts a component in lualine_x ot right section
      local function ins_right(component)
        table.insert(config.sections.lualine_x, component)
      end

      -- ins_left({
      --   function()
      --     return ""
      --   end,
      --   color = { fg = "#CFC9C2", bg = "#00000000" },
      --   padding = { left = 0, right = 1 }, -- We don't need space before this
      -- })

      ins_left({
        -- mode component
        function()
          -- return vim.fn.mode():sub(1, 1)
          return mode_icon[vim.fn.mode()]
        end,
        color = function()
          -- auto change color according to neovims mode
          return { fg = "#16161D", bg = mode_color[vim.fn.mode()] }
        end,
        -- padding = { right = 1 },
      })

      -- ins_left({
      -- 	-- filesize component
      -- 	"filesize",
      -- 	cond = conditions.buffer_not_empty,
      -- })

      ins_left({
        "filename",
        cond = conditions.buffer_not_empty,
        color = { fg = "#CFC9C2" },
      })
      -- ins_left({ "progress", color = { fg = colors.fg, gui = "bold" } })

      ins_left({
        "diagnostics",
        sources = { "nvim_diagnostic" },
        symbols = { error = " ", warn = " ", info = " " },
        diagnostics_color = {
          color_error = { fg = colors.red },
          color_warn = { fg = colors.yellow },
          color_info = { fg = colors.cyan },
        },
      })

      -- Insert mid section. You can make any number of sections in neovim :)
      -- for lualine it's any number greater then 2
      ins_left({
        function()
          return "%="
        end,
      })

      ins_right({
        -- Lsp server name .
        function()
          local buf_clients = vim.lsp.get_clients({ bufnr = vim.api.nvim_get_current_buf() })
          if #buf_clients == 0 then
            return "LSP Inactive"
          end

          local formatters = require("conform").list_formatters(0)
          -- local linters = require("lint").linters_by_ft[vim.bo.filetype]

          local buf_client_names = {}
          local buf_formatters = {}
          local buf_linters = {}

          -- add client
          for _, client in pairs(buf_clients) do
            if client.name ~= "null-ls" and client.name ~= "copilot" then
              table.insert(buf_client_names, client.name)
            end
          end

          -- add formatter
          for _, formatter in pairs(formatters) do
            table.insert(buf_formatters, formatter.name)
          end

          vim.list_extend(buf_client_names, buf_formatters)
          vim.list_extend(buf_client_names, buf_linters)

          local unique_client_names = table.concat(buf_client_names, ", ")
          local language_servers = string.format("%s", unique_client_names)

          return language_servers
        end,

        icon = " ",
        color = { fg = colors.fg },
      })

      -- Add components to right sections
      -- ins_right({
      -- 	"o:encoding", -- option component same as &encoding in viml
      -- 	fmt = string.upper, -- I'm not sure why it's upper case either ;)
      -- 	cond = conditions.hide_in_width,
      -- 	color = { fg = colors.green, gui = "bold" },
      -- })

      -- ins_right({
      -- 	"fileformat",
      -- 	fmt = string.upper,
      -- 	icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
      -- 	color = { fg = colors.green, gui = "bold" },
      -- })

      ins_right({
        "branch",
        icon = "",
        color = { fg = colors.violet },
      })

      ins_right({
        "diff",
        -- Is it me or the symbol for modified us really weird
        symbols = { added = " ", modified = " ", removed = " " },
        diff_color = {
          added = { fg = colors.green },
          modified = { fg = colors.orange },
          removed = { fg = colors.red },
        },
        cond = conditions.hide_in_width,
      })

      ins_right({
        function()
          return "▊"
        end,
        color = { fg = "#CFC9C2" },
        -- padding = { left = 1 },
      })

      ins_right({
        function()
          local updates = require("lazy.status").updates
          if updates > 0 then
            return string.format(" %d | ", updates)
          else
            return "Nothing on Lazy"
          end
        end,
      })
      -- {
      --   require('lazy.status').updates, -- show updates from Lazy.nvim
      --   cond = require('lazy.status').has_updates,
      -- },
      ins_right({
        function()
          return string.format("%d:%d", vim.fn.line("."), vim.fn.line("$"))
        end,
      })

      -- Now don't forget to initialize lualine
      lualine.setup(config)
    end,
  },
}
