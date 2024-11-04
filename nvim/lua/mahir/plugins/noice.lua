return {
  "folke/noice.nvim",
  lazy = false,
  config = function()
    require("noice").setup({
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      presets = {
        bottom_search = false, -- use a classic bottom cmdline for search
        command_palette = false, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = true, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = true, -- add a border to hover docs and signature help
      },
      routes = {
        {
          view = "notify",
          filter = { event = "msg_showmode" },
        },
      },
      cmdline = {
        view = "cmdline_popup", -- cmdline | cmdline_popup
        format = {
          cmdline = { pattern = "^:", icon = "❯", lang = "vim", title = " cmdline " },
        },
      },
      views = {
        cmdline_popup = {
          position = {
            row = "50%",
            col = "50%",
          },
          size = {
            height = "auto",
            width = "30%",
          },
          border = {
            -- paadding = { 1, 1 },
            style = "single",
          },
        },
        popupmenu = {
          enabled = true, -- enables the Noice popupmenu UI
          backend = "cmp", -- backend to use to show regular cmdline completions
          relative = "editor",
          position = {
            row = "70%",
            col = "50%",
          },
          size = {
            height = "25%",
            width = "31%",
          },
          border = {
            style = "single",
            -- padding = { 0, 2 },
          },
          win_options = {
            winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
          },
        },
      },
    })
  end,
}
