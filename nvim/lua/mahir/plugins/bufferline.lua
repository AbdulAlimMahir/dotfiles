return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  opts = {
    options = {
      mode = "buffers",
      separator_style = "thick",
      offsets = {
        {
          filetype = "NvimTree",
          text = "󰈞 File Explorer", -- | function ,
          text_align = "center", --| "left" | "right"
          highlight = "Directory",
          separator = true,
        },
      },
    },
  },
}
