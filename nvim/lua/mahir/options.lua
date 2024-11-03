local options = {
  backup = false, -- creates a backup file
  clipboard = "unnamedplus", -- allows neovim to access the system clipboard
  cmdheight = 0, -- more space in the neovim command line for displaying messages
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0, -- so that `` is visible in markdown files
  fileencoding = "utf-8", -- the encoding written to a file
  hlsearch = true, -- highlight all matches on previous search pattern
  ignorecase = true, -- ignore case in search patterns
  mouse = "a", -- allow the mouse to be used in neovim
  pumheight = 10, -- pop up menu height
  pumblend = 10, --
  showmode = false, -- we don't need to see things like, -- INSERT, -- anymore
  showtabline = 1, -- always show tabs
  smartcase = true, -- smart case
  smartindent = true, -- make indenting smarter again
  splitbelow = true, -- force all horizontal splits to go below current window
  splitright = true, -- force all vertical splits to go to the right of current window
  swapfile = false, -- creates a swapfile
  termguicolors = true, -- set term gui colors (most terminals support this)
  timeoutlen = 1000, -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true, -- enable persistent undo
  updatetime = 100, -- faster completion (4000ms default)
  writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true, -- convert tabs to spaces
  shiftwidth = 2, -- the number of spaces inserted for each indentation
  tabstop = 2, -- insert 2 spaces for a tab
  cursorline = true, -- highlight the current line
  number = true, -- set numbered lines
  relativenumber = true, -- set relative numbered lines
  showcmd = true, --
  ruler = false, --
  numberwidth = 2, -- set number column width to 2 {default 4}
  signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
  wrap = false, -- display lines as one long line
  scrolloff = 0, --
  sidescrolloff = 8, --
  guifont = "JetBrainsMono Nerd Font:h18", -- the font used in graphical neovim applications
  title = true, --
  titlelen = 0, -- do not shorten title
  -- colorcolumn = "80",
  colorcolumn = "120",
  autoindent = true,
  fillchars = vim.opt.fillchars + "eob: ",
}
for key, value in pairs(options) do
  vim.opt[key] = value
end

vim.o.sessionoptions = vim.o.sessionoptions .. ",localoptions"

vim.opt.shortmess:append("c")
vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd("set iskeyword+=-")

vim.g.completion_chain_complete_list = {
  org = {
    { mode = "omni" },
  },
}
-- add additional keyword chars
vim.cmd("autocmd FileType org setlocal iskeyword+=:,#,+")
vim.g.luarocks_python = "luarocks" -- Or provide the full path to the `luarocks` executable if needed
vim.g.netrw_banner = 0
vim.g.netrw_mouse = 2
