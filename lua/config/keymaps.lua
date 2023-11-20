-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap
local opt = { noremap = true, silent = true }

keymap.set("n", "<leader>h", ":nohlsearch<CR>")
keymap.set("n", "x", '"_x')

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Delete a word backwards
-- keymap.set('n', 'dw', 'vb"_d')

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Tab
keymap.set("n", "<Space>te", ":tabedit<CR>")
keymap.set("n", "<Space>tp", ":tabprevious<CR>")
keymap.set("n", "<Space>tn", ":tabnext<CR>")
keymap.set("n", "<Space>tq", ":tabclose<CR>")

-- Split window
keymap.set("n", "<Space>ws", ":split<Return><C-w>w")
keymap.set("n", "<Space>wv", ":vsplit<Return><C-w>w")
-- Move window
keymap.set("n", "<Space>ww", "<C-w>w")
keymap.set("n", "<Space>wh", "<C-w>h")
keymap.set("n", "<Space>wk", "<C-w>k")
keymap.set("n", "<Space>wj", "<C-w>j")
keymap.set("n", "<Space>wl", "<C-w>l")
keymap.set("n", "<Space>wq", ":close<CR>")

-- Resize window
keymap.set("n", "<Space>w<left>", "<C-w><")
keymap.set("n", "<Space>w<right>", "<C-w>>")
keymap.set("n", "<Space>w<up>", "<C-w>+")
keymap.set("n", "<Space>w<down>", "<C-w>-")
keymap.set("n", "<Space>we", "<C-w>=")
