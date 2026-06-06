vim.g.mapleader = " "

local map = vim.keymap.set

map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "general copy whole file" })

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line" })
map("i", "<C-e>", "<End>", { desc = "move end of line" })
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })

map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

-- Comment
map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
map("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })

-- Compile mode
map("n", "<leader>R", ":below Compile<CR>")
map("n", "<leader>r", ":below Recompile<CR>")

map("n", ">", ">>", { noremap = true })
map("n", "<", "<<", { noremap = true })

-- Normal mode: move current line down (J) or up (K)
map("n", "J", ":m .+1<CR>==", { noremap = true, silent = true })
map("n", "K", ":m .-2<CR>==", { noremap = true, silent = true })

-- Visual mode: move highlighted block down (J) or up (K)
map("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
map("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
