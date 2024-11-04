return {
  -- config = function()
  require("toggleterm-manager").setup({
    titles = {
      preview = "Preview", -- title of the preview buffer in telescope
      prompt = " Terminals", -- title of the prompt buffer in telescope
      results = "Results", -- title of the results buffer in telescope
    },
    results = {
      fields = { -- fields that will appear in the results of the telescope window
        "state", -- the state of the terminal buffer: h = hidden, a = active
        "space", -- adds space between fields, if desired
        "term_icon", -- a terminal icon
        "term_name", -- toggleterm's display_name if it exists, else the terminal's id assigned by toggleterm
      },
      separator = " ", -- the character that will be used to separate each field provided in results.fields
      term_icon = "", -- the icon that will be used for term_icon in results.fields
    },
    search = {
      field = "term_name", -- the field that telescope fuzzy search will use when typing in the prompt
    },
    sort = {
      field = "term_name", -- the field that will be used for sorting in the telesocpe results
      ascending = true, -- whether or not the field provided above will be sorted in ascending or descending order
    },
  }),
  -- end,
}
