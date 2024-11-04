local M = {}
vim.g.mapleader = " "
local map = vim.keymap.set

map("n", "<leader>o", ":<CR>", { desc = "Options" })
map("n", "<leader>oh", ":nohl<CR>", { desc = "󰉥 Clear Highlights" })
map("n", "<leader>ow", ":%s/<C-r><C-w>/", { desc = "Replace cursor Word" })

-- Window Split 󰨑
map("n", "<leader>s", "<C-w>", { desc = "Split Window" })
map("n", "<leader>sv", "<C-w>v", { desc = " Vertical Split" })
map("n", "<leader>sh", "<C-w>s", { desc = " Horizontal Split" })
map("n", "<leader>se", "<C-w>=", { desc = "󰇽 Equal Split" })
map("n", "<leader>sx", ":close<CR>", { desc = "󰱝 Close Split" })

-- Tabs
map("n", "<leader>t", ":<CR>", { desc = "󰓩 Tabs" })
map("n", "<leader>tn", ":tabnew<CR>", { desc = " New Tab" })
map("n", "<leader>tj", ":tabn<CR>", { desc = " Next Tab" })
map("n", "<leader>tl", ":tabp<CR>", { desc = " Previous Tab" })
map("n", "<leader>tx", ":tabclose<CR>", { desc = "󰅙 Current Tab" })
map("n", "<leader>tN", ":tabnew %<CR>", { desc = " Buffer in New Tab" })

-- extra - improved terminal navigation
map("n", "<C-h>", ":wincmd h<cr>", { desc = " Left window navigation" })
map("n", "<C-j>", ":wincmd j<cr>", { desc = " Down window navigation" })
map("n", "<C-k>", ":wincmd k<cr>", { desc = " Up window navigation" })
map("n", "<C-l>", ":wincmd l<cr>", { desc = " Right window navigation" })

-- ,,,,,,,,,,,,,,,,,,,,,,,,,
--[|> PLUGINS KEYMAPS <|]--|
-- ````````````````````````'
--|> auto-sessions 󱣪
map("n", "<leader>w", ":<CR>", { desc = "Auto-Session" })
map("n", "<leader>wr", ":SessionRestore<CR>", { desc = " Restore Session" })
map("n", "<leader>ws", ":SessionSave<CR>", { desc = " Save Session" })

--|> bufferline 
map("n", "<leader>b", ":<CR>", { desc = "Bufferline" })
map("n", "<leader>bh", ":BufferLineCyclePrev<CR>", { desc = " Previous" })
map("n", "<leader>bl", ":BufferLineCycleNext<CR>", { desc = " Next" })
map("n", "<leader>bq", ":bp <BAR> bd #<CR>", { desc = "󰅙 Current" })

--|> Conform 󰗈
map({ "n", "v" }, "<leader>=", function()
  require("conform").format({
    lsp_fallback = true,
    async = false,
    timeout_ms = 1000,
  })
end, { desc = "Format File or Range(v)" })

--|> lazygit 󰊢
map("n", "<leader>g", ":LazyGit<CR>", { desc = "Open LazyGit" })

-- |> Live-Server
map("n", "<leader>L", ":LiveServer<CR>", { desc = "󱜠 Server" })
map("n", "<leader>Ls", ":LiveServerStart<CR>", { desc = " Start Server" })
map("n", "<leader>Lx", ":LiveServerStop<CR>", { desc = " Stop Server" })
map("n", "<leader>LT", ":LiveServerToggle<CR>", { desc = "Toggle Server" })

--|> nvimtree
-- map("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "File Explorer" })
-- map("n", "<leader>ef", ":NvimTreeFindFileToggle<CR>", { desc = "󰈞 Toggle on Buffer" })
-- map("n", "<leader>ec", ":NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })
-- map("n", "<leader>er", ":NvimTreeRefresh<CR>", { desc = " Refresh File Explorer" })

--|> telescope
map("n", "<leader>f", ":Telescope<CR>", { desc = "Telescope" })
map("n", "<leader>fb", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", { desc = "󰈞 Files" })
map("n", "<leader>ff", ":Telescope find_files<CR>", { desc = " Files in CWD" })
map("n", "<leader>fr", ":Telescope oldfiles<CR>", { desc = "󱋢 Recent Files" })
map("n", "<leader>fs", ":Telescope live_grep<CR>", { desc = " String in CWD" })
map("n", "<leader>fc", ":Telescope grep_string<CR>", { desc = "󱄧 Cursor String in CWD" })
map("n", "<leader>ft", ":TodoTelescope<CR>", { desc = " Find ToDos" })

--|> toggleterm.nvim
map("n", "<leader>t", ":ToggleTerm<CR>", { desc = "Terminal" })
map("n", "<leader>tf", ":ToggleTerm direction=float<cr>", { desc = " Float" })
map("n", "<leader>th", ":ToggleTerm size=10 direction=horizontal<cr>", { desc = " Horizontal split" })
map("n", "<leader>tv", ":ToggleTerm size=80 direction=vertical<cr>", { desc = " Vertical split" })

--|> trouble
map("n", "<leader>x", ":Trouble<CR>", { desc = "Troubles Diagnosis" })
map("n", "<leader>xx", ":TroubleToggle<CR>", { desc = "Trouble list" })
map("n", "<leader>xw", ":TroubleToggle workspace_diagnostics<CR>", { desc = "Workspace Diagnostics" })
map("n", "<leader>xd", ":TroubleToggle document_diagnostics<CR>", { desc = "Document Diagnostics" })
map("n", "<leader>xq", ":TroubleToggle quickfix<CR>", { desc = "Quickfix List" })
map("n", "<leader>xl", ":TroubleToggle loclist<CR>", { desc = "Location List" })
map("n", "<leader>xt", ":TodoTrouble<CR>", { desc = "ToDo in Trouble" })

--|> vim-maximizer
map({ "n", "v" }, "<leader>sm", ":MaximizerToggle<CR>", { desc = "Maximize/Minimize a split" })

return M
