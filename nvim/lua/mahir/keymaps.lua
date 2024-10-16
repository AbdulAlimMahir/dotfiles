local M = {}

vim.g.mapleader = " "
local keymap = vim.keymap.set

---------------------------------------------------------------------------
keymap("n", "<leader>n", ":nohl<CR>", { desc = "Clear search highlights" })
keymap("n", "<leader>%", ":source %<CR>", { desc = "󰑓 Config" })

-- increment/decrement numbers
keymap("n", "<leader>+", "<C-a>", { desc = " Increment number" })
keymap("n", "<leader>-", "<C-x>", { desc = " Decrement number" })

--[]window management
keymap("n", "<leader>s", "<C-w>", { desc = "Split Window" })
keymap("n", "<leader>sv", "<C-w>v", { desc = "Split Vertically" })
keymap("n", "<leader>sh", "<C-w>s", { desc = "Split Horizontally" })
keymap("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- Tabs
-- keymap("n", "<leader>t", "<cmd><CR>", { desc = "Tabs" })
-- keymap("n", "<leader>tn", "<cmd>tabnew<CR>", { desc = "Open New Tab" })
-- keymap("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
-- keymap("n", "<leader>tl", "<cmd>tabn<CR>", { desc = "Go to next tab" })
-- keymap("n", "<leader>th", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
-- keymap("n", "<leader>tN", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- toggleterm.nvim
keymap("n", "<leader>t", "<cmd>ToggleTerm<CR>", { desc = "Terminal" })
keymap("n", "<leader>tt", "<cmd>ToggleTerm direction=float<cr>", { desc = " Float" })
keymap("n", "<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", { desc = " Horizontal split" })
keymap("n", "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>", { desc = " Vertical split" })
keymap("n", "<F7>", "<cmd>ToggleTerm<cr>", { desc = "F7 Terminal" })
-- extra - improved terminal navigation
keymap("n", "<C-h>", "<cmd>wincmd h<cr>", { desc = " Left window navigation" })
keymap("n", "<C-j>", "<cmd>wincmd j<cr>", { desc = " Down window navigation" })
keymap("n", "<C-k>", "<cmd>wincmd k<cr>", { desc = " Up window navigation" })
keymap("n", "<C-l>", "<cmd>wincmd l<cr>", { desc = " Right window navigation" })

-- ToggleTerm-Manager
-- keymap =
--   { -- key mappings bound inside the telescope window
--     i = {
--       ["<CR>"] = { action = actions.toggle_term, exit_on_action = true }, -- toggles terminal open/closed
--       ["<C-i>"] = { action = actions.create_term, exit_on_action = true }, -- creates a new terminal buffer
--       ["<C-d>"] = { action = actions.delete_term, exit_on_action = true }, -- deletes a terminal buffer
--       ["<C-r>"] = { action = actions.rename_term, exit_on_action = true }, -- provides a prompt to rename a terminal
--     },
--   },
--[|> PLUGINS KEYMAPS <|]--
--|> auto-sessions
keymap("n", "<leader>w", "<cmd><CR>", { desc = "Auto-Session" })
keymap("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "Restore Session" })
keymap("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "Save Session" })

--|> bufferline
keymap("n", "<leader>b", "<cmd>ToggleBufferLine<CR>", { desc = "Bufferline" })
keymap("n", "<leader>bh", "<cmd>BufferLineCyclePrev<CR>", { desc = "󰓩 Previous" })
keymap("n", "<leader>bl", "<cmd>BufferLineCycleNext<CR>", { desc = "󰓩 Next" })
keymap("n", "<leader>bq", "<cmd>bp <BAR> bd #<CR>", { desc = "󰅙 Close Current Buffer" })

--|> formatting
keymap("n", "<leader>m", "<cmd><CR>", { desc = "Format File" })

--|> lazygit
keymap("n", "<leader>l", "<cmd><CR>", { desc = "Trigger Linting" })
keymap("n", "<leader>lg", "<cmd>LazyGit<CR>", { desc = "󰊢 Open LazyGit" })

--|> lspconfig
keymap("n", "<leader>c", "<cmd><CR>", { desc = "Code Actions" })

-- |> Live-Server
keymap("n", "<leader>L", "<cmd>LiveServer<CR>", { desc = "Live Server" })
keymap("n", "<leader>Ls", "<cmd>LiveServerStart<CR>", { desc = " Start Server" })
keymap("n", "<leader>Lx", "<cmd>LiveServerStop<CR>", { desc = " Stop Server" })
keymap("n", "<leader>LT", "<cmd>LiveServerToggle<CR>", { desc = "󱨦 Toggle Server" })

--|> nvimtree
keymap("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "File Explorer" })
keymap("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "󰈞 Toggle on Buffer" })
keymap("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })
keymap("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = " Refresh File Explorer" })

--|> nvim-treesitter-text-object

--|> substitute

--|> telescope
keymap("n", "<leader>f", "<cmd>Telescope<CR>", { desc = "Fuzzy Find" })
keymap("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Files in CWD" })
keymap("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", { desc = "Recent Files" })
keymap("n", "<leader>fs", "<cmd>Telescope live_grep<CR>", { desc = "String in CWD" })
keymap("n", "<leader>fc", "<cmd>Telescope grep_string<CR>", { desc = "String under cursor in CWD" })
keymap("n", "<leader>ft", "<cmd>TodoTelescope<CR>", { desc = "Find ToDos" })

--|> trouble
keymap("n", "<leader>x", "<cmd><CR>", { desc = "Trouble Diagnosis" })

return M
